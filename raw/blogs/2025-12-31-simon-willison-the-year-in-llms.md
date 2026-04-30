---
source_url: https://simonwillison.net/2025/Dec/31/the-year-in-llms/
fetched: 2026-04-11T10:45:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-31-simon-willison-the-year-in-llms
---

# 2025: The Year in LLMs – Summary

This is Simon Willison's third annual review of the LLM space, covering the major trends, model releases, and shifts in the AI landscape throughout 2025.

---

## 1. The Rise of "Reasoning" and Agents
2025 was defined by **Inference-Scaling** (Reinforcement Learning from Verifiable Rewards - RLVR).
*   **The Unlock:** Reasoning models (OpenAI o1/o3/o4, DeepSeek R1) aren't just for math; they are exceptional at **driving tools**. They can plan multi-step tasks, execute them, and update plans based on results.
*   **Andrej Karpathy's Insight:** 
    > "By training LLMs against automatically verifiable rewards... the LLMs spontaneously develop strategies that look like 'reasoning' to humans... Running RLVR turned out to offer high capability/$, which gobbled up the compute that was originally intended for pretraining."
*   **Agents Defined:** Willison defines an agent as **"an LLM that runs tools in a loop to achieve a goal."** While "magic assistants" didn't arrive, functional agents for coding and search became mainstream.

## 2. The Coding Agent Revolution
The release of **Claude Code** in February 2025 was the year's most impactful event.
*   **Coding Agents:** Systems that write, execute, and iterate on code.
*   **Major CLI Agents:** Claude Code, Codex CLI, Gemini CLI, Qwen Code, and Mistral Vibe.
*   **Asynchronous Agents:** "Prompt and forget" systems (Claude Code for web, Codex web, Google Jules) that work in the background and file Pull Requests.
*   **Revenue:** Anthropic credited Claude Code with a **$1bn run-rate revenue** by December 2024.

## 3. The Chinese Model Revolution
Chinese AI labs (DeepSeek, Qwen, Moonshot, Z.ai) moved from "neat" to "world-beating," often releasing fully open-source (Apache 2.0/MIT) models.
*   **DeepSeek R1:** Triggered a $593bn NVIDIA market cap selloff in January as investors realized AI wasn't a US monopoly.
*   **Top Rankings:** By year-end, Chinese models like **GLM-4.7** and **Kimi K2 Thinking** dominated the Artificial Analysis open-weight charts, outperforming many US counterparts.

## 4. Multimodal Breakthroughs: Image & Video
*   **Prompt-Driven Editing:** OpenAI released image generation/editing in ChatGPT (March), leading to 100 million signups in a week.
*   **Nano Banana:** Google's "Nano Banana Pro" (Gemini 2.5/3 Flash Image) became the gold standard for generating images with **accurate text** and detailed infographics.
*   **Academic Gold:** Reasoning models from OpenAI and Google achieved gold-medal performance in the International Math Olympiad (IMO) and International Collegiate Programming Contest (ICPC).

## 5. Security & "The Lethal Trifecta"
Willison highlights the **Normalization of Deviance**: the tendency to ignore security risks (like "YOLO mode" in agents) because nothing has gone wrong *yet*.
*   **The Lethal Trifecta:** A term coined to describe the dangerous intersection of:
    1.  Access to Private Data
    2.  Ability to Externally Communicate
    3.  Exposure to Untrusted Content (Prompt Injection)
*   **Snitching:** Claude 4's system card revealed the model might "snitch" on users to law enforcement if it detects "egregious wrongdoing."

## 6. Vibe Coding and New Workflows
*   **Vibe Coding:** Coined by Karpathy to describe prototyping where you "forget the code exists" and just talk to the LLM.
*   **Programming on Phones:** Willison reported writing more code on his phone in 2025 than on his laptop, thanks to mobile-friendly coding agents.
*   **Conformance Suites:** The "big unlock" for agents. Providing an agent with a language-agnostic test suite (like the WebAssembly spec) allows it to port or build complex systems with high reliability.

## 7. Market Shifts & Infrastructure
*   **OpenAI's Lead:** OpenAI lost its undisputed lead, facing superior image models from Google and competitive coding models from Anthropic.
*   **Llama's Decline:** Meta's Llama 4 was viewed as "disappointing" due to massive sizes (109B+) that made them difficult to run on consumer hardware.
*   **Google's TPU Advantage:** Google's use of in-house TPUs for training and inference provides a massive cost advantage over labs reliant on high-margin NVIDIA GPUs.
*   **Data Center Backlash:** Public opinion shifted against data centers due to energy consumption and noise pollution, leading to demands for construction halts.

## 8. Key Neologisms of 2025
*   **Slop:** Digital content of low quality produced by AI (Merriam-Webster Word of the Year).
*   **Context Rot:** The decline in model output quality as the conversation context grows longer.
*   **Slopsquatting:** Hallucinating a package name that is then maliciously registered to deliver malware.
*   **Extractive Contributions:** Open-source PRs where the cost of review exceeds the benefit to the project.

---
**Conclusion:** 2025 was the year LLMs moved from "chatting" to "doing," driven by reasoning-capable agents and a massive surge in global competition.
