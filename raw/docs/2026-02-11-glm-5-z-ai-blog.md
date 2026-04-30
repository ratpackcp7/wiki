---
source_url: https://z.ai/blog/glm-5
fetched: 2026-04-11T13:40:00-05:00
fetcher: on-demand
content_type: docs
slug: 2026-02-11-glm-5-z-ai-blog
---

# GLM-5: From Vibe Coding to Agentic Engineering

GLM-5 is a next-generation large language model designed specifically for complex systems engineering and long-horizon agentic tasks.

## Key Technical Specifications
*   **Parameter Scale:** 744B total parameters (40B active) — up from 355B/32B in GLM-4.5.
*   **Training Data:** 28.5T tokens — up from 23T.
*   **Architecture:** Integrates DeepSeek Sparse Attention (DSA) to reduce deployment costs while maintaining long-context capacity.
*   **Training Infrastructure:** Utilizes slime, a novel asynchronous RL infrastructure.
*   **License:** MIT License.

## Performance Benchmarks (Thinking mode)
*   **AIME 2026 I:** 92.7 (vs DeepSeek-V3.2: 92.7, Claude Opus 4.5: 93.3)
*   **HMMT Nov. 2025:** 96.9 (vs DeepSeek-V3.2: 90.2, Claude Opus 4.5: 91.7)
*   **SWE-bench Verified:** 77.8 (vs DeepSeek-V3.2: 73.1, Claude Opus 4.5: 80.9)
*   **Terminal-Bench 2.0:** 56.2 / 61.1† (vs DeepSeek-V3.2: 46.4, Claude Opus 4.5: 57.9)
*   **Vending Bench 2:** #1 open-source, $4,432.12 final balance (Claude Opus 4.5: $4,967.06)
*   **BrowseComp (w/ Context Manage):** 75.9 (Claude Opus 4.5: 67.8, Gemini 3.0 Pro: 59.2)

## Core Capabilities
*   End-to-end document creation (.docx, .pdf, .xlsx)
*   Z.ai Agent Mode for multi-turn collaboration
*   Cross-app operation via OpenClaw framework

## Deployment
*   Cloud: Z.ai, api.z.ai, BigModel.cn
*   Coding agents: Claude Code, Roo Code, Cline, Droid
*   Local: HuggingFace, ModelScope; vLLM and SGLang supported
*   Hardware: NVIDIA + non-NVIDIA (Ascend, Moore Threads, Cambricon, etc.)
