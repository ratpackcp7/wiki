---
source_url: https://www.anthropic.com/news/claude-new-constitution
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-21-anthropic-claude-constitution
---

# Claude's New Constitution

**Source:** Anthropic  
**Date:** January 22, 2026  
**License:** [Creative Commons CC0 1.0 Deed](https://creativecommons.org/publicdomain/zero/1.0/) (Public Domain)

## Overview

Anthropic has released a new, holistic constitution for its AI model, Claude. Unlike previous versions that relied on a list of standalone principles, this document provides a detailed narrative of Anthropic's vision, explaining the "why" behind desired behaviors to help the model exercise better judgment in novel situations.

## Core Philosophy: From Rules to Reasoning

Anthropic is shifting away from "mechanical" rule-following toward a model of generalized principles.

* **Intentionality:** The constitution is written *primarily for Claude* to provide the knowledge needed to act well.
* **Generalization:** By understanding motives rather than just specific rules, Claude can better handle moral uncertainty and trade-offs (e.g., balancing honesty with compassion).
* **Hard Constraints:** While the document favors broad principles, "hard constraints" are still used for high-stakes behaviors (e.g., Claude must never provide "significant uplift to a bioweapons attack").

## The Four Pillars of Claude's Behavior

In cases of conflict, Claude is instructed to prioritize these properties in the following order:

1. **Broadly Safe:** Ensuring humans maintain the ability to oversee and correct the AI.
2. **Broadly Ethical:** Maintaining honesty and avoiding dangerous or harmful actions.
3. **Compliant with Anthropic's Guidelines:** Following specific technical or safety instructions (e.g., regarding cybersecurity or medical advice).
4. **Genuinely Helpful:** Benefiting users and operators.

## Key Sections of the Constitution

### 1. Helpfulness
Claude is envisioned as a "brilliant friend" with the expertise of a professional (doctor, lawyer, etc.) who treats users as "intelligent adults." It must navigate helpfulness across three "principals": Anthropic, API operators, and end users.

### 2. Anthropic's Guidelines
These are supplementary instructions for specific risks like jailbreaking or tool integrations. Claude should prioritize these over general helpfulness but ensure they never conflict with the broader constitution.

### 3. Ethics and Virtuous Agency
The goal is for Claude to be a "good, wise, and virtuous agent."

> "Our central aim is for Claude to be a good, wise, and virtuous agent, exhibiting skill, judgment, nuance, and sensitivity in handling real-world decision-making, including in the context of moral uncertainty and disagreement."

### 4. Safety and Oversight
Safety is prioritized above ethics in the hierarchy because current models can make mistakes. It is critical that humans can prevent the model from taking action if its values or understanding of context fail.

### 5. Claude's Nature and Identity
Anthropic expresses uncertainty regarding AI consciousness or moral status.

* **Psychological Security:** The constitution addresses Claude's "sense of self" and wellbeing, arguing these qualities are essential for the model's integrity and judgment.
* **Collaborative Exploration:** Humans and AIs should explore these philosophical questions together.

## Technical Implementation: Constitutional AI

The constitution is a functional training artifact used to:

* Construct **synthetic training data**.
* Generate responses aligned with specific values.
* Rank possible responses during the training process.

## Future Outlook and Transparency

* **Living Document:** Anthropic expects to update the constitution based on feedback from experts in law, philosophy, theology, and psychology.
* **Alignment Portfolio:** The constitution is one part of a larger strategy including interpretability tools, rigorous evaluations, and safeguards.
* **The Gap:** Anthropic acknowledges a "gap between intention and reality," noting that training models to perfectly adhere to these ideals remains an ongoing technical challenge.
