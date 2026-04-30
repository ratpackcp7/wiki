---
source_url: https://news.smol.ai/issues/26-04-24-deepseek-v4/
fetched: 2026-04-25T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-24-news-smol-ai-deepseek-v4
---

# DeepSeek v4 | AINews

## 1. The Headline: DeepSeek-V4 Release
DeepSeek has released its first major architecture refresh since V3, featuring a two-tier lineup with a **1M-token context window** and an **MIT license**. It is being hailed for its sophisticated long-context engineering and transparent technical reporting.

### Model Variants & Specs
*   **DeepSeek-V4 Pro:** 1.6T total parameters / **49B active**.
*   **DeepSeek-V4 Flash:** 284B total parameters / **13B active**.
*   **Context:** 1M tokens (up from 128K in V3.2).
*   **Training:** 32T–33T tokens (~20 tokens/parameter); estimated pretraining compute at **~1e25 FLOPs**.
*   **Precision:** Mixed **FP4 + FP8** checkpoint. MoE expert weights in FP4; attention/norm/router in FP8.
*   **Hardware:** The full Pro model fits on a single **8×B200 node**.

### Architectural Innovations (KV Cache Reduction)
The "headline achievement" is a hybrid attention system that achieves an **8.7× reduction** in KV cache size compared to V3.2.
*   **Shared KV vectors** and compressed KV streams.
*   **Compression ratios:** `c4a` (~4×) and `c128a` (~128×).
*   **1M context KV cache:** 9.62 GiB/sequence (bf16), down from 83.9 GiB.
*   **Hybrid Layers:** Alternating Compressed Sparse Attention (CSA) and Hybrid Conditioned Attention (HCA).

### Performance & Benchmarks
*   **Intelligence Index:** V4 Pro scored **52** (up 10 points from V3.2), ranking as the **#2 open-weights reasoning model** (behind Kimi K2.6 at 54).
*   **Agentic Work (GDPval-AA):** V4 Pro leads open-weights with a score of **1554**, beating Kimi K2.6 and GLM-5.1.
*   **Hallucination:** Remains high (94% for Pro, 96% for Flash).
*   **Token Intensity:** V4 is "token-hungry"; while per-token pricing is low, total task cost can be high due to high output volume.

---

## 2. OpenAI: GPT-5.5 & GPT-5.5 Pro
OpenAI launched GPT-5.5 with a **1M context window**, focusing on "effort calibration" and coding efficiency.

*   **Pricing:** $5/1M input, $30/1M output (2x the cost of GPT-5.4).
*   **Coding Performance:** Ranked #1 on **CursorBench (72.8%)** and **Terminal-Bench (82.7)**.
*   **Efficiency:** Reported **56% fewer tokens** used on complex tasks compared to previous versions.
*   **Safety:** Includes a "Bio Bug Bounty" program for the new model.

---

## 3. Qwen 3.6 & Local LLM Momentum
The Qwen 3.6 series (specifically the 27B and 35B models) is showing "frontier-level" performance on consumer hardware.

*   **Qwen 3.6 27B:** Achieved parity with **Claude 3.6 Sonnet** on the Agentic Index.
*   **Local Performance:** Users report running Qwen 3.6 27B on MacBook Pros (M5 Max) at **18-72 TPS** depending on quantization.
*   **Speculative Decoding:** Using `llama.cpp` with n-gram speculative decoding boosted speeds from **13.6 t/s to 136.7 t/s** in specific tests.
    *   *Warning:* N-gram speculation may break tool calls or complex coding logic.

---

## 4. Infrastructure & Tooling Updates
*   **Hugging Face "ML Intern":** A new open-source CLI agent that can research papers, write code, and iterate up to 300 steps.
*   **Meta & AWS:** Meta adding tens of millions of **AWS Graviton** cores to scale agentic systems.
*   **Claude Code Postmortem:** Anthropic admitted to three bugs (caching issues and reasoning downgrades) that made Claude "feel dumber" in April; usage limits were reset for all users as an apology.
*   **ComfyUI:** Raised $30M at a $500M valuation to support local/open creative workflows.

---

## 5. Key Quotes & Technical Excerpts

> **On DeepSeek V4's KV Cache:**
> "1M context KV cache = 9.62 GiB/sequence (bf16)... 8.7× smaller than DeepSeek V3.2's 83.9 GiB." — *@ZhihuFrontier*

> **On Geopolitics & Hardware:**
> "DeepSeek said Pro pricing could fall sharply once Huawei Ascend 950 supernodes are deployed at scale in H2." — *@scaling01*

> **On Speculative Decoding Settings:**
> ```bash
> # Example settings for 10x speedup in llama-server
> --spec-type ngram-mod --spec-ngram-size-n 24 --draft-min 12 --draft-max 48
> ```

---

## 6. Strategic Outlook: The "Sovereign AI" Shift
The release of DeepSeek V4 is being viewed as a pivot point where Chinese labs are successfully navigating US chip bans by:
1.  **Hardware-Model Co-design:** Optimizing for Huawei Ascend silicon.
2.  **Architecture Complexity:** Moving toward MoE designs so complex they are difficult for other labs to replicate, potentially ending the era of "easy" model cloning.
3.  **Open-Weight Dominance:** Chinese models (Kimi, GLM, DeepSeek, Qwen) now occupy the majority of the top-tier open-weight leaderboard.