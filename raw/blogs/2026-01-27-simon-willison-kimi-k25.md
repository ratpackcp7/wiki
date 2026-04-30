---
source_url: https://simonwillison.net/2026/Jan/27/kimi-k25/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-27-simon-willison-kimi-k25
---

# Kimi K2.5: Visual Agentic Intelligence

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/27/kimi-k25/)
**Date:** January 27, 2026

## Overview
Kimi K2.5 is the latest iteration of Moonshot AI's large language model. While previous versions (K2 and K2 Thinking) were text-only, K2.5 is a **native multimodal model** with a specific focus on visual processing and multi-agent orchestration.

> "Kimi K2.5 builds on Kimi K2 with continued pretraining over approximately 15T mixed visual and text tokens. Built as a native multimodal model, K2.5 delivers state-of-the-art coding and vision capabilities and a self-directed agent swarm paradigm."

---

## Key Features & Capabilities

### 1. Self-Directed Agent Swarm
The model introduces a paradigm for breaking down complex tasks into parallel workflows without manual configuration.
*   **Scale:** Can direct up to **100 sub-agents**.
*   **Efficiency:** Executes up to **1,500 tool calls** per task.
*   **Performance:** Reduces execution time by up to **4.5x** compared to single-agent setups.
*   **Automation:** The swarm is orchestrated automatically without predefined workflows.

### 2. Visual & Coding Performance
*   **SVG Generation:** Successfully generated a complex SVG of a "pelican riding a bicycle." While the bicycle frame and pedal alignment were slightly flawed, the overall illustration was high quality.
*   **Task Decomposition:** Demonstrated strong reasoning by breaking down a Datasette plugin development request into ten realistic, dependency-aware tasks for parallel agents.

---

## Technical Specifications & Local Execution
*   **Model Size:** The Hugging Face repository is **595GB**.
*   **Parameter Count:** Part of the 1 trillion parameter K2 family.
*   **Hardware Requirements:** Running this model locally likely requires high-end hardware, such as two **512GB RAM M3 Ultra Mac Studios** (approx. $20,000 total) using MLX.

---

## Licensing: The "Modified MIT" Clause
The model uses a "janky" version of the MIT license. It remains open-weight but includes a specific **commercial attribution requirement**:

> "Our only modification part is that, if the Software (or any derivative works thereof) is used for any of your commercial products or services that have more than 100 million monthly active users, or more than 20 million US dollars... in monthly revenue, you shall prominently display 'Kimi K2.5' on the user interface of such product or service."

---

## Links & Resources
*   **Model Access:** [OpenRouter Chat UI](https://openrouter.ai/moonshotai/kimi-k2.5)
*   **Repository:** [Hugging Face - Moonshot AI](https://huggingface.co/moonshotai/Kimi-K2.5)
*   **Comparison Tests:** 
    *   [Kimi K2.5 Task Breakdown Gist](https://gist.github.com/simonw/ee2583b2eb5706400a4737f56d57c456)
    *   [Claude Opus 4.5 Comparison](https://claude.ai/share/df9258e7-97ba-4362-83da-76d31d96196f)
    *   [GPT-5.2 Thinking Comparison](https://chatgpt.com/share/6978d48c-3f20-8006-9c77-81161f899104)
