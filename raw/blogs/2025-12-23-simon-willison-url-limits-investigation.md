---
source_url: https://simonwillison.net/2025/Dec/23/url-limits-investigation/
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-23-simon-willison-url-limits-investigation
---

# Browser URL Size Limits Investigation

Source: https://github.com/simonw/research/tree/main/url-limits-investigation

## Executive Summary of Limits

| Browser Engine | Maximum URL Length | Primary Enforcement Point |
| :--- | :--- | :--- |
| **Chromium** | **2 MB** (2,097,152 bytes) | Mojo IPC boundary (inter-process communication) |
| **Firefox** | **1 MB** (standard) / **512 MB** (absolute) | Configurable via internal preferences |
| **WebKit** | **~2 GB** (INT32_MAX) | General `String::MaxLength` limit |

---

## Engine-Specific Details

### 1. Chromium
Chromium enforces its limit primarily when URLs are passed between different processes. If a URL exceeds this limit, it is silently replaced with an empty, invalid URL.

*   **Source File:** `url/url_constants.h`
*   **Code Snippet:**
    ```c
    // Max GURL length passed between processes.
    inline constexpr size_t kMaxURLChars = 2 * 1024 * 1024;
    ```

### 2. Firefox (Gecko)
Firefox utilizes a tiered approach with configurable preferences.

*   **Standard URL Limit (1 MB):** Default for most operations.
*   **Absolute URL Limit (512 MB):** The hard ceiling for URL length.
*   **History/Bookmarks Limit (2,000 chars):** A much lower limit applied to storage.

### 3. WebKit (Safari)
WebKit does not have a specific "URL limit." Instead, URLs are bound by the maximum size of a `WTF::String`.

*   **Limit:** `2,147,483,647` bytes (~2 GB).

---

## Key Observations
*   **The "2KB Myth":** The widely cited 2,048-character limit is obsolete for modern browser engines.
*   **Contextual Enforcement:** Limits change based on whether the URL is being parsed, stored in history, or sent between processes.
*   **Silent Failures:** In Chromium, exceeding the limit results in the URL becoming "empty and invalid" during process transfer.
*   **Practical Constraints:** Real-world usage is limited by server-side header size limits (often 8KB-16KB), available system memory, and network intermediary constraints.

Posted 23rd December 2025 at 5:38 pm.

This is a **research** by Simon Willison.