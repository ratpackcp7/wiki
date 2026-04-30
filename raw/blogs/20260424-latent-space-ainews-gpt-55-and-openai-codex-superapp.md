---
source_url: https://www.latent.space/p/ainews-gpt-55-and-openai-codex-superapp
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Latent Space
published_date: 2026-04-24
slug: ainews-gpt-55-and-openai-codex-superapp
---

# [AINews] GPT-5.5 and OpenAI Codex Superapp Summary

**Date:** April 24, 2026  
**Core Theme:** A massive shift in the AI landscape characterized by OpenAI's move toward "agentic superapps" and DeepSeek's aggressive open-source competition.

---

## 🚀 OpenAI: GPT-5.5 & The Codex Superapp

OpenAI has transitioned from pure model updates to a "superapp" strategy, centering its ecosystem around **Codex**.

### GPT-5.5 Model Profile
Rather than a simple benchmark blowout, GPT-5.5 focuses on **long-horizon execution, computer-use behavior, and token efficiency.**

*   **Key Benchmarks:**
    *   `Terminal-Bench 2.0`: 82.7%
    *   `SWE-Bench Pro`: 58.6%
    *   `OSWorld-Verified`: 78.7%
    *   `FrontierMath (Tier 1–3)`: 51.7%
*   **Intelligence per Dollar:** Artificial Analysis notes a new cost/performance frontier.
    > "GPT-5.5 (medium) scores the same as Claude Opus 4.7 (max) on our Intelligence Index at one quarter of the cost (~$1,200 vs $4,800)."
*   **Pricing & Context:**
    *   **API:** $5/$30 per 1M input/output tokens.
    *   **Pro:** $30/$180 per 1M input/output tokens.
    *   **Context Window:** 1M tokens.
*   **Technical Note:** Co-designed for NVIDIA GB200/300 systems; emphasizes "stack-level inference gains."

### Codex: The Agentic Workspace
Codex is evolving from a coding tool into a **broad computer-work agent** capable of:
*   **Browser Control:** Interacting with web apps, clicking flows, and capturing screenshots.
*   **Office Integration:** Direct control over Sheets, Slides, Docs, and PDFs.
*   **Auto-Review Mode:** Uses a secondary "guardian" agent to oversee long-running tasks and reduce manual approvals.
*   **Capabilities:** QA, research loops, app building, and overnight experimental runs.

---

## 🌊 DeepSeek-V4 Preview: The Open-Source Challenger

DeepSeek responded to OpenAI's launch with a highly aggressive open-source release.

*   **Models & Licensing:** **MIT Licensed** (V4-Pro and V4-Flash).
*   **Specifications:**
    *   **V4-Pro:** 1.6T total params / 49B active.
    *   **V4-Flash:** 284B total params / 13B active.
    *   **Context:** 1M token support.
*   **Technical Innovations:**
    *   Two new compressed/hybrid attention mechanisms.
    *   **Muon-based training** and FP4 quantization-aware training.
    *   **Efficiency:** Reported ~4x compute efficiency improvements and massive KV-cache reductions.
*   **Aggressive Pricing:**
    *   **V4-Flash:** $0.14 / $0.28 per 1M tokens.
    *   **V4-Pro:** $1.74 / $3.48 per 1M tokens.

---

## 🛠️ Agent Infrastructure & Tooling

The industry is shifting from "model problems" to "system problems."

*   **Orchestration:** 
    *   **Sakana AI's Fugu:** A multi-agent API that dynamically coordinates frontier models.
    *   **Trend:** Agents are becoming orchestration layers over heterogeneous tools rather than single-model loops.
*   **Control & Memory:**
    *   **Cua Driver:** macOS driver for background agent control with multi-player/multi-cursor support.
    *   **Stateless Decision Memory:** Moving toward immutable decision logs/event sourcing for better scalability and auditability in enterprise agents.
*   **Cloud Infrastructure:** Cognition identifies the essential stack for cloud agents: *VM isolation, session persistence, environment provisioning, orchestration, and integrations.*

---

## 👁️ Vision, Video, & Multimodal Research

*   **Vision Banana (Google DeepMind):** A unified model that treats 2D/3D vision tasks as **image generation**, outperforming specialist systems.
*   **Sapiens2 (Meta):** High-resolution vision transformers trained on 1B human images for human-centric perception.
*   **Video Production:** 
    *   **LTX HDR Beta:** Focuses on **dynamic range** (moving beyond 8-bit SDR) to allow for professional grading and compositing.
    *   **World Jam (World Labs):** Interactive 3D creation via Marble 1.1 + Spark LoD.
*   **Omni Models:** Research into "Context Unrolling" suggests models will increasingly unroll reasoning across text, image, video, and 3D geometry before producing output.

---

## 📈 Scaling & Training Insights

*   **Decoupled DiLoCo (Google):** Enables worldwide datacenter training and tolerance to hardware failures across geographically distributed, heterogeneous infrastructure.
*   **Algorithmic Scaling:** New research suggests a 7B model can solve as many problems as a `pass@4` of a model 100x larger through optimized self-play.
*   **Compute Trends:** 
    *   **Together AI:** Reported massive growth (30B to 300T tokens/month YoY).
    *   **Stargate Abilene:** Power estimates revised; 1.2 GW milestone pushed to Q4 2026.