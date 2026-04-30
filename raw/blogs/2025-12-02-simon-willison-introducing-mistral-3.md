---
source_url: https://simonwillison.net/2025/Dec/2/introducing-mistral-3/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-02-simon-willison-introducing-mistral-3
---

# Introducing Mistral 3: Model Family Overview

On December 2, 2025, Mistral AI released four new multimodal models. This release is notable for its **Apache 2.0 licensing** and the introduction of vision capabilities across the entire lineup.

## 1. The Model Lineup
The release consists of three "Ministral" (smaller) models and one flagship large-scale model:

*   **Ministral 3B:** A tiny, highly efficient model (~3GB file size).
*   **Ministral 8B:** Mid-range dense model.
*   **Ministral 14B:** High-performance dense model.
*   **Mistral Large 3:** A Mixture-of-Experts (MoE) model with **675B total parameters** (41B active).

## 2. Key Features & Capabilities
*   **Vision Capable:** All models in this release can process visual inputs.
*   **Local Browser Execution:** The **Ministral 3B** is small enough to run 100% locally in a web browser using WebGPU.
*   **Open License:** Released under the **Apache 2.0 license**, allowing for broad use and modification.

### Browser Demo Insight
Xenova (Hugging Face) demonstrated the 3B model running locally. Users can fetch the 3GB model and perform live inference via webcam without sending data to a server.
> "Surprisingly, the 3B is small enough to run 100% locally in your browser on WebGPU! 🤯" — *Xenova*

## 3. Developer Integration & Testing
Simon Willison confirmed that these models are already accessible via his `llm-mistral` plugin.

### Updating the LLM Plugin
To add the new models to the `llm` CLI tool, use the following command:
```bash
$ llm mistral refresh
Added models: ministral-3b-2512, ministral-14b-latest, mistral-large-2512, ministral-14b-2512, ministral-8b-2512
```

### Performance Observations
In vision-to-image generation/description tests (specifically "pelicans"):
*   **Mistral Large 3:** Produced the best results, though still struggled with fine anatomical details (e.g., missing the pelican's pouch).
*   **Ministral 3B:** Struggled significantly with complex visual generation, producing abstract shapes rather than coherent imagery.

## 4. Resource Links
*   **Official Announcement:** [Mistral AI News](https://mistral.ai/news/mistral-3)
*   **WebGPU Demo:** [Ministral 3B on Hugging Face Spaces](https://huggingface.co/spaces/mistralai/Ministral_3B_WebGPU)
*   **Plugin Repository:** [llm-mistral on GitHub](https://github.com/simonw/llm-mistral)
