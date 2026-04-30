---
source_url: https://simonwillison.net/2026/Jan/28/the-five-levels/
fetched: 2026-04-11T12:52:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-01-28-simon-willison-the-five-levels
---

# The Five Levels: From Spicy Autocomplete to the Dark Factory

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/28/the-five-levels/)
**Author:** Simon Willison (referencing Dan Shapiro)
**Date:** January 28, 2026 (Updated February 7, 2026)

---

## Overview
Dan Shapiro proposes a six-stage (0-indexed) maturity model for AI-assisted programming, modeled after the NHTSA's levels of driving automation. The framework tracks the transition from manual coding with AI assistance to fully autonomous "dark factories" where humans no longer review code.

## The Five Levels of AI Automation in Coding

*   **Level 0: Spicy Autocomplete** – Original GitHub Copilot or manual copy-pasting from ChatGPT.
*   **Level 1: The Coding Intern** – AI writes unimportant snippets and boilerplate; requires full human review.
*   **Level 2: The Junior Developer** – Pair programming with the model; humans still review every line.
*   **Level 3: The Developer** – AI generates most code; the human's primary role shifts to full-time code reviewer.
*   **Level 4: The Engineering Team** – The human acts as an Engineering Manager or Product Manager, collaborating on specs and plans while agents execute the work.
*   **Level 5: The Dark Software Factory** – A "black box" that converts specifications directly into software without human intervention in the codebase.

### Defining the "Dark Factory"
Dan Shapiro describes Level 5 as a fundamental shift in the nature of software development:

> "At level 5, it's not really a car any more. You're not really running anybody else's software any more. And your software process isn't really a software process any more. It's a black box that turns specs into software... It's dark, because it's a place where humans are neither needed nor welcome."

---

## Real-World Implementation: The "Dark Factory" Pattern
Simon Willison highlights a real-world team (later identified as **StrongDM's AI team**) already operating at Level 5. Despite having 20+ years of experience in high-reliability systems, they have adopted a radical workflow:

### Key Characteristics of Level 5 Teams:
*   **Zero Code Review:** Humans never look at or review the AI-produced code.
*   **Proof-Based Systems:** The primary goal is to build a system that *proves* the software works.
*   **Shift in Human Labor:** Human effort is redirected from writing/reviewing code to:
    *   Designing the overarching system.
    *   Developing patterns to help agents work effectively.
    *   Building robust testing, tooling, and simulation environments to demonstrate software effectiveness.
*   **High Efficiency:** Small teams (fewer than five people) can build complex, reliable systems in months that would traditionally require much larger organizations.

---

## Update: StrongDM Public Disclosure
As of February 7, 2026, the team referenced by Willison (StrongDM) has gone public with their methodology. Their approach confirms that the future of high-reliability software may lie in **agent-led development validated by automated proof systems** rather than manual human oversight.
