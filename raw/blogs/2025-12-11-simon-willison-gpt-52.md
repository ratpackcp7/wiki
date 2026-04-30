---
source_url: https://simonwillison.net/2025/Dec/11/gpt-52/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-11-simon-willison-gpt-52
---

# GPT-5.2

Following a "code red" declared on December 1, 2025, in response to Google's Gemini 3, OpenAI released **GPT-5.2**. Positioned as the premier model for "professional knowledge work," the series introduces significant performance gains and a new server-side compaction feature.

---

### 1. Model Variants & Technical Specifications
The release includes two primary variants: **GPT-5.2** and **GPT-5.2 Pro**.

| Feature | GPT-5.2 / Pro |
| :--- | :--- |
| **Knowledge Cut-off** | August 31, 2025 |
| **Context Window** | 400,000 tokens |
| **Max Output** | 128,000 tokens |
| **Modes** | "Instant" and "Thinking" (Reasoning) |

#### Pricing (1.4x increase over GPT-5.1)
*   **GPT-5.2:** $1.75 / million input | $14 / million output.
*   **GPT-5.2 Pro:** $21.00 / million input | $168.00 / million output.

---

### 2. Benchmarks & Efficiency
OpenAI reports massive leaps in reasoning and knowledge tasks:
*   **GDPval (Knowledge Work):** 70.9% (vs. 38.8% for GPT-5).
*   **ARC-AGI-2:** 52.9% (vs. 17.6% for GPT-5.1 Thinking).
*   **Efficiency Gain:** The ARC Prize verified a **~390X efficiency improvement** in one year. GPT-5.2 Pro achieved a 90.5% SOTA score at $11.64/task, compared to an o3 preview that cost ~$4.5k/task for 88%.

---

### 3. Developer Implementation
The model can be accessed via the Codex CLI:
```bash
codex -m gpt-5.2
```

#### API Models
*   `gpt-5.2`: Likely corresponds to "Thinking" mode.
*   `gpt-5.2-chat-latest`: Used for "Instant" mode; features a reduced 128k context and 16,384 max output.
*   `gpt-5.2-pro`: The high-tier professional model.

#### New Feature: Response Compaction
A new server-side API endpoint (`/responses/compact`) allows for long-running workflows:
> "Compaction performs a loss-aware compression pass over prior conversation state, returning encrypted, opaque items that preserve task-relevant information while dramatically reducing token footprint."

---

### 4. Vision & Real-World Performance
OpenAI claims GPT-5.2 Thinking is their "strongest vision model yet," halving error rates in chart reasoning and UI understanding.

*   **OCR Improvement:** Simon Willison noted significantly better results on OCR tasks compared to GPT-5.
*   **Complex Coding:** In a real-world test, GPT-5.2 successfully ported a complex Python library to JavaScript via the Codex CLI in a four-hour autonomous session.
*   **Instruction Following:** The model successfully rendered complex SVGs (e.g., a California brown pelican in breeding plumage) with high adherence to specific anatomical and mechanical details.

**Example OCR Command:**
```shell
llm -m gpt-5.2 ocr -a https://static.simonwillison.net/static/2025/ft.jpeg
```

---

### 5. Key Takeaways for Users
*   **Cost vs. Performance:** While more expensive, the efficiency in solving complex tasks (like ARC-AGI) has dropped in price by orders of magnitude.
*   **Professional Use:** The model is specifically tuned for "knowledge work" and long-form reasoning.
*   **Vision:** Significant reliability gains in reading charts and software interfaces.
