---
source_url: https://simonwillison.net/2025/Dec/18/code-proven-to-work/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-18-simon-willison-code-proven-to-work
---

# Your job is to deliver code you have proven to work

**Source:** Simon Willison's Weblog
**Date:** December 18, 2025
**Key Theme:** The ethical and professional responsibility of developers to validate AI-generated code before submission.

---

### The Core Thesis
The rise of LLMs has led to a "depressing" trend: developers (often juniors) dumping large, untested AI-generated Pull Requests (PRs) on colleagues or maintainers. This is characterized as a "dereliction of duty."

> **"Your job is to deliver code you have proven to work."**

As LLMs take over the "cranking out" of code, the human developer's primary value shifts to **verification and proof**. Submitting unproven code shifts the labor burden to the reviewer.

---

### Two Essential Steps to Proving Code Works
Willison argues that neither of these steps is optional.

#### 1. Manual Testing
If you haven't personally seen the code perform correctly, any success is "pure chance."
*   **The Skill:** Getting the system into a specific state, exercising the change, and verifying the effect.
*   **Evidence:**
    *   Paste terminal commands and their outputs into PR comments.
    *   Record screen captures for visual or complex changes.
*   **Edge Cases:** Once the "happy path" is confirmed, a senior engineer's skill is defined by finding where the code breaks.

#### 2. Automated Testing
With LLM tooling, there is "no excuse" for skipping automated tests.
*   **The Bundle:** Every change should be bundled with a test that proves it works.
*   **The "Revert" Rule:** A good test should fail if the implementation is reverted.
*   **The Process:** Set a known state → exercise change → assert result.
*   **Warning:** Never skip manual testing just because an automated test passed; doing so often leads to regret.

---

### Leveraging Coding Agents (Claude Code, Codex CLI)
Coding agents are the "most important trend in LLMs in 2025." These tools can execute code and iterate based on results.

*   **Teaching the Agent:** Train agents to perform manual tests (e.g., teaching Claude Code to run CLI commands or take screenshots for CSS changes).
*   **Test Generation:** Agents are excellent at writing tests if a project already has an established test suite. They will mimic existing patterns and styles.
*   **Seniority:** Developing "good taste" in testing patterns is what differentiates senior engineers when guiding these agents.

---

### The Human Element: Accountability
Willison emphasizes that while AI can generate code, it cannot take responsibility for it.

> **"A computer can never be held accountable. That's your job as the human in the loop."**

**Actionable Takeaway:** A thousand-line patch is no longer impressive or valuable. Value is now found in the **evidence** provided alongside the code. Every PR should include proof of functionality.

---

### Related Context
*   **Series:** This post is part of the *[My open source process](https://simonwillison.net/series/open-source-process/)* series.
*   **Key Tags:** #AI-Assisted-Programming, #Coding-Agents, #Vibe-Coding, #Software-Engineering.
