---
source_url: https://simonwillison.net/2026/Feb/19/gemini-31-pro/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-19-simon-willison-gemini-31-pro
---

# Gemini 3.1 Pro

Google has released **Gemini 3.1 Pro**, the first model in the 3.1 series. It serves as the upgraded core intelligence behind the "Deep Think" update released a week prior.

## Pricing
Gemini 3.1 Pro is priced identically to Gemini 3 Pro, making it significantly more affordable than competitors like Claude Opus 4.6 (less than half the price) while maintaining similar benchmark scores.

| Token Count | Input Price (per 1M) | Output Price (per 1M) |
| :--- | :--- | :--- |
| Under 200,000 | $2.00 | $12.00 |
| 200,000 to 1,000,000 | $4.00 | $18.00 |

## Key Feature: SVG Generation & Animation
A major highlight is improved performance in generating and animating SVGs.

- The "Pelican Test": Simon Willison tested the model with a prompt for a "pelican riding a bicycle."
- Performance: The model took 323.9 seconds to "think" before producing a high-quality, flat-style illustration.
- The model included specific semantic comments within the SVG code.

## Developer Tools & Integration
Simon Willison updated the llm-gemini plugin to include two new model IDs:
1. gemini-3.1-pro-preview
2. gemini-3.1-pro-preview-customtools — A specialized version designed for potentially better tool-calling performance.

## Current Limitations
- On launch day, the model was "incredibly slow," taking 104 seconds to respond to a simple "hi."
- Users encountered "high demand" errors and "Deadline expired" messages.

Google's Gemini Lead, Jeff Dean, showcased the model's capabilities via a video featuring various animals on different modes of transportation.
