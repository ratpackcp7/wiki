---
source_url: https://www.latent.space/p/ainews-not-much-happened-today
fetched: 2026-04-29T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-29-latent-space-ainews-not-much-happened-today
---

# [AINews] not much happened today - Latent.Space

## Metadata
- **Source**: https://www.latent.space/p/ainews-not-much-happened-today
- **Publisher**: Latent.Space (AINews weekday roundup section)
- **Date**: April 29, 2026
- **Access**: Paid post; partial content provided, truncated before final section (Platform Economics) behind paywall. 7-day free trial available to read full archives.

## Overview
AINews is a daily weekday roundup that moved to Substack alongside Latent.Space, with a commitment to daily Matt Levine-style op-eds. This issue notes a quiet news day, with upcoming essays in progress on inference demand and multiagents. Key coverage context (verbatim):

> AI News for 4/27/2026-4/28/2026. We checked 12 subreddits, [544 Twitters](https://twitter.com/i/lists/1585430245762441216)
>  and no further Discords. [AINews’ website](https://news.smol.ai/)
>  lets you search all past issues. As a reminder, [AINews is now a section of Latent Space](https://www.latent.space/p/2026)
> . You can [opt in/out](https://support.substack.com/hc/en-us/articles/8914938285204-How-do-I-subscribe-to-or-unsubscribe-from-a-section-on-Substack)
>  of email frequencies!

Notable high-level updates:
- Interesting but unproven long-term model releases from Nvidia Nemotron, Poolside, and Alec Radford (no further details provided for Radford’s release).
- **GPT-6 hype is beginning.**

---

## 1. Inference Systems, vLLM 0.20, & DeepSeek V4 Hardware/Kernel Race
### vLLM v0.20.0 Release
Shipped with major memory and MoE serving efficiency updates:
- **TurboQuant 2-bit KV cache** delivers 4× KV capacity
- FA4 re-enabled for MLA prefill on SM90+ GPUs
- New vLLM IR foundation, fused RMSNorm for 2.1% reported end-to-end latency improvement
- Supports: DeepSeek V4 MegaMoE on Blackwell, Jetson Thor, ROCm, Intel XPU, simplified GB200/Grace-Blackwell setup

### DeepSeek V4 Serving & Optimization
- SemiAnalysis shared early DeepSeek V4 Pro serving results on B200/B300/H200/GB200 disaggregated setups: **B300 up to 8× faster than H200** for this workload.
- Upcoming vLLM 0.20 benchmarking will use DeepGEMM MegaMoE, which fuses EP dispatch + EP combine + GEMMs + SwiGLU into a single mega-kernel.
- Jeremy Howard noted DeepSeek V4 retains prefill support, a capability many providers have dropped.
- Maharshi argued dynamic activation quantization has overhead; **static quantization outperforms on inference speed** despite calibration costs.
- teortaxesTex highlighted DeepSeek is moving away from CUDA lock-in via TileKernels, signaling model vendors may optimize for heterogeneous/domestic accelerator fleets over NVIDIA-only deployment.

---

## 2. Open Model Releases
### Poolside Laguna XS.2 (First Public Poolside Model)
- **33B total / 3B active MoE** coding model, trained fully in-house on proprietary data, training infra, RL, and inference stack
- Released under **Apache 2.0**, advertised to run on a single GPU
- Also released: Laguna M.1 and an agent harness
- Community details: Two coder variants (225B/23B active, 33B/3B active) with hybrid attention, FP8 KV cache, performance near Qwen-3.5. Ollama shipped the model immediately.

### NVIDIA Nemotron 3 Nano Omni (Largest Infra-Native Launch of the Day)
- **30B total / A3B multimodal MoE** with 256K context, built for agentic workloads spanning text, image, video, audio, and documents
- NVIDIA’s first omni release: Backed by Parakeet encoder for speech/audio understanding, English-only for now, **5.95% WER** on Open ASR leaderboard
- Throughput: ~9× vs comparable open omni models
- Same-day availability across: OpenRouter, LM Studio, Ollama, Unsloth, fal, Fireworks, DeepInfra, Together, Baseten, Canonical, and more.

### Other Notable Releases
- **Microsoft TRELLIS.2**: Open-source 4B image-to-3D model producing up to 1536³ PBR textured assets, built on native 3D VAEs with 16× spatial compression.
- **World-R1**: Claims existing video models already encode 3D structure, can be “woken up” with RL, requiring no architecture changes, extra video training data, or added inference cost.

---

## 3. Agents, Local-First Tooling, & Production Orchestration
### Production Primitives
Agent builders are shifting from demos to production-ready tooling:
- Mistral launched **Workflows** (public preview): Orchestration layer for durable, observable, fault-tolerant enterprise AI processes.
- Sydney Runkle framed durable execution as a key requirement for long-running agents.
- threepointone shared work on subagents/agents-as-tools with persistence, streaming, and resumption.

### Local/Offline Agents
Local agent workflows moved from aspiration to credible implementation:
- Teknium asserted “totally offline agents are possible.”
- Niels Rogge demoed Pi + local models for desktop cleanup; Google Gemma shared a local coding agent tutorial.
- Hugging Face update: 300,000 users have added hardware specs to the Hub to discover local run compatibility.
- Ammaar open-sourced a vibe-coding app running Gem

[... summary truncated for context management ...]
