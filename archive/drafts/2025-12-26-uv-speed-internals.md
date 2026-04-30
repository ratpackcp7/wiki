---
title: "uv Speed Internals: HTTP Range Requests + u64 Version Packing"
created: 2026-04-11
updated: 2026-04-11
type: draft
tags: [python, uv, astral, packaging, performance]
sources:
  - url: https://github.com/simonw/research/tree/main/http-range-wheel-metadata
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/26/how-uv-got-so-fast/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# uv Speed Internals

## The principle

uv isn't fast "because Rust." Its speed comes from two specific architectural optimizations that reduce network I/O and CPU work during dependency resolution. Understanding them explains why uv can't be replicated by just rewriting pip in Rust.

## Why it matters for Chris

Chris uses uv exclusively for Python project management (empower, hermes-agent, all acerserver projects). These internals explain why `uv sync` feels instant compared to `pip install` — and why uv will stay fast even as dependency trees grow.

## Key optimizations

### 1. HTTP Range Requests for Wheel Metadata

**Problem:** pip downloads entire `.whl` files (often 10-40MB) just to read the `METADATA` file (usually 3-15KB).

**Solution:** uv exploits ZIP file structure. The Central Directory (file index) lives at the **end** of the archive. uv:
1. Fetches the last ~16KB via HTTP Range request → finds EOCD
2. Parses EOCD → gets METADATA file offset
3. Fetches only the METADATA bytes via a second Range request

**Result:** 70-99% bandwidth reduction per wheel. A 40MB Playwright wheel requires only 18KB of downloads.

**Fallback chain:** PEP 658 (server-provided metadata) → HTTP Range → Full download → Build from source

### 2. u64 Version Packing

**Problem:** Dependency resolution requires millions of version string comparisons. String parsing is slow.

**Solution:** uv packs PEP 440 version strings into `u64` integers:

```
Bit layout:
[63-48] Major (16 bits)
[47-40] Minor (8 bits)
[39-32] Patch (8 bits)
[31-24] Fourth segment (8 bits)
[23-20] Suffix kind (Dev=1, Alpha=2, Beta=3, RC=4, Final=5, Post=7)
[19-0]  Suffix version number
```

**Result:** Version comparison becomes a single integer comparison — O(1) instead of string parsing. Covers 90.87% of all PyPI versions.

**Example:**
```
1.0.0a1     → 0x0001000000200001
1.0.0       → 0x0001000000500000
1.0.0.post1 → 0x0001000000700001
```

## Chris's preferences

- See `chris-preferences.md#Python` for Chris's Python stance.
- uv is the default Python tool — no pip, no virtualenv, no poetry.
- Last sync with chris-preferences: 2026-04-11

## Sources

- [simonw/research: HTTP Range Requests for Wheel Metadata](https://github.com/simonw/research/tree/main/http-range-wheel-metadata) — Python prototype replicating uv's range request trick
- [Simon Willison: How uv Got So Fast](https://simonwillison.net/2025/Dec/26/how-uv-got-so-fast/) — analysis linking to Andrew Nesbitt's teardown
