---
source_url: https://www.latent.space/p/shopify
fetched: 2026-04-23T07:30:00-00:00
fetcher: blogwatcher
content_type: blog
author: Latent Space
published_date: 2026-04-22
slug: 2026-04-23-latent-space-shopifys-ai-phase-transition-2026-usage-explosion-unlimited-opus-46-token-budget-tangle-tangent-simgym-with-mikhail-parakhin-shopify-cto
---

# Shopify’s AI Phase Transition: CTO Mikhail Parakhin Interview

This summary covers the April 2026 interview with Shopify CTO Mikhail Parakhin regarding Shopify’s "all-in" AI strategy, internal tooling, and the future of agentic software engineering.

---

## 1. Internal AI Adoption & The "December Inflection"
Shopify has seen a near-universal adoption of AI tools among its employees.
*   **Usage Stats:** Daily Active Users (DAU) of AI tools approach **90%** of the company.
*   **The Inflection Point:** A major phase transition occurred in **December 2025**, where model quality reached a threshold that caused usage to explode.
*   **Token Budgets:** Shopify funds **unlimited tokens** for employees. 
    *   *Policy:* "Please don’t use anything less than Opus 4.6."
    *   *Trend:* Usage is heavily skewed; the top 10% of users are consuming tokens at an exponentially faster rate than the rest of the company.

> "The real bottleneck in AI coding is no longer generation, but review, CI/CD, and deployment stability." — Mikhail Parakhin

---

## 2. The AI Coding Bottleneck: PRs and CI/CD
While AI writes code faster than humans, it creates a "global mutex" problem in traditional Git workflows.
*   **Volume vs. Quality:** Even if AI writes cleaner code on average, the sheer volume of machine-generated code leads to more bugs in production.
*   **The Review Loop:** Shopify built its own internal AI PR review system. Parakhin argues that review should use **more expensive, pro-level models** (e.g., GPT-5.4 Pro) than the generation phase.
*   **The Death of the PR?** Parakhin suggests that Git and PR metaphors designed for humans may need to be replaced by something new once code is written at "machine speed."

---

## 3. Key Internal AI Initiatives

### **Tangle: Reproducible ML Workflows**
A third-generation system for data processing and ML experimentation.
*   **Content-Addressed Caching:** Uses content hashes so that if an output doesn't change, nothing is rerun. This creates a "network effect" where different teams benefit from each other's cached results.
*   **Production-Ready:** Unlike Jupyter notebooks, Tangle workflows are production-ready from the start.

### **Tangent: Auto-Research & Optimization**
An auto-research loop that automates "hill climbing" for engineering problems.
*   **Successes:** 
    *   Optimized search index throughput from **800 QPS to 4,200 QPS** on the same hardware.
    *   Reduced storage by identifying derivative/redundant datasets.
*   **Democratization:** Tangent allows PMs and domain experts to run experiments without needing deep ML engineering knowledge.

### **SimGym: Customer Simulation**
Simulates buyer behavior to predict the impact of storefront changes.
*   **The Moat:** Simulation only works because Shopify has decades of historical data to ground the agents.
*   **Visual Friction:** Uses multimodal models and browser farms to "see" the site as a human would (e.g., detecting if larger images actually hurt conversion).
*   **Counterfactuals:** Allows merchants to run "what if" scenarios (e.g., "What if I offered a 10% discount to this specific segment?").

---

## 4. Architecture & Model Choices

### **Liquid AI (Non-Transformer Models)**
Shopify is a major user of **Liquid Neural Networks**, which Parakhin describes as "souped-up State Space Models (SSMs)."
*   **Use Case:** Low-latency tasks (sub-30ms) like real-time query understanding and large-scale batch processing (catalog categorization).
*   **Performance:** "It’s the only non-transformer architecture that I found being genuinely competitive."

### **UCP (Universal Commerce Platform)**
*   Shopify is moving toward a runtime-accessible global catalog.
*   Focus on **Identity Linking** to minimize friction across the commerce ecosystem.

---

## 5. Key Excerpts & Technical Insights

*   **On Token Budgets:** "Jensen [Huang] is directionally correct... if your 200K engineer is not using 100K of tokens every year, they’re underutilizing coding agents."
*   **On Auto-Research Limits:** It is excellent at "obvious" optimizations humans miss, but poor at "out-of-distribution" creative leaps.
*   **On "Sydney" (Bing AI):** Parakhin revealed that Sydney's personality was a deliberate choice based on his "Yandex legacy" (Alice assistant). "You want to be polite, but you want to be a little bit on edge, and that draws people in."

---

## 6. Hiring at Shopify
Shopify is actively recruiting in three specific areas:
1.  **ML Engineers**
2.  **Data Scientists**
3.  **Distributed Database Experts** (specifically those interested in reimagining databases using LLMs).