---
source_url: https://simonwillison.net/2026/Feb/15/interop-2026/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-interop-2026
---

# Launching Interop 2026

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/15/interop-2026/)  
**Date:** February 15, 2026  
**Topic:** Web Browser Interoperability Standards

---

### Overview of Interop 2026
**Interop 2026** is the latest iteration of a collaborative initiative between major tech players—**Apple, Google, Igalia, Microsoft, and Mozilla**. The goal is to ensure a specific set of web platform features reach parity across all major browsers within the calendar year.

### Historical Context & Success
The program has proven highly effective at forcing browser vendors to synchronize their feature support.
*   **Origins:** Started as [Compat 2021](https://web.dev/blog/compat2021) before rebranding to "Interop" in 2022.
*   **Performance:** Dashboards from 2021 through 2026 show a consistent "race to the top."
*   **2025 Results:** By the end of 2025, all major browsers (Chrome, Edge, Firefox, and Safari) converged toward a **95–100% compatibility score** for that year's targeted features.

### Key 2026 Feature Highlights
Simon Willison highlights two specific technical advancements included in the 2026 roadmap:

#### 1. Cross-document View Transitions
Building on 2025's "Same-Document View Transitions," this update allows for seamless, high-quality transitions between different pages on a website.
*   **Impact:** Enables "SPA-style" (Single Page Application) animations on traditional multi-page websites **without requiring JavaScript**.

#### 2. JavaScript Promise Integration for Wasm
This feature is particularly significant for developers working with WebAssembly.
> "JavaScript Promise Integration for Wasm allows WebAssembly to asynchronously 'suspend', waiting on the result of an external promise. This simplifies the compilation of languages like C/C++ which expect APIs to run synchronously."

### Resources & Dashboards
Progress for the initiative is tracked via public dashboards on [web-platform-tests (wpt.fyi)](https://wpt.fyi/interop-2026). These charts provide real-time data on how closely Chrome, Edge, Firefox, and Safari align with the year's established web standards.
