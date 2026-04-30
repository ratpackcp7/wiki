---
source_url: https://simonwillison.net/2026/Apr/23/gpt-5-5/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-23
slug: a-pelican-for-gpt-55-via-the-semi-official-codex-backdoor-api
---

# Summary: A pelican for GPT-5.5 via the semi-official Codex backdoor API

**Date:** April 23, 2026  
**Author:** Simon Willison  
**Topic:** Accessing the newly released GPT-5.5 via a "backdoor" API to bypass ChatGPT's system prompts and utilize existing subscriptions.

---

## 🚀 GPT-5.5 Release Overview
OpenAI has released **GPT-5.5**, available via OpenAI Codex and rolling out to paid ChatGPT subscribers. While highly capable, the official API deployment is currently delayed for safety and security scaling reasons.

> "API deployments require different safeguards and we are working closely with partners and customers on the safety and security requirements for serving it at scale. We’ll bring GPT‑5.5 and GPT‑5.5 Pro to the API very soon."

### Pricing Comparison
GPT-5.5 is significantly more expensive than its predecessor, GPT-5.4.

| Model | Input (per 1M tokens) | Output (per 1M tokens) |
| :--- | :--- | :--- |
| **GPT-5.4** | $2.50 | $15.00 |
| **GPT-5.5** | $5.00 | $30.00 |
| **GPT-5.5 Pro** | $30.00 | $180.00 |

---

## 🛠️ The "Codex Backdoor" & `llm-openai-via-codex`

### The Context
There is ongoing tension regarding how third-party agent harnesses (like OpenClaw) interact with model subscriptions. While Anthropic blocked similar integration, OpenAI has officially supported using Codex to access ChatGPT subscriptions via various tools (JetBrains, Xcode, etc.).

### The Solution
Simon Willison developed `llm-openai-via-codex`, a plugin for the `llm` tool that reverse-engineers the `openai/codex` repository to allow users to run prompts using their existing Codex/ChatGPT subscription via an API-like interface.

#### **Installation & Usage**
```shell
# 1. Install Codex CLI, buy an OpenAI plan, and login to Codex
# 2. Install LLM
uv tool install llm

# 3. Install the new plugin
llm install llm-openai-via-codex

# 4. Start prompting
llm -m openai-codex/gpt-5.5 'Your prompt goes here'
```

**Supported Features:**
* **Images:** `llm -a filepath.jpg/URL`
* **Chat:** `llm chat -m openai-codex/gpt-5.5`
* **Logs:** `llm logs`
* **Tools:** `llm --tool ...`

---

## 🎨 Benchmarking: The Pelican Test
Willison used the plugin to test GPT-5.5's ability to generate SVG code for a "pelican riding a bicycle."

* **Standard Mode:** Produced a "mangled" result with imperfect shapes and bicycle frames.
* **High Reasoning Mode:** By using the flag `-o reasoning_effort xhigh`, the model produced a significantly superior, CSS-heavy SVG with gradients.
    * **Note on Reasoning:** The `xhigh` attempt used **9,322 reasoning tokens**, whereas the default used only **39**.

---

## 🧠 Expert Insights
* **Ethan Mollick's Verdict:** Describes the "jagged frontier" continuing; GPT-5.5 is excellent at specific tasks but remains unpredictable in others.
* **Model Positioning:** GPT-5.4 remains available and, due to its half-price point compared to 5.5, functions similarly to how Claude Sonnet compares to Claude Opus.