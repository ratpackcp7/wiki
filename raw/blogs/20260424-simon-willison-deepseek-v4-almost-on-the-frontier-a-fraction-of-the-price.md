---
source_url: https://simonwillison.net/2026/Apr/24/deepseek-v4/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-24
slug: deepseek-v4-almost-on-the-frontier-a-fraction-of-the-price
---

# DeepSeek V4: Frontier Performance at a Fraction of the Cost

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Apr/24/deepseek-v4/)  
**Date:** April 24, 2026

## Executive Summary
Chinese AI lab DeepSeek has released the first preview models of its highly anticipated **V4 series**: `DeepSeek-V4-Pro` and `DeepSeek-V4-Flash`. These models utilize a Mixture of Experts (MoE) architecture with a 1-million-token context window. The release is characterized by massive scale (Pro is likely the largest open-weights model currently available) and aggressive, industry-disrupting pricing.

---

## Model Specifications & Scale

| Feature | DeepSeek-V4-Pro | DeepSeek-V4-Flash |
| :--- | :--- | :--- |
| **Architecture** | Mixture of Experts (MoE) | Mixture of Experts (MoE) |
| **Total Parameters** | 1.6 Trillion | 284 Billion |
| **Active Parameters** | 49 Billion | 13 Billion |
| **Context Window** | 1 Million tokens | 1 Million tokens |
| **Hugging Face Size** | 865 GB | 160 GB |
| **License** | MIT | MIT |

> **Key Insight:** `DeepSeek-V4-Pro` is significantly larger than other major open-weights models, surpassing Kimi K2.6 (1.1T) and GLM-5.1 (754B).

---

## Pricing Comparison
DeepSeek's pricing is significantly lower than competitors from OpenAI, Google, and Anthropic.

### Small Model Tier (Input / Output per 1M tokens)
*   **DeepSeek V4 Flash:** **$0.14 / $0.28** (Cheapest in class)
*   GPT-5.4 Nano: $0.20 / $1.25
*   Gemini 3.1 Flash-Lite: $0.25 / $1.50
*   Gemini 3 Flash Preview: $0.50 / $3.00
*   GPT-5.4 Mini: $0.75 / $4.50
*   Claude Haiku 4.5: $1.00 / $5.00

### Large/Frontier Model Tier (Input / Output per 1M tokens)
*   **DeepSeek V4 Pro:** **$1.74 / $3.48** (Cheapest in class)
*   Gemini 3.1 Pro: $2.00 / $12.00
*   GPT-5.4: $2.50 / $15.00
*   Claude Sonnet 4.6: $3.00 / $15.00
*   Claude Opus 4.7: $5.00 / $25.00
*   GPT-5.5: $5.00 / $30.00

---

## Technical Efficiency & Performance

### Efficiency Gains
DeepSeek achieved low pricing through massive efficiency improvements in long-context handling. According to the DeepSeek paper:

> "In the scenario of 1M-token context, even DeepSeek-V4-Pro... attains only 27% of the single-token FLOPs... and 10% of the KV cache size relative to DeepSeek-V3.2. Furthermore, DeepSeek-V4-Flash... achieves only 10% of the single-token FLOPs and 7% of the KV cache size compared with DeepSeek-V3.2."

### Benchmarks & Trajectory
While competitive, the models are not yet the absolute state-of-the-art:
*   **Strengths:** `DeepSeek-V4-Pro-Max` outperforms GPT-5.2 and Gemini-3.0-Pro on standard reasoning benchmarks.
*   **Weaknesses:** It trails GPT-5.4 and Gemini-3.1-Pro.
*   **Trajectory:** The paper suggests DeepSeek is trailing the absolute frontier by approximately **3 to 6 months**.

---

## Developer Implementation

### Testing via OpenRouter
The author tested the models using the `llm` CLI tool with the `llm-openrouter` plugin:

```bash
llm install llm-openrouter
llm openrouter refresh
llm -m openrouter/deepseek/deepseek-v4-pro 'Generate an SVG of a pelican riding a bicycle'
```

### Local Execution Notes
*   **Flash Model:** The 160GB size suggests that a lightly quantized version may run on high-end consumer hardware (e.g., a 128GB M5 MacBook Pro).
*   **Pro Model:** Running the 865GB Pro model locally may only be possible via streaming necessary active experts from disk.
*   **Optimization:** The author is watching [unsloth/models](https://huggingface.co/unsloth/models) for upcoming quantized versions.