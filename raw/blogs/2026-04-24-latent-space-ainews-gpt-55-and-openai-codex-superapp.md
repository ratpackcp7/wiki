---
source_url: https://www.latent.space/p/ainews-gpt-55-and-openai-codex-superapp
fetched: 2026-04-24T07:35:13.702168
fetcher: blogwatcher
content_type: blog
slug: 2026-04-24-latent-space-ainews-gpt-55-and-openai-codex-superapp
---

# [AINews] GPT 5.5 and OpenAI Codex Superapp

**Date:** April 24, 2026

## 🚀 OpenAI: GPT-5.5 and the Codex Superapp

OpenAI launched **GPT-5.5**, positioning it as a "new class of intelligence for real work." The release focuses on long-horizon execution and computer-use behavior rather than just raw benchmark scores.

### Key Performance Metrics
* **Intelligence Index:** GPT-5.5 (Medium) matches Claude Opus 4.7 (Max) at **1/4 of the cost** (~$1,200 vs $4,800).
* **Benchmark Scores:**
    * **Terminal-Bench 2.0:** 82.7%
    * **SWE-Bench Pro:** 58.6%
    * **OSWorld-Verified:** 78.7%
    * **FrontierMath Tier 1–3:** 51.7%
* **Context Window:** 1M tokens in API.

### Pricing (per 1M tokens)
| Model | Input | Output |
| :--- | :--- | :--- |
| **GPT-5.5** | $5 | $30 |
| **GPT-5.5 Pro** | $30 | $180 |

### The "Codex Superapp" Strategy
OpenAI is pivoting Codex from a coding tool into a desktop "superapp" by bundling:
* **Browser Control:** Ability to click through flows and capture screenshots.
* **Native Integrations:** Sheets, Slides, Docs, and PDFs.
* **Auto-Review Mode:** Uses a secondary "guardian" agent to reduce the need for human approvals during long autonomous runs.
* **OS-wide Dictation:** Deeper integration into the desktop environment.

--- 

## 🇨🇳 DeepSeek-V4 Preview: The Open-Source Challenger

Released hours after GPT-5.5, DeepSeek-V4 is an MIT-licensed open model designed for extreme efficiency.

### Technical Specifications
* **V4-Pro:** 1.6T total parameters (49B active).
* **V4-Flash:** 284B total parameters (13B active).
* **Context:** 1M tokens with "thinking" and "non-thinking" modes.
* **Efficiency:** Features **mHC** (compressed hybrid attention) and **Muon-based training**, resulting in ~4x compute efficiency improvements.

### Aggressive Pricing (per 1M tokens)
* **V4-Flash:** $0.14 Input / $0.28 Output
* **V4-Pro:** $1.74 Input / $3.48 Output

--- 

## 🛠 Agent Infrastructure & Tooling

The industry is shifting from "model problems" to "systems problems."

* **Stateless Decision Memory:** A new approach for enterprise agents using immutable decision logs (event sourcing) instead of mutable state to improve auditability and scalability.
* **Cua Driver:** A new macOS driver allowing agents to control background apps with multi-cursor support.
* **Fugu (Sakina AI):** A multi-agent orchestration API that coordinates frontier models and uses "recursive test-time scaling."
* **Claude Code Fix:** Anthropic released **v2.1.116+** to fix a quality regression that had impacted developer workflows.

--- 

## 👁 Vision and Multimodal Research

* **Vision Banana (Google DeepMind):** A unified model that treats all 2D/3D vision tasks (segmentation, depth, etc.) as **image generation**.
* **Sapiens2 (Meta):** High-resolution ViTs trained on 1B human images for human-centric perception.
* **LTX HDR:** A move toward High Dynamic Range (HDR) AI video, arguing that 8-bit SDR is the current bottleneck for professional production.

--- 

## 📉 Scaling and Infrastructure

* **Decoupled DiLoCo (Google):** A system for "globally distributed pretraining" that allows training across different datacenters and heterogeneous hardware, surviving individual node failures.
* **Stargate Abilene (Epoch AI):** Revised power estimates suggest the facility is currently at **~0.3 GW**, with the **1.2 GW** milestone delayed to Q4 2026.
* **Inference Demand:** Together AI reported a massive jump in demand, growing from 30B to **300T tokens per month** year-over-year.

--- 

> **Key Insight:** Sam Altman framed OpenAI increasingly as an **"AI inference company,"** emphasizing that stack-level gains are making high-intelligence models practical for persistent, autonomous agent workflows.