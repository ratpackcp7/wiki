---
source_url: https://simonwillison.net/2026/Jan/27/one-human-one-agent-one-browser/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-27-simon-willison-one-human-one-agent-one-browser
---

# One Human + One Agent = One Browser From Scratch

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/27/one-human-one-agent-one-browser/)
**Author:** Simon Willison
**Date:** January 27, 2026

## Overview
Simon Willison highlights a project by **embedding-shapes** titled [one-agent-one-browser](https://github.com/embedding-shapes/one-agent-one-browser). The project was created as a rebuttal to the hype surrounding Cursor's "FastRender" project (which used thousands of agents to produce 1.6 million lines of code). Instead, this project demonstrates that a single human driving a single AI agent can build a functional web browser from scratch in just three days.

## Key Project Statistics
*   **Developer:** One human (embedding-shapes) + one agent (**Codex CLI**).
*   **Timeline:** 3 days.
*   **Codebase:** ~20,000 lines of **Rust**.
*   **Binary Size:** ~1MB (macOS release).
*   **Dependencies:** Zero Rust crate dependencies (uses native system frameworks for image/text rendering on Windows, macOS, and Linux).

## Technical Capabilities
Despite its small footprint and rapid development, the browser is surprisingly capable:
*   **Rendering:** Successfully handles HTML and CSS.
*   **Layout:** Includes a functional [flexbox implementation](https://github.com/embedding-shapes/one-agent-one-browser/blob/0.1.0/src/layout/flex.rs).
*   **Graphics:** Renders CSS gradients and SVG icons (e.g., feed subscription icons).
*   **Limitations:** Some intermittent bugs in PNG rendering were noted during testing.

### Testing the Browser
Willison tested the 1MB macOS binary against his own blog using the following commands:
```bash
chmod 755 ~/Downloads/one-agent-one-browser-macOS-ARM64 
~/Downloads/one-agent-one-browser-macOS-ARM64 https://simonwillison.net/
```
**Result:** "Everything is in the right place, the CSS gradients look good... the code is pretty readable too."

## Insights and Predictions
The success of this project has led Willison to revise his outlook on AI-assisted software engineering:

*   **Efficiency vs. Hype:** While massive multi-agent harnesses (like Cursor's) produce millions of lines of code, a talented engineer with a single agent can achieve a "very solid basic renderer" with significantly less bloat.
*   **Updated 2029 Prediction:** Willison previously predicted a new browser would be built using AI by 2029; he has now upgraded this to:
    > "I think we're going to get a *production-grade* web browser built by a small team using AI assistance by then."

## Related Context (April 2026 Updates)
The blog post also mentions several subsequent developments in the AI space:
*   **Meta:** Released a new model called **Muse Spark** with integrated chat tools.
*   **Anthropic:** Introduced **Project Glasswing**, which restricts the "Claude Mythos" model to security researchers.
*   **Security:** A report on an **Axios supply chain attack** that utilized targeted social engineering.
