---
source_url: https://fly.io/blog/wrong-about-gpu/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-wrong-about-gpu
---

# We Were Wrong About GPUs

Kurt Mackey retrospective on Fly.io's GPU bet.

Security challenge: GPUs are worst-case hardware peripherals (intense DMA, arbitrary computation outside normal security boundary). Engineering struggle: Used Intel Cloud Hypervisor for PCI passthrough, hex-edited Nvidia drivers, modified orchestrator.

Market reality: Developers don't want GPUs. They don't want AI/ML models. They want LLMs via API. Can't compete with OpenAI/Anthropic for general developers.

Middle ground problem: High-end wants H100 clusters, low-end wants fractional GPUs (MIG doesn't work with Fly's stack).

L40S exception: Only high-utilization GPU, led to price halving.

Lessons: Design for 10,000. Asset-backed bets (hardware + IPv4 have durable value). "Phlogiston era" of AI collapsed around few foundational LLMs.

Status: Not shutting down, no v2 planned, returning focus to core: running code in containers with great DX.
