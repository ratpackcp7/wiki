---
title: GPT-Image-2
source_url: https://news.smol.ai/issues/26-04-21-image-2/
fetched: 2026-04-22T07:32:31.552263
blog: AI News smol.ai
published_date: 2026-04-21
content_type: blog
---
# GPT-Image-2 & Agentic Evolution: AI News Summary (Apr 21, 2026)

## 1. Major Model Launches & Benchmarks

### OpenAI: GPT-Image-2
OpenAI released **ChatGPT Images 2.0** and the **`gpt-image-2`** model across ChatGPT, Codex, and API.
*   **Key Capabilities:** Stronger text rendering, layout fidelity, and "thinking" for images. It can search the web to generate multiple candidates and self-check outputs.
*   **Productivity Focus:** Optimized for slides, infographics, diagrams, UI mockups, and QR codes.
*   **Benchmark Dominance:** Ranked **#1 on Image Arena** leaderboards:
    *   **Text-to-image:** 1512 Elo (+242 lead over runner-up).
    *   **Single-image edit:** 1513 Elo.
    *   **Multi-image edit:** 1464 Elo.
*   **Integrations:** Figma, Canva, Adobe Firefly, and Hermes Agent.

### Moonshot AI: Kimi K2.6
A 1.1 trillion parameter Mixture-of-Experts (MoE) model optimized for long-horizon coding and autonomous orchestration.
*   **Performance:** Positioned as a viable **Claude Opus 4.7 replacement**, performing ~85% of tasks with added vision and browser capabilities.
*   **Real-world Feat:** Autonomously optimized a financial matching engine over 13 hours (1,000+ tool calls), increasing throughput by **185%**.
*   **Open Source Infra:** Released **FlashKDA** (Kimi Delta Attention kernels), providing a **1.72×–2.22× prefill speedup** on H20 GPUs.

### Google: Deep Research Max
Upgraded Deep Research via Gemini 3.1 Pro API.
*   **Features:** Collaborative planning, MCP support, multimodal inputs (PDF/Video/Audio), and real-time progress streaming.
*   **Scores:** 93.3% on DeepSearchQA; 54.6% on Humanity's Last Exam (HLE).

---

## 2. Agent Infrastructure & Research Loops

### Hugging Face: `ml-intern`
An open-source agent designed to automate the **post-training research loop**.
*   **Capabilities:** Reads papers, follows citations, collects datasets, launches training, and iterates on failures.
*   **Results:** Improved GPQA scientific reasoning from **10% → 32% in <10h** on Qwen3-1.7B.

### Hermes Expansion
*   **Hierarchical Decomposition:** Hermes subagents now support greater spawn width and recursive depth.
*   **Ecosystem:** New macOS GUI ("Scarf") and native support in Skillkit.

### The "Harness" Trend
Industry consensus is shifting: the **runtime/harness** (logic surrounding the model) is becoming as important as the model itself.
*   **DSPy 3.2:** Shipped RLM (Reasoning Lifecycle Management) improvements and LiteLLM decoupling.
*   **vLLM Recipes:** New interactive command builder and JSON API for agent-led deployments.

---

## 3. Local LLM & Coding Developments

### Gemma 4 (Google)
*   **Vision Optimization:** Users found default vision tokens (40-280) insufficient for OCR. Increasing to **560-2240 tokens** allows Gemma 4 to outperform Qwen 3.5/3.6 in vision tasks, though VRAM usage jumps to **77GB**.
*   **Safety Criticism:** The `Gemma-4-E2B` model is being criticized for "hard refusals" on survival topics (e.g., emergency airway procedures), making it difficult to use as an offline emergency resource.

### Qwen 3.6
*   **Qwen 3.6 Max:** Preview live on Qwen Chat; holds the highest AA-Intelligence Index (52) among Chinese models.
*   **Usage:** Preferred for coding and tool-calling, while Gemma 4 is favored for creative writing and translation.

---

## 4. Specialized Tools & Technical Excerpts

### Retrieval Models
*   **LightOn Release:** `LateOn` and `DenseOn` (149M parameters).
*   **Metric:** LateOn achieved **57.22 NDCG@10 on BEIR**, beating models 4x its size.

### Claude Code Workflow: Managing "Context Rot"
To prevent sessions from degrading into inefficient loops, Anthropic recommends:
*   Keep `CLAUDE.md` under **200 lines**.
*   Use `/compact` to focus context.
*   Use `/rewind` or `/clear` instead of repeated bug-fixing attempts.

### Data Recovery via AI
A notable use case emerged of using **Claude Code** to recover corrupted NAS data:
> "Claude Code was used to analyze and infer original folder structures from hundreds of thousands of loose files... effectively reconstructing data organization beyond simple file deduplication."

---

## 5. Critical Pricing & Policy Shifts
*   **Claude Pro Change:** Claude Code has been removed from the $20/mo Pro plan and moved to the **Max plan** ($100/mo), causing significant user backlash.
*   **Open Source Lobbying:** HF CEO Clement Delangue warned of renewed efforts to restrict open-source AI development through policy.