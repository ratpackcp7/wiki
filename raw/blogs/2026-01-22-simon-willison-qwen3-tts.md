---
source_url: https://simonwillison.net/2026/Jan/22/qwen3-tts/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-01-22-simon-willison-qwen3-tts
---

# Qwen3-TTS Family is Now Open Sourced: Voice Design, Clone, and Generation

## Overview
Qwen has released the **Qwen3-TTS series**, a family of advanced, multilingual text-to-speech models. These models are now open-sourced under the **Apache 2.0 license**, providing state-of-the-art capabilities for voice cloning, description-based voice design, and real-time streaming synthesis.

> "Qwen3-TTS supports state-of-the-art 3-second voice cloning and description-based control, allowing both the creation of entirely novel voices and fine-grained manipulation over the output speech." — *Qwen3-TTS Paper*

---

## Key Technical Specifications
*   **Training Data:** Over 5 million hours of speech data across 10 languages.
*   **Architecture:** Dual-track Language Model (LM) designed for real-time, streaming synthesis.
*   **Model Sizes (Hugging Face):**
    *   **1.7B Base:** ~4.54 GB
    *   **0.6B Base:** ~2.52 GB
*   **License:** Apache 2.0 (includes models and tokenizers).

---

## Core Capabilities
1.  **Voice Cloning:** Can clone a voice using only a **3-second reference audio** clip.
2.  **Voice Design:** Allows users to describe a voice (e.g., "gruff voice") to generate speech without a reference sample.
3.  **Multilingual Support:** High performance across diverse language benchmarks.
4.  **Accessibility:** Available for local execution on consumer GPUs or via browser-based demos.

---

## Practical Implementation & Tools

### Browser Demo
A free demo is available on [Hugging Face Spaces](https://huggingface.co/spaces/Qwen/Qwen3-TTS), allowing users to test voice cloning and design directly in the browser.

### Command Line Interface (CLI)
Simon Willison developed a CLI tool (via Claude) based on Prince Canuma's `mlx-audio` library. This allows users to run the model locally using `uv`.

**Example Command:**
```bash
uv run https://tools.simonwillison.net/python/q3_tts.py \
  'I am a pirate, give me your gold!' \
  -i 'gruff voice' -o pirate.wav
```
*   **Note:** The `-i` flag allows for descriptive voice prompts. The first run will trigger a ~4.5GB download of the model.

---

## Expert Insight
Simon Willison emphasizes the democratization of high-fidelity voice technology:
> "It's important that everyone understands that voice cloning is now something that's available to anyone with a GPU and a few GBs of VRAM... or in this case a web browser."
