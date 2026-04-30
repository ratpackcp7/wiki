---
source_url: https://simonwillison.net/2026/Apr/24/deepseek-v4/#atom-everything
fetched: 2026-04-24T07:35:13.702364
fetcher: blogwatcher
content_type: blog
slug: 2026-04-24-simon-willison-deepseek-v4-almost-on-the-frontier-a-fraction-of-the-price
---

# DeepSeek V4: Frontier Performance at Disruptive Pricing

**Date:** April 24, 2026
**Source:** [Simon Willison’s Weblog](https://simonwillison.net/2026/Apr/24/deepseek-v4/)

DeepSeek has released the first preview models of their V4 series: **DeepSeek-V4-Pro** and **DeepSeek-V4-Flash**. These models represent a significant leap in open-weights scale and efficiency, positioning themselves as the most cost-effective alternatives to major frontier models.

---

### 1. Model Specifications & Architecture
Both models utilize a **Mixture of Experts (MoE)** architecture and feature a **1 million token context window** under an **MIT license**.

| Feature | DeepSeek-V4-Pro | DeepSeek-V4-Flash |
| :--- | :--- | :--- |
| **Total Parameters** | 1.6 Trillion | 284 Billion |
| **Active Parameters** | 49 Billion | 13 Billion |
| **Hugging Face Size** | 865 GB | 160 GB |
| **Status** | Largest open weights model | High-efficiency small model |

> **Note:** DeepSeek-V4-Pro is now larger than other major open models like Kimi K2.6 (1.1T) and GLM-5.1 (754B).

### 2. Pricing Comparison
DeepSeek V4 is positioned as the price leader in the market, significantly undercutting competitors like OpenAI, Google, and Anthropic.

| Model | Input ($/M) | Output ($/M) |
| :--- | :--- | :--- |
| **DeepSeek V4 Flash** | **$0.14** | **$0.28** |
| GPT-5.4 Nano | $0.20 | $1.25 |
| Gemini 3.1 Flash-Lite | $0.25 | $1.50 |
| **DeepSeek V4 Pro** | **$1.74** | **$3.48** |
| Gemini 3.1 Pro | $2.00 | $12.00 |
| GPT-5.4 | $2.50 | $15.00 |
| Claude Opus 4.7 | $5.00 | $25.00 |

### 3. Technical Efficiency & Performance
The low pricing is driven by massive architectural efficiency gains, particularly regarding long-context handling.

* **Efficiency Gains (vs. V3.2):**
    * **Pro:** Uses only 27% of single-token FLOPs and 10% of the KV cache size.
    * **Flash:** Uses only 10% of single-token FLOPs and 7% of the KV cache size.
* **Performance Gap:** DeepSeek admits their Pro model trails state-of-the-art (SOTA) frontier models (like GPT-5.4) by roughly **3 to 6 months**, though it remains highly competitive on reasoning benchmarks.

### 4. Implementation & Local Running
The models can be accessed via **OpenRouter**. Simon Willison demonstrates usage via the `llm` CLI tool:

```bash
llm install llm-openrouter
llm openrouter refresh
llm -m openrouter/deepseek/deepseek-v4-pro 'Generate an SVG of a pelican riding a bicycle'
```

**Local Execution Outlook:**
* **Flash:** Likely to run on a 128GB M5 MacBook Pro with light quantization.
* **Pro:** May be possible to run on consumer hardware if active experts are streamed from disk.
* **Quantization:** The [Unsloth team](https://huggingface.co/unsloth/models) is expected to release optimized versions shortly.

### 5. Key Insight: The "Pelican Test"
In visual generation (SVG) tests, the **Flash** model actually outperformed the **Pro** model in anatomical accuracy, though both produced solid bicycle geometry. This suggests that the smaller, more efficient model may be highly capable for specific structured data tasks.