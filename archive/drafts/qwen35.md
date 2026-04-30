---
title: Qwen 3.5 Series
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [llm, qwen, moe, multimodal, alibaba]
sources:
  - url: https://openrouter.ai/qwen/qwen3.5-397b-a17b
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/17/qwen35/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Qwen 3.5 Series

Released February 16, 2026 by Alibaba's Qwen team. First models in the Qwen 3.5 series focusing on native multimodality and inference efficiency.

## Qwen3.5-397B-A17B (Open Weights)

- **Architecture:** Hybrid — linear attention (Gated Delta Networks) + sparse Mixture-of-Experts
- **Total parameters:** 397B, **17B active** per forward pass
- **Context:** 262,144 tokens (256K native)
- **Weights:** 807GB on HuggingFace; GGUF via Unsloth from 94.2GB (1-bit) to 462GB (Q8_K_XL)
- **Pricing (OpenRouter):** $0.39/M input, $2.34/M output

### Capabilities
- Multimodal: image/video understanding, GUI interactions
- Reasoning: supports reasoning-enabled outputs (step-by-step thinking)
- Coding: strong code generation across agent environments
- Rankings: Academia #29, Finance #39, Health #23, Legal #48, Programming #33

## Qwen3.5 Plus (Proprietary API)

- Hosted API variant of the 397B model
- **Context:** 1M tokens (expanded from 256K)
- **Integrated tools:** search, code interpreter (via Qwen Chat "Auto mode")

## Relevance to Chris's stacks

- Available on OpenRouter (same provider Chris uses)
- Competitive pricing at $0.39/M input (vs Claude Opus at $5/M)
- Worth watching for cost-sensitive workloads

## Chris's preferences

- See `chris-preferences.md#llm-models` for Chris's stance on model selection.
- Delta: Chris primarily uses Anthropic models via Hermes. Qwen could be a cost-optimized alternative for non-critical tasks.
- Last sync with chris-preferences: 2026-04-11
