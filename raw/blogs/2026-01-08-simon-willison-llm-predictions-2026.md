---
source_url: https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-01-08-simon-willison-llm-predictions-2026
---

# LLM Predictions for 2026: Oxide and Friends Summary

**Author:** Simon Willison  
**Date:** January 8, 2026  
**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/)

In a guest appearance on the *Oxide and Friends* podcast, Simon Willison shared his 1, 3, and 6-year predictions for the tech industry, focusing heavily on the rapid evolution of Large Language Models (LLMs) and coding agents.

---

## 1-Year Predictions (2026)

### 1. The End of the "LLMs Write Bad Code" Argument
Willison asserts that the quality of LLM-generated code is now impossible to deny, largely due to the late 2025 release of reasoning models like **Claude Opus 4.5** and **GPT-5.2**.
*   **Key Insight:** These models were trained using Reinforcement Learning (RL) against code, which provides verifiable success conditions.
*   **Personal Metric:** Willison reports that his own hand-written code has dropped to a **single-digit percentage** of his total output.
> "At this point if you continue to argue that LLMs write useless code you're damaging your own credibility."

### 2. Solving the Sandboxing Problem
The rise of AI-generated code and the threat of prompt injection are forcing a resolution to secure code execution.
*   **Goal:** To run third-party or AI-generated code without risking system integrity.
*   **Technologies:** Willison is most optimistic about **containers** and **WebAssembly**. The remaining hurdle is UX work to reduce friction.

### 3. A "Challenger Disaster" for Coding Agent Security
Willison warns of a "Normalization of Deviance" (a term by Johann Rehberger) where users become complacent because no major catastrophe has occurred yet.
*   **The Threat:** Users running coding agents with root-level permissions.
*   **Worst-case Scenario:** A prompt injection worm that infects computers and compromises Python or NPM packages.

### 4. Kākāpō Parrot Breeding Success
A non-tech prediction to lighten the mood: 2026 is expected to be a bumper breeding season for the endangered Kākāpō (only 250 remaining) due to the heavy fruiting of Rimu trees in New Zealand.

---

## 3-Year Predictions (2029)

### 1. Resolution of the Jevons Paradox
The industry will finally know if the plummeting cost of producing code devalues the profession or explodes the demand for custom software.
> "Does that mean that our careers are completely devalued... or does it mean that the demand for software... goes up by a factor of 10 and now our skills are even more valuable?"

### 2. The AI-Built Web Browser
Willison predicts someone will build a full web browser primarily using AI assistance.
*   **Why a browser?** It is one of the most complex software projects imaginable.
*   **The "Cheat Code":** Conformance suites. Coding agents excel at tasks with concrete goals and existing test suites to iterate against.

---

## 6-Year Prediction (2032)

### The End of Manual Syntax Typing
Willison believes the act of manually typing code into a text editor will become as obsolete as punch cards.
*   **The Shift:** Software engineering remains a massive career, but the focus shifts entirely away from syntax and toward high-level understanding, specifications, and architectural oversight.
*   **Actionable Insight:** The skill being automated is "transforming a specification into lines of code." The "everything else"—design, logic, and problem-solving—becomes the primary value of the engineer.

---

## Key Excerpts & References
*   **Normalization of Deviance:** [Johann Rehberger's essay](https://embracethered.com/blog/posts/2025/the-normalization-of-deviance-in-ai/) on AI security.
*   **Podcast Link:** [Oxide and Friends: Predictions 2026](https://oxide-and-friends.transistor.fm/episodes/predictions-2026).
*   **Context:** This follows Willison's [2025 predictions](https://simonwillison.net/2025/Jan/10/ai-predictions/), noting that the "Year of Reasoning" (2025) was the major inflection point.
