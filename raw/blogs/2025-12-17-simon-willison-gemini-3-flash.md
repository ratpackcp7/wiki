---
source_url: https://simonwillison.net/2025/Dec/17/gemini-3-flash/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-17-simon-willison-gemini-3-flash
---

# Gemini 3 Flash

# Gemini 3 Flash: Overview and Analysis

Google has released **Gemini 3 Flash**, the latest entry in its "Flash" line designed for speed and cost-efficiency. It is positioned as a high-performance alternative to the previous generation's top-tier model, Gemini 2.5 Pro.

---

## 1. Key Specifications & Comparison
Gemini 3 Flash mirrors the capabilities of Gemini 3 Pro but at a significantly lower price point and with higher rate limits.

*   **Capabilities:** Multimodal (Text, image, video, audio, PDF input; text-only output).
*   **Context Window:** 1,048,576 input tokens; 65,536 output tokens.
*   **Knowledge Cut-off:** January 2025.
*   **Performance:** Surpasses Gemini 2.5 Pro across many benchmarks.
*   **Efficiency:** Uses ~30% fewer tokens on average than 2.5 Pro due to better modulation of "thinking."

### Pricing Comparison
| Model | Input (per 1M) | Output (per 1M) |
| :--- | :--- | :--- |
| **Gemini 3 Flash** | **$0.50** | **$3.00** |
| Gemini 2.5 Flash | $0.30 | $2.50 |
| Gemini 3 Pro | $2.00 (≤200k) | $12.00 (≤200k) |

---

## 2. New Feature: Thinking Levels
Unlike Gemini 3 Pro (which only offers `low` and `high`), Gemini 3 Flash supports four distinct thinking levels: **minimal, low, medium, and high**.

### Implementation via LLM CLI
```bash
llm install -U llm-gemini
llm -m gemini-3-flash-preview --thinking-level minimal "Generate an SVG of a pelican riding a bicycle"
```

---

## 3. Practical Use Cases & Coding Performance

### Automated Alt Text Generation
```shell
llm -m gemini-3-flash-preview --system '
You write alt text for any image pasted in by the user. Alt text is always presented in a
fenced code block to make it easy to copy and paste out. It is always presented on a single
line so it can be used easily in Markdown images. All text on the image (for screenshots etc)
must be exactly included. A short note describing the nature of the image itself should go first.' \
-a https://static.simonwillison.net/static/2025/gemini-3-flash-preview-thinking-level-high-pelican-svg.jpg
```

### Web Component Development
Willison built a functional `<image-gallery>` component using a series of five prompts.
*   **Total Cost:** ~4.84 cents for 21,314 input and 12,593 output tokens.
*   **Workflow:** Used `llm -c` for iterative refinements (e.g., adding a modal, adjusting icons, removing hover effects).

---

## 4. Notable Limitations
*   **Image Segmentation:** A significant regression from Gemini 2.5 Flash. Gemini 3 Pro and Flash **do not** support returning pixel-level masks for objects.
*   **Recommendation:** For workloads requiring native image segmentation, users should stick to **Gemini 2.5 Flash** (with thinking off) or **Gemini Robotics-ER 1.5**.

> "Image segmentation capabilities... are not supported in Gemini 3 Pro or Gemini 3 Flash... they're a really neat capability that is unique to Gemini." — *Simon Willison*
