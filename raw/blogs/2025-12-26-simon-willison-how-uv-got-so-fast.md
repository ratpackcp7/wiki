---
source_url: https://simonwillison.net/2025/Dec/26/how-uv-got-so-fast/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-26-simon-willison-how-uv-got-so-fast
---

# How uv Got So Fast: Key Insights and Technical Teardown

This post by Simon Willison explores a technical analysis by Andrew Nesbitt on why the Python package manager **uv** significantly outperforms `pip`. The speed is attributed to strategic architectural choices and micro-optimizations rather than just the use of Rust.

## 1. Core Architectural Advantages

Unlike `pip`, which must maintain extensive backwards compatibility, `uv` benefits from:
- **Skipping Legacy History:** It avoids many of the historical complexities of Python packaging that `pip` is required to support.
- **Avoiding `setup.py`:** It leverages modern standards to resolve dependencies without executing arbitrary code via a Python interpreter.

## 2. Key Performance Techniques

### HTTP Range Requests for Metadata

`uv` avoids downloading entire wheel files (which are zip archives) to access metadata. Since zip archives store their file listing at the end, `uv` uses a tiered fallback strategy:
1. **PEP 658:** Try fetching metadata directly.
2. **HTTP Range Requests:** Fetch only the zip central directory from the end of the file.
3. **Full Download:** Only as a last resort.
4. **Build from Source:** Final fallback.

**Example Efficiency:**
In a test extracting metadata from a ~40MB Playwright wheel, the script fetched only **18,760 bytes** instead of the full 40MB — a **100.0% savings** (rounded).

```
[1] HEAD request to get file size... File size: 40,775,575 bytes
[2] Fetching last 16,384 bytes (EOCD + central directory)...
[3] Parsed EOCD: Central directory offset: 40,731,572
[6] Found METADATA: playwright-1.57.0.dist-info/METADATA
[7] Fetching METADATA content (2,376 bytes)...
[8] Decompressed METADATA: 3,453 bytes
```

### Compact Version Representation

`uv` optimizes dependency resolution by packing version numbers into `u64` integers.
- **Speed:** Makes comparison and hashing extremely fast.
- **Coverage:** Over 90% of versions fit into a single `u64`.
- **Sorting Logic:** The integer representation allows for correct semantic version sorting through simple bitwise comparison.

**Sorted Version Examples (Packed u64):**
```
1.0.0a1     (repr=0x0001000000200001)
1.0.0b1     (repr=0x0001000000300001)
1.0.0rc1    (repr=0x0001000000400001)
1.0.0       (repr=0x0001000000500000)
1.0.0.post1 (repr=0x0001000000700001)
```

## 3. Research and Implementation

Simon Willison used an [asynchronous research task](https://simonwillison.net/2025/Nov/6/async-code-research/) (Claude Code) to port these Rust features to Python to verify the logic.

- **Python Script:** A [demonstration script](https://github.com/simonw/research/blob/main/http-range-wheel-metadata/wheel_metadata.py) is available to test metadata extraction via range requests.
- **Usage:** `uv run --with httpx wheel_metadata.py [WHEEL_URL] -v`

## Summary of Findings

| Feature | Impact |
| :--- | :--- |
| **Rust Language** | Provides a fast foundation but is not the sole reason for speed. |
| **Metadata Fetching** | Reduces network I/O by >99% for large wheels using HTTP Range requests. |
| **u64 Packing** | Accelerates millions of version comparisons during dependency resolution. |
| **Modern Standards** | Avoids the overhead of the Python interpreter during the resolution phase. |
