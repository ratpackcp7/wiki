---
source_url: https://simonwillison.net/2026/Feb/17/qwen35/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-qwen35
---

# Qwen3.5: Towards Native Multimodal Agents

Alibaba's Qwen team has released the first two models in the **Qwen 3.5 series**. These models focus on native multimodality (vision input) and high inference efficiency.

## 1. Open Weights Model: Qwen3.5-397B-A17B
A massive **Mixture of Experts (MoE)** model designed to balance high capability with serving efficiency.

- **Architecture:** Hybrid architecture fusing **linear attention** (via Gated Delta Networks) with **sparse MoE**.
- **Parameter Count:** 397 billion total parameters, but only **17 billion are activated** per forward pass.
- **Context Length:** Natively supports **256K tokens**.
- **Availability:** Hugging Face (807GB original, GGUF from 94.2GB to 462GB), OpenRouter hosted access.

## 2. Proprietary Model: Qwen3.5 Plus (2026-02-15)
- **Context Length:** Expanded to **1M tokens**.
- **Integrated Tools:** Supports built-in **search** and **code interpreter** (available via Qwen Chat "Auto mode").
- Hosted API variant of the 397B model with expanded capabilities.

## 3. Visual Performance Benchmarking
Simon Willison tested both models using his standard "pelican riding a bicycle" prompt:
- **Qwen3.5-397B-A17B:** Produced a "quite good" pelican, though the neck lacked an outline and the bicycle frame was basic/incomplete.
- **Qwen3.5 Plus:** Visually similar result, but with a "taller" bicycle and a "better frame shape." 
