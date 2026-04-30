---
source_url: https://news.smol.ai/issues/26-04-22-not-much/
fetched: 2026-04-23T07:30:00-00:00
fetcher: blogwatcher
content_type: blog
author: AI News smol.ai
published_date: 2026-04-22
slug: 2026-04-23-ai-news-smol.ai-not-much-happened-today
---

# AI News Summary: April 22, 2026

A significant day for open-source models and enterprise infrastructure, headlined by Alibaba's Qwen 3.6 release and Google's 8th-generation TPU announcement.

---

## 🚀 Model Releases & Updates

### Qwen 3.6-27B (Alibaba)
Alibaba released a dense, **Apache 2.0** model that claims to punch significantly above its weight class, particularly in coding.
*   **Key Feature:** Includes "thinking" and "non-thinking" modes with a unified multimodal checkpoint.
*   **Performance:** Beats the much larger Qwen 3.5-397B on major benchmarks:
    *   **SWE-bench Verified:** 77.2 (vs 76.2)
    *   **SWE-bench Pro:** 53.5 (vs 50.9)
    *   **Terminal-Bench 2.0:** 59.3 (vs 52.5)
*   **Ecosystem Support:** Day-0 support from vLLM, Unsloth (18GB-RAM GGUFs), llama.cpp, and Ollama.

### OpenAI Privacy Filter
OpenAI quietly open-sourced a specialized model for enterprise infrastructure.
*   **Specs:** 1.5B total / 50M active MoE token-classification model.
*   **Purpose:** Lightweight **PII detection and masking** with a 128k context window.
*   **License:** Apache 2.0.

### Xiaomi MiMo-V2.5
Xiaomi pushed into the agentic model space with two variants:
*   **V2.5-Pro:** Optimized for software engineering; scores **57.2 on SWE-bench Pro**.
*   **V2.5 (Standard):** Features native omnimodality and a **1M-token context window**.

### Google Gemini 3.1 & Gemma 4
*   **Gemma 4 (31B):** Community reports suggest it is outperforming GPT-5.3 and Gemini Chat in creative writing and translation tasks, specifically regarding natural language flow and reduced censorship.
*   **Gemini 3.1 Pro:** Now integrated into Google's new Enterprise Agent Platform.

---

## 🏗️ Infrastructure & Enterprise AI

### Google Cloud Next: TPU v8
Google announced a massive leap in AI hardware with a specialized split design:
*   **TPU 8t (Training):** Delivers ~3x compute per pod vs. previous generation; can scale to **1 million TPUs** in a single cluster.
*   **TPU 8i (Inference):** Connects 1,152 TPUs per pod for high-throughput multi-agent workloads.
*   **Native FP4 Support:** Optimized for running highly quantized models efficiently.

### Gemini Enterprise Agent Platform
Google is evolving Vertex AI into a full-scale agent governance platform.
*   **Agent Studio:** A dedicated environment for building and optimizing agents.
*   **Workspace Intelligence:** Now GA; acts as a semantic layer over Docs, Sheets, and Gmail.

---

## 🛠️ Developer Tools & Agentic Workflows

### The "Agent Harness" Convergence
Major players are standardizing how agents interact with team environments:
*   **OpenAI:** Launched **Workspace Agents** in ChatGPT for teams (Slack integration, background tasks).
*   **Cursor:** Added Slack invocation for task streaming and updates.
*   **VS Code/Copilot:** Now supports **Bring-Your-Own-Key (BYOK)**, allowing users to plug in Anthropic, OpenAI, or local backends (Ollama).

### Agent Data & Traces
A shift is occurring toward using "traces" as the primary data primitive for improving agents.
> "Traces capture agent errors and inefficiencies... compute should be pointed at understanding traces to generate better evals, skills, and environments." — @Vtrivedy10

---

## 📈 Benchmarks & Research Insights

### The "Over-Editing" Problem
New research highlights a common developer frustration: models rewriting too much code to fix small bugs.
*   **Findings:** GPT-5.4 over-edits the most; Opus 4.6 over-edits the least.
*   **Solution:** RL outperforms SFT and DPO for teaching models a "minimal-editing" style.

### Inference Optimization
*   **Cohere:** Integrated W4A8 inference into vLLM, achieving **58% faster Time-To-First-Token (TTFT)** on Hopper GPUs.
*   **Neural Garbage Collection:** A new method using RL to learn reasoning and KV-cache eviction simultaneously.

---

## ⚠️ Community Controversies

*   **Anthropic Pricing:** Users reported that **Claude Code** was removed from the $20 Pro plan and moved to the $100+ Max plan. Anthropic clarified this is an A/B test affecting ~2% of new signups, but the move sparked significant backlash regarding "gacha-style" feature access.
*   **Google AI Studio Quotas:** Users expressed frustration that Gemini 3.1 Pro limits in AI Studio are now identical for Pro and Free users (exhausting after ~15 messages), despite the 1M token context window.
*   **GPT-Image-2:** OpenAI's new image model is dominating leaderboards but faces criticism for long generation times (up to 11 minutes) due to internal self-correction loops.