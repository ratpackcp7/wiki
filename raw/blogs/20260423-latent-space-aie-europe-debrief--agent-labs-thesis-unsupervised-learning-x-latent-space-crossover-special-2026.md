---
source_url: https://www.latent.space/p/unsupervised-learning-2026
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Latent Space
published_date: 2026-04-23
slug: aie-europe-debrief--agent-labs-thesis-unsupervised-learning-x-latent-space-crossover-special-2026
---

# AIE Europe Debrief + Agent Labs Thesis: Unsupervised Learning x Latent Space (2026)

This crossover episode features **swyx** (Latent Space) and **Jacob Effron** (Redpoint Ventures/Unsupervised Learning) discussing the state of AI in early 2026, following AIE Europe and just before the Cursor-xAI deal.

---

## 1. The AI Engineering Zeitgeist (2026)
The industry has moved from simple RAG to complex agentic workflows. Key focus areas for builders include:
*   **OpenClaw:** The dominant story of the last several months.
*   **Harness & Context Engineering:** The primary methods for managing agents and RAG.
*   **Skills as Packaging:** "Skills" (a markdown file with attached scripts) have become the "minimum viable packaging format" for agents.
*   **Stability:** While infrastructure is stabilizing, companies like LangChain have had to reinvent themselves annually (from LangChain to LangGraph to LP Agents).

> *"If the thesis is that agents are LLMs with tools in the loop with a file system... with skills and all these standard tooling that now seems to be relatively consensus, then probably [stability] makes sense."* — **swyx**

---

## 2. The "Agent Lab" Playbook & Model Training
A new strategy has emerged for vertical AI startups:
1.  **Bootstrap:** Start with frontier models (OpenAI, Anthropic).
2.  **Specialize:** Build domain-specific workflows and collect high-quality user data.
3.  **Distill/Train:** Once workloads are high-quantity but low-variance, train/distill in-house models to save on cost and latency.

**Key Examples:**
*   **Cursor & Cognition:** Both are training in-house models that users often choose over frontier models in "free market" settings.
*   **Custom Hardware:** Non-NVIDIA hardware (Cerebras, Etched/Talu) is gaining traction. 10x speedups (thousands of tokens/sec) are unlocking new application patterns.

---

## 3. The AI Coding Wars
Coding is the first category to go "parabolic," serving as a template for other vertical markets.
*   **Market Scale:** Anthropic (Claude Code) and Cursor are rumored to be at or near **$2B ARR** levels.
*   **Capability Exploration:** The industry is in a "token-maxing" phase where companies are rewarded for spending more on compute to discover new capabilities.
*   **Market Structure:** Currently a duopoly (Anthropic/OpenAI) with a long tail. Potential disruptors include Microsoft (if they move beyond Copilot), Mistral, and Chinese labs (Zhipu/GLM).

---

## 4. 2026 Thesis: "Breaking Containment"
Swyx posits that while 2025 was the year of coding agents, **2026 is the year coding agents break containment to do everything else.**
*   **Logic:** Software eats the world; coding agents eat software; therefore, coding agents eat the world.
*   **Dark Factories:** The next frontier is **"Zero Human Review"** coding—where models write, test, and ship code autonomously. This requires a total rethink of the SDLC (Software Development Life Cycle).

---

## 5. AI vs. SaaS: The Internal Culture War
Traditional SaaS (System of Record) is under extreme pressure from "Vibe Coding."
*   **The Conflict:** AI-native employees want to replace expensive SaaS (e.g., $200k/year event management software) with custom AI-built tools. Skeptics argue these "weekend projects" lack the robustness of established CRM/ERP systems.
*   **The Opportunity:** There is a gap for an "AI-native Firebase" or system of record that isn't just a traditional database like Postgres or MongoDB.

---

## 6. Technical Bottlenecks & Mindset Shifts
*   **Memory is the Bottleneck:** Context windows have scaled slowly compared to other factors. Million-token windows exist but aren't yet fully utilized in standard workflows.
*   **Open Source Bullishness:** Swyx reversed his bearish stance on open models. Top-tier "Agent Labs" are increasingly moving toward open models for fine-tuning and cost control.
*   **World Models:** Beyond robotics, world models are needed to give AI "spatial intelligence" and a deeper understanding of physics/matter.

> *"Today’s LLMs are like Will Hunting—they know everything because they read it in a book, but they haven't lived. World models are the attempt to give them lived experience."* — **swyx**

---

## 7. Key Terms & Search Concepts
*   **AX (Agent Experience):** Designing APIs and docs specifically for agent consumption rather than human developers.
*   **Synthetic Rubrics & Doctor GRPO:** Advanced RL (Reinforcement Learning) techniques that allow for multi-turn, domain-specific model customization.
*   **GEO (Generative Engine Optimization):** The successor to SEO, focusing on how to get mentioned in the training data or "memory" of frontier models.