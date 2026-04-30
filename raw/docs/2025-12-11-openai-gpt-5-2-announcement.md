---
source_url: https://openai.com/index/introducing-gpt-5-2/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-11-openai-gpt-5-2-announcement
---

# Introducing GPT-5.2

**Release Date:** December 11, 2025
**Core Focus:** Professional knowledge work, long-running agents, and advanced reasoning.

GPT-5.2 is OpenAI's most advanced model series to date, specifically engineered to unlock economic value by excelling at complex, multi-step professional tasks including spreadsheet modeling, presentation building, and agentic coding.

---

## 1. Model Variants & Availability

| Model | ChatGPT Role | API Identifier | Key Characteristics |
| :--- | :--- | :--- | :--- |
| **GPT-5.2 Instant** | Fast workhorse | `gpt-5.2-chat-latest` | Improved info-seeking, technical writing, and "warmer" tone. |
| **GPT-5.2 Thinking** | Deep work | `gpt-5.2` | Optimized for coding, math, and long-document analysis. |
| **GPT-5.2 Pro** | Smartest/Trustworthy | `gpt-5.2-pro` | Highest intelligence; lowest error rates in complex domains. |

*   **Rollout:** Starting today for paid ChatGPT plans (Plus, Pro, Team, Enterprise) and available immediately in the API.
*   **Legacy Support:** GPT-5.1 will remain available in ChatGPT for three months before being sunset.

---

## 2. Key Performance Benchmarks

GPT-5.2 sets new state-of-the-art (SOTA) records across several critical domains:

*   **Professional Work (GDPval):** GPT-5.2 Thinking wins or ties against industry professionals in 70.9% of tasks (up from 38.8% in GPT-5.1).
*   **Abstract Reasoning (ARC-AGI):**
    *   **ARC-AGI-1:** GPT-5.2 Pro is the first model to cross **90%**.
    *   **ARC-AGI-2:** GPT-5.2 Thinking scored **52.9%**, a massive leap from GPT-5.1's 17.6%.
*   **Mathematics:** Achieved **100% on AIME 2025** and 40.3% on FrontierMath (Tier 1–3).
*   **Coding (SWE-Bench Pro):** Reached **55.6%**, demonstrating superior multi-language engineering capabilities.

---

## 3. Major Technical Advancements

### Professional Artifacts & Data Science
The model shows a 9.3% improvement in junior investment banking tasks (spreadsheet modeling). It can generate complex workforce planning models and high-fidelity presentations.
> "It appears to have been done by a professional company with staff, and has a surprisingly well designed layout..." — *GDPval Judge*

### Agentic Coding
Testers report a shift from multi-agent systems to "mega-agents" due to GPT-5.2's reliability with tools.

### Long Context & Vision
*   **Context:** Near **100% accuracy** on the 4-needle MRCR variant up to 256k tokens.
*   **Vision:** Error rates cut in half for chart reasoning and UI understanding. It demonstrates significantly better spatial awareness for identifying components (e.g., parts on a motherboard).
*   **New API Feature:** The `/compact` endpoint allows for an extended effective context window for tool-heavy workflows.

### Factuality & Safety
*   **Hallucinations:** 30% less common than GPT-5.1 Thinking.
*   **Sensitive Content:** Meaningful improvements in handling prompts related to mental health, self-harm, and emotional reliance.
*   **Age Prediction:** Rolling out a model to automatically apply content protections for users under 18.

---

## 4. Pricing Structure (per 1M tokens)

Despite higher per-token costs, OpenAI claims GPT-5.2 is often more cost-effective due to **token efficiency** in agentic tasks.

| Model | Input | Cached Input | Output |
| :--- | :--- | :--- | :--- |
| **gpt-5.2 / chat-latest** | $1.75 | $0.175 | $14.00 |
| **gpt-5.2-pro** | $21.00 | N/A | $168.00 |

---

## 5. Expert Insights

> "GPT-5.2 represents the biggest leap for GPT models in agentic coding since GPT-5... The version bump undersells the jump in intelligence."
> — *Jeff Wang, CEO, Windsurf*

> "We collapsed a fragile, multi-agent system into a single mega-agent with 20+ tools. The best part is, it just works."
> — *AJ Orbach, CEO, Triple Whale*
