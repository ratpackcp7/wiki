---
source_url: https://www.latent.space/p/ainews-deepseek-v4-pro-16t-a49b-and
fetched: 2026-04-25T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-25-latent-space-deepseek-v4-pro-16t-a49b-and
---

# [AINews] DeepSeek V4 Pro and Flash: Technical Deep Dive & Market Impact

DeepSeek has released **DeepSeek-V4**, its first major architecture refresh since V3/R1. The release includes two tiers—**Pro** and **Flash**—and marks a significant milestone in Chinese AI independence by offering native compatibility with **Huawei Ascend** chips.

---

## 1. Model Specifications & Architecture
DeepSeek-V4 introduces a hybrid architecture focused on extreme long-context efficiency.

### Core Model Stats
*   **DeepSeek-V4 Pro:** 1.6T total parameters / **49B active**.
*   **DeepSeek-V4 Flash:** 284B total parameters / **13B active**.
*   **Context Window:** 1M tokens (up from 128K in V3.2).
*   **Training Data:** 32T–33T tokens (~20 tokens/parameter).
*   **License:** MIT License.

### Technical Innovations
The 58-page technical report highlights massive efficiency gains via **Compressed Sparse Attention (CSA)** and **Heavily Compressed Attention (HCA)**:
*   **KV Cache Reduction:** At 1M tokens, V4 requires only **10% of the KV cache memory** and **27% of the FLOPs** compared to DeepSeek-V3.2.
*   **Memory Footprint:** 1M context KV cache is **9.62 GiB/sequence (bf16)**, roughly 8.7× smaller than V3.2's 83.9 GiB.
*   **Precision:** Mixed **FP4 + FP8** checkpoint format. MoE expert weights are in FP4; attention/norm/router are in FP8.
*   **Hardware:** The full Pro model fits on a single **8×B200** node.

---

## 2. Performance Benchmarks
Independent evaluations place DeepSeek-V4 Pro as a top-tier open-weight model, though it remains slightly behind the absolute frontier (GPT-5.x/Opus 4.7).

| Metric | DeepSeek-V4 Pro | Comparison |
| :--- | :--- | :--- |
| **AA Intelligence Index** | 52 | #2 Open Weight (behind Kimi K2.6 at 54) |
| **Agentic Work (GDPval-AA)** | 1554 | **#1 Open Weight** (beats Kimi, GLM-5.1) |
| **Hallucination Rate** | 94% | High (Flash is 96%) |
| **Text Arena** | #2 Open | #1 in Medical & Healthcare |

> **Key Insight:** While per-token pricing is low, the model can be "token-intensive," meaning total task cost may be higher than expected if the model generates excessive output.

---

## 3. Pricing & Availability
DeepSeek is positioning V4 as a "Mythos-level" cheap coding and agentic model.

*   **V4 Pro Pricing:** $1.74 Input / $3.48 Output (per 1M tokens).
*   **V4 Flash Pricing:** $0.14 Input / $0.28 Output (per 1M tokens).
*   **Ecosystem Support:** Day-0 support via **vLLM**, **Together AI**, **Baseten**, and **MLX** (for Mac).
*   **Huawei Integration:** DeepSeek noted that Pro pricing could fall further once **Huawei Ascend 950** supernodes are deployed at scale in H2 2026.

---

## 4. Competitive Landscape: Qwen 3.6 & GPT-5.5
The release coincides with several other major industry moves:

### Qwen 3.6 (27B & 35B)
*   **Agency:** Qwen 3.6 27B has made massive gains, tying with **Claude Sonnet 4.6** on the Agentic Index.
*   **Local Performance:** Users report Qwen 3.6 27B running on MacBook Pros (M5 Max) feels close to Opus for coding tasks, achieving ~18-72 TPS depending on quantization.

### OpenAI GPT-5.5
*   **Rollout:** GPT-5.5 and 5.5 Pro launched with a **1M context window**.
*   **Efficiency:** Perplexity reported **56% fewer tokens** used on complex tasks compared to previous versions.
*   **Coding:** Ranked #1 on **CursorBench (72.8%)** and **Terminal-Bench (82.7)**.

---

## 5. Critical Perspectives & "Sovereign AI"
*   **The "Democratization" Debate:** Some researchers argue V4 is *not* democratizing because the architecture (CSA/HCA/mHC) is so complex that few labs can replicate the training process.
*   **Sovereignty:** The release is seen as a major step for Chinese "total independence" from NVIDIA/CUDA, moving toward a self-sustaining Huawei/Ascend ecosystem.
*   **Research Quality:** The technical report received high praise.
    > "This is what research should look like... one of the best I've ever read." — *Community sentiment on the 58-page disclosure.*

---

## 6. Infrastructure & Tools
*   **ML Intern (Hugging Face):** An open-source CLI agent that can research papers and run experiments (up to 300 steps).
*   **ComfyUI:** Raised $30M at a $500M valuation to continue local/open creative AI.
*   **Meta:** Adding tens of millions of **AWS Graviton** cores to scale agentic systems.
*   **Canada/Germany:** Cohere and Aleph Alpha announced a sovereign AI partnership for enterprise privacy.