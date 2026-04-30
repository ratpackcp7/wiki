---
source_url: https://github.com/simonw/research/tree/main/http-range-wheel-metadata
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-26-simonw-research-uv-speed
---

# Research: HTTP Range Requests for Wheel Metadata (and uv Speed)

Source: simonw/research, analyzing techniques from uv (Astral).

## 1. Efficient Metadata Extraction via HTTP Range Requests

Traditional package managers download entire `.whl` files (often megabytes) just to read the `METADATA` file (usually kilobytes). `uv` avoids this by exploiting the ZIP file structure.

### The ZIP File "Trick"
ZIP files store their **Central Directory** (the file index) at the **end** of the archive.
- **Step 1:** Fetch the last ~16KB of the file to locate the End of Central Directory Record (EOCD).
- **Step 2:** Parse the EOCD to find the offset of the `METADATA` file.
- **Step 3:** Perform a second range request to fetch only the specific bytes for that `METADATA` file.

### uv's Implementation (Rust)
The core logic resides in `crates/uv-client/src/remote_metadata.rs`. It uses a `prefetch` strategy:

```rust
// Best guess for the central directory size inside the zip
const CENTRAL_DIRECTORY_SIZE: u64 = 16384;

// Prefetch the back part of the stream
reader
    .prefetch(reader.len().saturating_sub(CENTRAL_DIRECTORY_SIZE)..reader.len())
    .await;

// ... Calculate exact byte range for METADATA ...
reader.inner_mut().get_mut().get_mut()
    .prefetch(offset..offset + size)
    .await;
```

### Performance Impact
A Python recreation (`wheel_metadata.py`) demonstrated significant efficiency gains:
- **Test Case:** `llm-0.28-py3-none-any.whl` (82,559 bytes).
- **Total bytes fetched:** 24,176 bytes.
- **Result:** **70.7% bandwidth savings.**

## 2. Compact Version Representation (u64 Packing)

Comparing millions of PEP 440 version strings during dependency resolution is computationally expensive. `uv` optimizes this by packing version components into a single 64-bit integer (`u64`).

### The Bit Layout
The layout ensures that a standard **integer comparison** yields the correct **version ordering**:

| Bits | Component | Description |
| :--- | :--- | :--- |
| 63-48 | Release[0] | Major version (16 bits) |
| 47-40 | Release[1] | Minor version (8 bits) |
| 39-32 | Release[2] | Patch version (8 bits) |
| 31-24 | Release[3] | Fourth segment (8 bits) |
| 23-20 | Kind | Suffix type (Dev, Alpha, Beta, RC, Final, Post) |
| 19-0 | Version | Suffix version number |

### The "Magic" of Integer Comparison
Because the most significant bits represent the most significant version parts, `uv` can compare versions in O(1) time:

```rust
impl Ord for VersionSmall {
    fn cmp(&self, other: &Self) -> Ordering {
        self.repr.cmp(&other.repr)  // Single integer comparison!
    }
}
```

### PyPI Coverage Statistics
- **92.23%** of versions have segments that fit within the allocated bit widths (u8/u16).
- **90.87%** of all versions on PyPI fit perfectly into this compact `u64` representation.

## 3. Key Takeaways

- **Compound Optimizations:** `uv` uses a tiered fallback: PEP 658 (fastest) → HTTP Range (fast) → Full Stream (slow) → Source Build (slowest).
- **Data Structure Design:** Moving from string parsing to bit-packed integers transforms a bottleneck into a trivial operation.
- **Infrastructure Support:** This technique relies on `Accept-Ranges: bytes` support, which is standard for PyPI and modern CDNs.
- **Actionable Insight:** For any tool processing large remote archives, implementing a "lazy" ZIP reader via HTTP Range requests can reduce bandwidth costs by over 70%.
