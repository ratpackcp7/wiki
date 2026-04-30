---
title: Where's the raccoon with the ham radio? (ChatGPT Images 2.0)
source_url: https://simonwillison.net/2026/Apr/21/gpt-image-2/#atom-everything
fetched: 2026-04-22T07:32:20.652114
blog: Simon Willison
published_date: 2026-04-21
content_type: blog
---
# Where’s the raccoon with the ham radio? (ChatGPT Images 2.0)

**Source:** [Simon Willison’s Weblog](https://simonwillison.net/2026/Apr/21/gpt-image-2/)  
**Date:** April 21, 2026

## Overview
OpenAI released **ChatGPT Images 2.0** on April 21, 2026. Sam Altman described the advancement from version 1 to 2 as equivalent to the leap from GPT-3 to GPT-5. Simon Willison tested the model's ability to handle complex, detailed illustrations using a "Where's Waldo" style prompt.

**The Test Prompt:**
> `Do a where's Waldo style image but it's where is the raccoon holding a ham radio`

---

## Model Comparisons

### 1. GPT-Image-1 (Baseline)
*   **Result:** Failed to generate a visible raccoon.
*   **Analysis:** Claude Opus 4.7 (with high-res input) was also unable to find the target in the generated image, despite the model's claim that one was hidden.

### 2. Google Nano Banana 2 & Pro
*   **Nano Banana 2 (via Gemini):** Successful. The raccoon was clearly visible in an "Amateur Radio Club" booth. Claude noted a clever "W6HAM" callsign pun in the image.
*   **Nano Banana Pro:** Produced the worst result; the raccoon was oversized and featured an "ugly white border," failing the "Where's Waldo" aesthetic entirely.

### 3. GPT-Image-2
*   **Default Settings:** Initially failed to produce a visible raccoon.
*   **High-Quality Settings:** By increasing `outputQuality` to `high` and resolution to `3840x2160`, the model successfully generated a highly detailed image with a hidden raccoon in the bottom left.
*   **Cost:** The high-quality generation used **13,342 output tokens**, costing approximately **$0.40** (based on $30/million tokens).

---

## Technical Implementation
Willison used a custom Python script to call the model, noting that the OpenAI client library accepts the new model ID even before an official update.

**Execution Command:**
```shell
OPENAI_API_KEY="$(llm keys get openai)" \
  uv run 'https://raw.githubusercontent.com/simonw/tools/refs/heads/main/python/openai_image.py' \
  -m gpt-image-2 "Do a where's Waldo style image but it's where is the raccoon holding a ham radio" \
  --quality high --size 3840x2160
```

---

## Key Insights & Takeaways

*   **New Leader:** GPT-Image-2 currently appears to "take the crown" from Google's Gemini for complex illustrations involving text and fine detail.
*   **Complexity Testing:** "Where's Waldo" prompts are effective for testing a model's ability to maintain coherence across dense, detail-heavy scenes.
*   **Hallucination Risk:** Models cannot be trusted to "solve" their own puzzles. When asked to find the raccoon in a failed generation, ChatGPT "hallucinated" a red circle around a raccoon that did not exist in the original image.

> "Looks like we definitely can’t trust these models to usefully solve their own puzzles!" — *Simon Willison*