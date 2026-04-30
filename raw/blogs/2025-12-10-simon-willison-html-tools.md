---
source_url: https://simonwillison.net/2025/Dec/10/html-tools/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-10-simon-willison-html-tools
---

# Useful Patterns for Building HTML Tools

Simon Willison defines **HTML tools** as single-file applications combining HTML, JS, and CSS to provide specific utility. Having built over 150 of these (mostly via LLMs), he outlines the architectural patterns that make them successful.

## 1. The Anatomy of an HTML Tool
*   **Single File:** Inline JS and CSS in one HTML file for easy copy-pasting and hosting.
*   **No React:** Avoids build steps. React/JSX adds complexity that slows down LLM generation and increases bugs.
*   **CDN Dependencies:** Load libraries (e.g., PDF.js, Tesseract.js) via cdnjs or jsDelivr.
*   **Small Scope:** Keep code to a few hundred lines so LLMs can easily refactor or rewrite the entire tool from scratch.

## 2. Prototyping and Development
*   Use Claude Artifacts or ChatGPT/Gemini Canvas. Key tip: always include "No React".
*   For complex projects, use Claude Code or Codex CLI agents.

## 3. Data Persistence and State
*   URL Persistence: Store configuration in URL hash.
*   localStorage: For larger data or secrets (store LLM API keys via prompt() call).

## 4. Input/Output Mechanisms
*   Rich Copy and Paste via JavaScript paste events.
*   Local File Access via input type="file".
*   Client-Side Downloads (PNGs, JPEGs, .ics).

## 5. Leveraging the Browser Ecosystem
*   CORS-Enabled APIs (GitHub, iNaturalist, PyPI, Bluesky, Mastodon).
*   Pyodide (Python in browser via WASM) and WebAssembly for porting C/Perl/Rust utilities.

## 6. Remixing and Documentation
*   Use existing tools as LLM context for building new ones.
*   Save prompts and transcripts for tracking evolution.

## Actionable Summary
1. Start Simple: Use LLM to generate single-file utility.
2. Host on GitHub Pages.
3. Use CDNs, not npm.
4. Debug the Clipboard: Build a clipboard-viewer tool.
