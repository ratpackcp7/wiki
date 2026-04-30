---
source_url: https://news.smol.ai/issues/26-04-28-not-much/
fetched: 2026-04-29T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-29-ainews-smol-ai-not-much-happened-today
---

# not much happened today | AINews

Source: [https://news.smol.ai/issues/26-04-28-not-much/](https://news.smol.ai/issues/26-04-28-not-much/)

---

## Issue Overview
> AI News for 4/27/2026-4/28/2026. We checked 12 subreddits, [544 Twitters](https://twitter.com/i/lists/1585430245762441216) and no further Discords. [AINews’ website](https://news.smol.ai/) lets you search all past issues. As a reminder, [AINews is now a section of Latent Space](https://www.latent.space/p/2026). You can [opt in/out](https://support.substack.com/hc/en-us/articles/8914938285204-How-do-I-subscribe-to-or-unsubscribe-from-a-section-on-Substack) of email frequencies!

> a quiet day.

*Note: Discord access was permanently shut down for this publication; a new AINews format is upcoming.*

### Quick Reference Tags
#### Companies
vllm, poolside, nvidia, opensrouter, lmstudio, ollama, unsloth, fal, fireworks, deepinfra, togethercompute, baseten, canonical

#### Models
vllm-0.20.0, poolside-laguna-xs.2, ling-2.6-flash, nemotron-3-nano-omni, qwen-3.5

#### Topics
memory-optimization, mixture-of-experts, model-optimization, inference-speed, quantization, model-deployment, multimodality, hardware-optimization, model-benchmarking, open-models, agentic-ai

#### People
jeremyphoward, maharshii, teortaxestex, aymericroucher, piotrz

---

## AI Twitter Recap

### Inference Systems & vLLM 0.20
*   **vLLM v0.20.0 released** with key updates:
    - TurboQuant 2-bit KV cache for 4× KV capacity
    - FA4 re-enabled for MLA prefill on SM90+ GPUs
    - New vLLM IR foundation, fused RMSNorm (2.1% end-to-end latency improvement)
    - Support for DeepSeek V4 MegaMoE on Blackwell, Jetson Thor, ROCm, Intel XPU, easier GB200/Grace-Blackwell setup
    - Day-0 support for Poolside Laguna XS.2, Ling-2.6-flash, NVIDIA Nemotron 3 Nano Omni
*   **SemiAnalysis benchmarks**: B300 up to 8× faster than H200 for DeepSeek V4 Pro on disaggregated B200/B300/H200/GB200 setups. Upcoming vLLM 0.20 benchmarking with DeepGEMM MegaMoE, which fuses `EP dispatch + EP combine + GEMMs + SwiGLU` into a single mega-kernel.
*   Key insights:
    > static quantization often wins on inference speed despite calibration cost. – Maharshi
    > DeepSeek is structurally moving away from CUDA lock-in via TileKernels – teortaxesTex (suggests model vendors will optimize for heterogeneous/domestic accelerators over NVIDIA-only)
    > DeepSeek V4’s support for prefill [is] a capability many providers have dropped. – Jeremy Howard

### Open Model Releases
#### Poolside Laguna XS.2
*   First public Poolside model: 33B total / 3B active MoE coding model, Apache 2.0 license, runs on single GPU
*   Trained fully in-house (data, training infra, RL, inference stack), hybrid attention, FP8 KV cache, performance near Qwen-3.5. Also released: Laguna M.1 (225B/23B active) and agent harness. Ollama shipped day-0 support.

#### NVIDIA Nemotron 3 Nano Omni
*   30B / A3B multimodal MoE, 256K context, supports text/image/video/audio/documents
*   English-only, Parakeet encoder for speech/audio, 5.95% WER on Open ASR leaderboard, ~9× throughput vs comparable open omni models
*   Immediate same-day availability across: OpenRouter, LM Studio, Ollama, Unsloth, fal, Fireworks, DeepInfra, Together, Baseten, Canonical

#### Other Releases
*   **Microsoft TRELLIS.2**: Open-source 4B image-to-3D model, produces up to 1536³ PBR textured assets, 16× spatial compression via native 3D VAEs
*   **World-R1**: Claims existing video models encode 3D structure, can be "woken up" with RL, no architecture changes/extra training data/added inference cost

### Agents, Local-First Tooling & Production Orchestration
*   **Production agent primitives**: Mistral launched Workflows (public preview) for durable, observable, fault-tolerant enterprise AI orchestration. Durable execution highlighted as key for long-running agents.
*   **Local/offline agents**:
    > totally offline agents are possible – Teknium
    *   Demos: Pi + local models for desktop cleanup, Google Gemma local coding agent tutorial
    *   300k Hugging Face Hub users added hardware specs to discover local runnability
    *   Ammaar open-sourced vibe-coding app running Gemma 4 fully on-device via MLX; Sigma (private browser-based local agent) highlighted
*   **Hermes adoption**: Outperforming OpenClaw in instruction-following, deployed via Telegram, used for medical literature extraction. Hugging Face ML Intern added native metric logging + Trackio integration for observable training.

### Benchmarks, Evals & Research
*   **Frontier model benchmarks**:
    *   Epoch: GPT-5.5 Pro reaches 159 on Epoch Capabilities Index, 52% on FrontierMath Tiers 1–3, 40% on Tier 4 (first to solve two Tier4 problems)
    *   Greg Kamradt: ARC-AGI-3 testing for GPT-5.5 and Opus 4.7 complete, failure modes under analysis
*   **New benchmarks**:
    *   Agent-friendly Transformers benchmark, VibeBench (1000 qualified SWEs for subjective real-world testing)
    *   Llama

[... summary truncated for context management ...]
