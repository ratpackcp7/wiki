---
source_url: https://simonwillison.net/2026/Feb/15/gwtar/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-gwtar
---

# Gwtar: A Static Efficient Single-File HTML Format

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/15/gwtar/)  
**Authors of Gwtar:** Gwern Branwen and Said Achmiz  
**Date:** February 15, 2026

## Overview
**Gwtar** is a novel project designed to combine large numbers of assets (images, media, etc.) into a single archived HTML file. Unlike traditional single-file formats that can become bloated and slow to load, Gwtar allows for **efficient lazy loading** of assets from within the archive itself.

## How It Works: The "Trick"
The format uses a combination of browser APIs and uncompressed data to manage large file sizes:

1.  **Early Termination:** The page fires `window.stop()` early in the document. This prevents the browser from automatically downloading the entire (potentially massive) file at once.
2.  **Inline Tar Data:** Following the `window.stop()` call and the `<!-- GWTAR END -->` comment, the file contains uncompressed **inline tar data**.
3.  **Lazy Loading via Range Requests:** The JavaScript loaded at the start of the file makes **HTTP range requests** to fetch specific chunks of content from its own tar data only when needed.
4.  **Resource Interception:** The script rewrites asset URLs to `https://localhost/` to force a load failure. It then uses a `PerformanceObserver` to catch these failures and swap in the correct data.

### Key Code Snippet: Resource Handling
```javascript
let perfObserver = new PerformanceObserver((entryList, observer) => {
    resourceURLStringsHandler(entryList.getEntries().map(entry => entry.name));
});
perfObserver.observe({ entryTypes: [ "resource" ] });
```
The `resourceURLStringsHandler` finds the resource in the tar archive (or fetches it via range request) and inserts it into the page using a `blob:` URL.

## Local Usage Restrictions
Due to web browser security restrictions (specifically regarding how browsers handle local file access and range requests), **Gwtar files cannot be opened directly from a local disk** (e.g., `file://` protocol).

### Manual Extraction
If you need to access the contents of a `.gwtar.html` file locally, you must extract the tar archive manually using the following shell command:

```bash
perl -ne'print $_ if $x; $x=1 if /<!-- GWTAR END/' < foo.gwtar.html | tar --extract
```
*After extraction, you can open the resulting `foo.html` file in any browser.*

## Summary of Benefits
*   **Portability:** A single file contains the entire webpage and its assets.
*   **Efficiency:** Supports lazy loading of large media files without downloading the whole archive upfront.
*   **Standardized:** Uses the standard `tar` format for the data payload.
