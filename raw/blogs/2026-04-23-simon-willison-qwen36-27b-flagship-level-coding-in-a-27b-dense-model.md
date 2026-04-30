---
source_url: https://simonwillison.net/2026/Apr/22/qwen36-27b/#atom-everything
fetched: 2026-04-23T07:30:00-00:00
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-22
slug: 2026-04-23-simon-willison-qwen36-27b-flagship-level-coding-in-a-27b-dense-model
---

# Qwen3.6-27B: Flagship-Level Coding in a 27B Dense Model

**Source:** [Simon Willison’s Weblog](https://simonwillison.net/2026/Apr/22/qwen36-27b/)  
**Date:** April 22, 2026

## Overview
Qwen has released **Qwen3.6-27B**, a dense open-weight model that claims to deliver "flagship-level agentic coding performance." Despite its smaller size, it reportedly outperforms the previous generation's much larger Mixture-of-Experts (MoE) flagship.

### Key Comparison
*   **Qwen3.6-27B (New):** 27B parameters, **55.6GB** (Full), ~17GB (Quantized).
*   **Qwen3.5-397B-A17B (Previous):** 397B total / 17B active MoE, **807GB**.
*   **Performance Claim:** The 27B dense model surpasses the 397B MoE model across all major coding benchmarks.

---

## Local Implementation & Setup
Simon Willison tested the model locally using the **Unsloth Q4_K_M GGUF** version (16.8GB) via `llama-server`.

### Installation & Execution Recipe
After installing via `brew install llama.cpp`, the following command was used to run the model:

```bash
llama-server \
    -hf unsloth/Qwen3.6-27B-GGUF:Q4_K_M \
    --no-mmproj \
    --fit on \
    -np 1 \
    -c 65536 \
    --cache-ram 4096 -ctxcp 2 \
    --jinja \
    --temp 0.6 \
    --top-p 0.95 \
    --top-k 20 \
    --min-p 0.0 \
    --presence-penalty 0.0 \
    --repeat-penalty 1.0 \
    --reasoning on \
    --chat-template-kwargs '{"preserve_thinking": true}'
```

---

## Performance & Benchmarking
Willison tested the model's ability to generate complex SVGs, noting "outstanding" results for a local model of this size.

### Test Case 1: "Pelican riding a bicycle" (SVG)
*   **Visual Quality:** High detail including spokes, chain, correctly shaped frame, and background elements (clouds, sun, grass).
*   **Generation Stats:**
    *   **Reading:** 20 tokens in 0.4s (54.32 t/s)
    *   **Generation:** 4,444 tokens in 2m 53s (**25.57 tokens/s**)

### Test Case 2: "North Virginia Opossum on an E-Scooter" (SVG)
*   **Visual Quality:** Neon Tron-inspired style with complex lighting and silhouettes.
*   **Generation Stats:**
    *   **Generation:** 6,575 tokens in 4m 25s (**24.74 tokens/s**)

---

## Summary of Insights
*   **Efficiency:** The model provides a massive reduction in disk space and memory requirements (from 807GB to ~56GB) while increasing performance.
*   **Local Capability:** Achieving ~25 tokens/second on a 27B model (quantized to 17GB) makes flagship-level coding and reasoning highly accessible on consumer-grade hardware.
*   **Reasoning:** The inclusion of the `--reasoning on` flag in the setup suggests the model utilizes advanced chain-of-thought or reasoning capabilities during generation.