---
source_url: https://www.latent.space/p/noetik
fetched: 2026-04-21T18:01:00-05:00
fetcher: blogwatcher
content_type: blog
author: Latent Space
published_date: 2026-04-20
slug: 2026-04-20-latent-space-noetik-cancer-trials
---

# 🔬 Training Transformers to Solve the 95% Cancer Trial Failure Rate

**Source:** [Latent Space Podcast](https://www.latent.space/p/noetik)  
**Guests:** Ron Alfa & Daniel Bear, [Noetik](https://www.noetik.ai/)

---

## 💡 The Core Thesis: A Matching Problem
The primary reason **95% of cancer treatments fail clinical trials** is not necessarily that the drugs are ineffective, but that they are tested on the wrong patients. Noetik argues that many "failed" treatments actually work, provided they are matched with the specific tumor biology they were designed to target.

> "If only we had a way to really understand the unique types of cancer biologies and which patients will respond to which treatments, we might be able to show a much higher success rate. Millions of lives (and billions of dollars) may ride on this."

---

## 🛠️ The Technology: TARIO-2 & Autoregressive Transformers
Noetik has developed **TARIO-2**, an autoregressive transformer model trained on massive multimodal datasets of human tumors.

### Key Technical Capabilities:
*   **Predictive Mapping:** TARIO-2 can predict a ~19,000-gene spatial map from a standard **H&E assay** (the basic tissue stain every patient already receives).
*   **Spatial Transcriptomics:** The model is trained on one of the world's largest sets of tumor spatial transcriptomics, featuring over **1,000 "channels."**
*   **Virtual Cell Simulation:** The model acts as a "virtual cell," capable of simulating how a patient might respond to experimental treatments.
*   **Scaling Laws:** The team reports that as they scale data and model size, they have yet to hit a performance ceiling.

### Data Modalities Collected:
Noetik spent two years collecting data from actual human tumors (avoiding "frankenstein" mouse models) across four modalities:
1.  **Spatial Transcriptomics**
2.  **Spatial Proteomics**
3.  **H&E Imaging**
4.  **Whole Exome Sequencing**

---

## 🤝 Business Strategy: The GSK Deal
In a shift from typical biotech AI plays (where software companies eventually become drug developers), Noetik recently signed a **$50M deal with GSK**.

*   **Platform over Product:** The deal is a software licensing agreement for Noetik's models rather than a partnership for a specific drug.
*   **Cohort Selection:** GSK will use these models to improve **cohort selection**—identifying the specific biomarkers that indicate which patients should be enrolled in a trial to maximize the chance of success.
*   **Repurposing Safe Drugs:** Noetik is working with partners to re-test drugs that were proven safe in the past but failed efficacy trials due to poor patient matching.

---

## 🚀 Why This Matters
*   **The Bottleneck:** The transition from the lab to the clinic is the single greatest hurdle in drug development.
*   **Precision Medicine:** By moving away from "one-size-fits-all" treatments (like traditional chemotherapy) toward targeted therapies (CAR-T, Antibody Drug Conjugates), AI can bridge the gap between a "death sentence" and a survivable condition.
*   **Economic Impact:** The world spends **$20-30 billion annually** on cancer research; improving the success rate by even a small percentage has massive economic and humanitarian implications.

> "Curing cancer is a pretty unambiguously positive application of AI... we hope that learning about the amazing work that companies like Noetik are doing will inspire a generation of AI engineers to work on the hardest and most exciting problems that society faces."
