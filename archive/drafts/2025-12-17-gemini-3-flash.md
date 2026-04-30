---
title: Gemini 3 Flash
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [gemini, google, llm, ai-models]
sources:
  - url: https://simonwillison.net/2025/Dec/17/gemini-3-flash/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Gemini 3 Flash

Google's latest "Flash" model — designed for speed and cost-efficiency, positioned as a high-performance alternative to Gemini 2.5 Pro.

## Key specs

| Spec | Value |
|------|-------|
| Context window | 1M input / 65K output |
| Modalities | Text, image, video, audio, PDF input; text output |
| Knowledge cutoff | January 2025 |
| Pricing | $0.50/1M input, $3.00/1M output |
| Thinking levels | minimal, low, medium, high (4 levels vs Pro's 2) |

## Performance

- Surpasses Gemini 2.5 Pro across many benchmarks
- Uses ~30% fewer tokens than 2.5 Pro (better "thinking" modulation)
- Web component demo: ~4.84 cents for 21K input + 12.5K output tokens

## Notable limitation

- **Image segmentation regression:** Gemini 3 Pro and Flash do NOT support pixel-level masks. Stick to Gemini 2.5 Flash (thinking off) or Gemini Robotics-ER 1.5 for segmentation workloads.

## LLM CLI support

```bash
llm install -U llm-gemini  # v0.28+ supports thinking levels
llm -m gemini-3-flash-preview --thinking-level minimal "prompt"
```

## Chris's preferences

- See `chris-preferences.md#AI & LLM` for Chris's stance.
- Delta: Chris primarily uses Anthropic models via Hermes. Gemini is available but not primary.
- Last sync with chris-preferences: 2026-04-11

## Sources

- Simon Willison blog: https://simonwillison.net/2025/Dec/17/gemini-3-flash/
