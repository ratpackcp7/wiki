---
source_url: https://simonwillison.net/2025/Dec/15/porting-justhtml/
fetched: 2026-04-11T10:03:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-15-simon-willison-porting-justhtml
---

# Porting JustHTML to JavaScript with GPT-5.2

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2025/Dec/15/porting-justhtml/)  
**Date:** December 15, 2025  
**Project:** [simonw/justjshtml](https://github.com/simonw/justjshtml)

## Executive Summary
Simon Willison successfully ported **JustHTML** (a pure-Python HTML5 parser) to JavaScript in **4.5 hours** using **Codex CLI** and **GPT-5.2**. The resulting library, **JustJSHTML**, is dependency-free, passes over 9,200 tests from the `html5lib-tests` suite, and was built with minimal human supervision while Willison performed unrelated family activities.

---

## Key Metrics & Technical Details
*   **Time Elapsed:** ~4.5 hours (including breaks).
*   **Human Effort:** 8 total prompts.
*   **AI Output:** ~9,000 lines of JavaScript across 43 commits.
*   **Token Usage:**
    *   **Input:** 1,464,295 (+ 97,122,176 cached).
    *   **Output:** 625,563 (437,010 for reasoning).
*   **Estimated Cost:** ~$29.41 (at API prices), but covered by a $20/month ChatGPT Plus subscription.
*   **Test Results:** 
    *   Tokenizer: 6810/6810 passed.
    *   Tree: 1770/1782 passed (12 skipped).
    *   Serializer: 230/230 passed.

---

## The Porting Process

### 1. Setup (Mise en Place)
Willison cloned the source Python repo, the test suite, and initialized a new directory.
```shell
cd ~/dev
git clone https://github.com/EmilStenstrom/justhtml
git clone https://github.com/html5lib/html5lib-tests
mkdir justjshtml
cd justjshtml
codex --yolo -m gpt-5.2
```
*Note: The `--yolo` flag bypasses approvals and sandboxing.*

### 2. The Prompting Strategy
*   **Initial Prompt:** Instructed the AI to read the Python code, design a JS API, and create a `spec.md`.
*   **Milestone 0.5:** Requested a "smoke parse" version to handle a simple valid document first.
*   **Automation:** Instructed the AI to configure GitHub Actions (`test.yml`) and "do the rest, commit and push often."

### 3. Final Features Added
Beyond the core parser, the AI implemented:
*   `stream()` API.
*   CSS selectors (`query()` / `matches()`).
*   `toMarkdown()` conversion.
*   A browser-based **Playground UI** (built by fetching an existing tool via `curl` and adapting it).

---

## Key Insights & Observations

### The "Agentic Loop"
Willison emphasizes that the success of this project relied on **designing the agentic loop**. By providing a robust, implementation-independent test suite (`html5lib-tests`), the AI could iterate and self-correct until the code passed.

> "If you can reduce a problem to a robust test suite you can set a coding agent loop loose on it with a high degree of confidence that it will eventually succeed."

### The State of AI in Late 2025
*   **Minimal Supervision:** Frontier LLMs can now handle multi-hour tasks with hundreds of tool calls autonomously.
*   **Cost of Code:** Code is now "practically free," though the cost of *verifying* that code remains the primary hurdle.
*   **Vibe Porting:** The ability to port entire libraries between languages is now a trivial task for high-end models.

---

## Open Questions & Ethics
Willison concludes with several provocative questions regarding the future of software development:
*   **Copyright:** Does a direct AI port violate the original library's copyright? Can a human assert copyright over AI-generated code?
*   **Ethics:** Is it responsible to publish libraries built this way?
*   **Quality:** How does this compare to a library hand-crafted by experts over several months?
*   **Ecosystem:** Does this "churn" of automated ports hurt the open-source ecosystem?

*(Update: Willison provided his own answers to these questions in a [follow-up post](https://simonwillison.net/2026/Jan/11/answers/) on Jan 11, 2026).*
