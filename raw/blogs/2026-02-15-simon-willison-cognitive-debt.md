---
source_url: https://simonwillison.net/2026/Feb/15/cognitive-debt/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-cognitive-debt
---

# How Generative and Agentic AI Shift Concern from Technical Debt to Cognitive Debt

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/15/cognitive-debt/) (referencing Margaret-Anne Storey)  
**Date:** February 15, 2026  
**Key Concepts:** Cognitive Debt, AI-Assisted Programming, Vibe Coding

---

## Defining Cognitive Debt
While **Technical Debt** refers to the cost of rework caused by choosing an easy solution now instead of a better approach that would take longer, **Cognitive Debt** focuses on the mental burden placed on the developer.

> "Cognitive debt... communicates the notion that the debt compounded from going fast lives in the brains of the developers and affects their lived experiences and abilities to 'go fast' or to make changes." — *Margaret-Anne Storey*

### Key Characteristics:
* **Loss of "The Plot":** Even if AI-generated code is clean and readable, developers may lose the high-level understanding of what the program does or how intentions were implemented.
* **Fragmented Theory:** The "theory of the system"—the shared understanding of design decisions—disappears, making it impossible to explain how different parts work together.
* **Paralysis:** Once cognitive debt accumulates, teams become unable to make simple changes without breaking unexpected components, even if the code itself isn't "messy."

---

## The Impact of Generative & Agentic AI
The rise of AI-assisted programming (or "vibe coding") accelerates the accumulation of cognitive debt.

### The "Vibe Coding" Trap
Simon Willison shares personal experience with "prompting entire new features into existence without reviewing their implementations." While highly efficient in the short term, it leads to:
* **Erosion of Mental Models:** The developer no longer has a firm grasp of the software's capabilities or internal logic.
* **Decision Fatigue:** Without a clear understanding of the current state, making confident decisions about future features becomes increasingly difficult.
* **Reasoning Barriers:** Each additional feature becomes harder to reason about because the foundation is a "black box" to the human creator.

---

## Case Study: The Student Team Wall
Margaret-Anne Storey recounts a student team that hit a wall in week 7 of a project:
* **Symptoms:** Inability to make simple changes; frequent unexpected breakages.
* **Misdiagnosis:** The team blamed technical debt (messy code/poor architecture).
* **Root Cause:** **Cognitive Debt.** No one could explain *why* design decisions were made. The shared mental model had completely fragmented.

---

## Key Takeaway
In the era of AI agents, the bottleneck for software development is shifting from **writing code** to **maintaining a mental model** of the system. Speed gained through AI generation is only sustainable if the human developers can continue to "reason about" and "own" the underlying logic of the project.
