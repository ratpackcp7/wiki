---
source_url: https://simonwillison.net/2026/Jan/25/the-browser-is-the-sandbox/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-25-simon-willison-browser-is-the-sandbox
---

# The browser is the sandbox

25th January 2026

Post exploring the hypothesis that the modern web browser is the ideal, lightweight sandbox for AI coding agents. References Paul Kinlan's research (Google Developer Advocate) arguing that browsers are purpose-built to run "hostile, untrusted code" the moment a user clicks a URL.

Key pillars for agent sandboxing identified by Kinlan:

1. **Filesystem:** Handled by the File System Access API (currently Chrome-centric).
2. **Network Access:** Managed via CSP (Content Security Policy) headers combined with `<iframe sandbox>`.
3. **Safe Code Execution:** Achieved using WebAssembly (Wasm) within Web Workers.

Kinlan built a proof-of-concept called [Co-do](http://co-do.xyz/) that demonstrates these ideas — users select a local folder and configure an LLM provider via API key. The AI agent uses tools to interact with local files directly through the browser. Provides a "Claude Cowork" style experience without the need for a multi-GB local container.

Technical insight: the **double-iframe technique** is used to enforce network boundaries on the inner frame — a method Willison notes is poorly documented elsewhere.

Willison also highlights the `webkitdirectory` input attribute as a "hidden gem" for browser-based file management that works across Firefox, Safari, and Chrome:

```html
<input type="file" webkitdirectory>
```

This allows the browser read-only access to an entire directory structure at once. Willison created a [webkitdirectory demo](https://tools.simonwillison.net/webkitdirectory) that can map thousands of files, show file trees, and calculate file type distributions instantly without uploading data to a server.

Key takeaways:
- `<iframe sandbox>` is powerful but "thinly documented" — Kinlan's research provides rare, detailed implementation notes
- Browser-native APIs (Wasm, File System Access) can replace heavy virtualization for many AI agent tasks
- These tools allow for local file interaction where file contents are only sent to the chosen AI provider, not a third-party sandbox host
