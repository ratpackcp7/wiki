---
source_url: https://simonwillison.net/2026/Jan/19/scaling-long-running-autonomous-coding/
fetched: 2026-04-11T12:24:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-19-simon-willison-scaling-long-running-autonomous-coding
---

# Scaling Long-Running Autonomous Coding: The FastRender Project

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/19/scaling-long-running-autonomous-coding/)  
**Date:** January 19, 2026  
**Key Topic:** Cursor's experiment in using massive agent swarms to build a web browser from scratch.

---

## 1. The Experiment: Scaling Agent Swarms
Wilson Lin at **Cursor** conducted an experiment to test the limits of autonomous coding by running hundreds of concurrent agents on a single project.

*   **Scale:** Hundreds of concurrent agents, 1 million+ lines of code, 1,000+ files, and trillions of tokens.
*   **Duration:** Approximately one week of continuous execution.
*   **Architecture:** 
    *   **Planners & Sub-planners:** Created and distributed tasks.
    *   **Workers:** Executed specific coding tasks.
    *   **Judge Agent:** Evaluated each cycle to determine if the project goals were met.
*   **Reference Material:** The system included **WhatWG and CSS-WG specifications** as Git submodules within the repository to provide agents with ground-truth technical references.

## 2. The Test Case: "FastRender" Browser
To push the system, Cursor tasked the agents with building a web browser from scratch. This is significant because browser engines are considered among the most complex software projects in existence.

### Build Instructions (macOS/Rust)
Despite initial skepticism regarding the project's viability, Willison successfully built and ran the browser using the following commands:

```bash
cd /tmp
git clone https://github.com/wilsonzlin/fastrender
cd fastrender
git submodule update --init vendor/ecma-rs
cargo run --release --features browser_ui --bin browser
```

### Performance & Results
*   **Functionality:** The browser successfully renders complex sites like Google and Simon Willison's blog.
*   **Visual Fidelity:** Legible and "mostly correct," though rendering glitches exist (e.g., unstyled buttons, misaligned icons, and incorrect background image rendering for CSS quotes).
*   **Authenticity:** The presence of unique rendering glitches confirms the agents did not simply wrap an existing engine (like Chromium or WebKit) but built a custom one.

## 3. Key Insights & Predictions
*   **Accelerated Timeline:** Willison previously predicted an AI-built browser by 2029; this experiment suggests the timeline may be three years ahead of schedule.
*   **The "Cheat Code":** Willison notes that **conformance suites** (existing test batteries for web standards) are the key to making such complex AI-led projects successful.
*   **Emerging Competition:** This is the second AI-assisted browser engine to appear recently, following the [HiWave browser](https://github.com/hiwavebrowser/hiwave) (also written in Rust).
*   **Current Status:** While not yet ready to compete with Chrome or Firefox, the speed and capability of the result are described as "very surprising."

## 4. Key Excerpts
> "This post describes what we've learned from running hundreds of concurrent agents on a single project, coordinating their work, and watching them write over a million lines of code and trillions of tokens." — *Wilson Lin, Cursor*

> "You can tell they're not just wrapping an existing rendering engine because of those very obvious rendering glitches, but the pages are legible and look mostly correct." — *Simon Willison*

---
*Note: Simon Willison later published a [47-minute follow-up interview](https://simonwillison.net/2026/Jan/23/fastrender/) with Wilson Lin on January 23, 2026.*
