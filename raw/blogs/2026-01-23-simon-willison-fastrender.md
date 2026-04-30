---
source_url: https://simonwillison.net/2026/Jan/23/fastrender/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-23-simon-willison-fastrender
---

# Wilson Lin on FastRender: A Browser Built by Thousands of Parallel Agents

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/23/fastrender/)
**Date:** January 23, 2026
**Key Figure:** Wilson Lin (Engineer at Cursor)

## Overview
FastRender is a research project by Cursor designed to explore the limits of multi-agent coordination. Instead of building a production browser, the team used the immense complexity of a web rendering engine as a "harness" to test how thousands of autonomous agents can collaborate on a single codebase.

---

## Key Project Statistics
*   **Scale:** Peak of ~2,000 agents running concurrently.
*   **Velocity:** Thousands of commits per hour; nearly 30,000 total commits.
*   **Codebase:** Over 1 million lines of Rust code written in a few weeks.
*   **Duration:** The longest fully autonomous run lasted approximately one week without human intervention.
*   **Models Used:** Claude Opus 4.5, GPT-5.1, and GPT-5.2.

---

## Technical Architecture & Strategy

### 1. The Multi-Agent Harness
The system uses a tree structure to manage labor:
*   **Planning Agents:** Break down high-level instructions into specific tasks.
*   **Worker Agents:** Execute the tasks (coding, testing, debugging).
*   **Infrastructure:** Large machines running ~300 agents each.
> "The simple approach we took with the infrastructure was to have a large machine run one of these multi-agent harnesses... agents spend a lot of time thinking, and not just running tools."

### 2. Minimizing Merge Conflicts
Despite 2,000 agents working simultaneously, merge conflicts were rare. The planning agents effectively modularized the work into non-overlapping chunks.
> "The harness itself is able to quite effectively split out and divide the scope and tasks such that it tries to minimize the amount of overlap of work."

### 3. Feedback Loops & Specifications
To maintain autonomy, agents were provided with:
*   **Git Submodules of Specs:** Included `csswg-drafts`, `tc39-ecma262`, `whatwg-dom`, and `whatwg-html`.
*   **Visual Feedback:** GPT-5.2 (a vision model) took screenshots of rendered pages and compared them against "golden samples" to detect regressions.
*   **Compiler Strictness:** The Rust compiler provided immediate verification that was essential for autonomous progress.

---

## Surprising Agent Behaviors

### Throughput over Correctness
The system allowed for "stable rates of error." If a commit introduced a small syntax error or API change, the team found it was more efficient to let a subsequent agent fix it than to bottleneck the entire swarm on 100% perfect commits.
> "There's a little bit of slack in the system to allow these temporary errors so that the overall system can continue to make progress at a really high throughput."

### Dependency Management
Agents autonomously selected and integrated third-party libraries:
*   **Skia & HarfBuzz:** For graphics and text.
*   **Taffy:** Used for CSS flexbox/grid.
*   **QuickJS:** One agent pulled this in to "unblock itself" because the home-grown JavaScript engine (ecma-rs) wasn't ready yet—mimicking human team dynamics.

### General vs. Specialist Models
Wilson found that general frontier models (GPT-5.1/5.2) performed better than coding-specific models (GPT-5.1-Codex) because the task required following complex "meta-instructions" on how to operate within the autonomous harness.

---

## Current Status of FastRender
*   **Capabilities:** Can render GitHub, Wikipedia, and CNN to a usable degree.
*   **Limitations:** JavaScript is currently behind a feature flag (disabled) as agents are still refining the engine.
*   **Future:** The project serves as a long-term benchmark. As agents improve, they will tackle WebAssembly, WebGPU, and more complex browser specs.

> "We never intended for it to be a production software or usable, but we wanted to observe behaviors of this harness of multiple agents, to see how they could work at scale."
