---
source_url: https://simonwillison.net/2025/Dec/9/devstral-2/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-09-simon-willison-devstral-2
---

# Devstral 2: Mistral's New Coding Models

On December 9, 2025, Mistral released two new models specifically optimized for coding agents and their new CLI, **Mistral Vibe**. These models aim to provide high performance for agentic tasks with significantly lower parameter counts and costs than competitors.

## 1. Model Overview & Performance

### Devstral 2
*   **Size:** 123B parameters.
*   **Performance:** Achieves **72.2% on SWE-bench Verified**.
*   **Efficiency:** Claimed to be up to **7x more cost-efficient** than Claude 3.5 Sonnet for real-world tasks.
*   **Positioning:** State-of-the-art (SOTA) open model for code agents.

### Devstral Small 2
*   **Size:** 24B parameters.
*   **File Size:** 51.6GB on Hugging Face (unquantized).
*   **License:** Released under a standard **Apache 2** license.

---

## 2. Licensing Controversy ("Janky License")
While the Small model is fully open, the flagship **Devstral 2 (123B)** uses a "modified MIT" license that includes a revenue-based restriction:

> "You are not authorized to exercise any rights under this license if the global consolidated monthly revenue of your company (or that of your employer) exceeds $20 million (or its equivalent in another currency) for the preceding month. This restriction... applies to the Model and any derivatives, modifications, or combined works based on it..."

---

## 3. Hands-on Testing
Simon Willison tested both models using his `llm-mistral` plugin to generate SVG graphics.

### Implementation Code
To use these models via the CLI:
```bash
llm install llm-mistral
llm mistral refresh

# Run the 123B model
llm -m mistral/devstral-2512 "Generate an SVG of a pelican riding a bicycle"

# Run the 24B model (API version)
llm -m mistral/labs-devstral-small-2512 "Generate an SVG of a pelican riding a bicycle"
```

### Visual Results
*   **Devstral 2 (123B):** Produced a high-quality result, though the bicycle design was noted to look "a bit like a Cybertruck."
*   **Devstral Small 2 (24B):** Produced a decent result for its size, depicting a pelican on a child-like cart. It shows improvement over previous iterations like Mistral Small 3.2.

## Key Takeaways
*   **Agent Focus:** These models are specifically tuned for "Mistral Vibe" and other coding agent workflows.
*   **Cost vs. Performance:** Mistral is aggressively targeting Claude Sonnet's market share by emphasizing cost-efficiency.
*   **License Awareness:** Large enterprises (>$20M monthly revenue) cannot use the 123B model under the provided MIT modification and likely require commercial terms.

**Primary sources:**
*   [Devstral 2 & Vibe CLI announcement](https://mistral.ai/news/devstral-2-vibe-cli)
*   [Hugging Face: Devstral Small 2](https://huggingface.co/mistralai)