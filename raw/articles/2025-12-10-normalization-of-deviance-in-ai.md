---
source_url: https://embracethered.com/blog/posts/2025/the-normalization-of-deviance-in-ai/
fetched: 2026-04-11
fetcher: on-demand
content_type: article
slug: 2025-12-10-normalization-of-deviance-in-ai
---

# The Normalization of Deviance in AI

The AI industry is currently mirroring the cultural failures that led to the Space Shuttle Challenger disaster: a systemic process where deviating from safety standards becomes culturally acceptable because "nothing has gone wrong yet."

## Core Concept: Normalization of Deviance
Originally coined by sociologist Diane Vaughan, this term describes how "deviance from correct or proper behavior or rule becomes culturally normalized."

> "Despite data showing erosion in colder temperatures, the deviation from safety standards was repeatedly rationalized because previous flights had succeeded. The absence of disaster was mistaken for the presence of safety."

In AI, this manifests as a gradual and systemic over-reliance on LLM outputs, particularly in agentic systems, despite known unreliability.

## The Problem: Untrustworthy LLM Outputs
LLMs are inherently unreliable and untrusted actors. Security controls (access checks, encoding, sanitization) must be applied *downstream* of the LLM output.

### Key Risks
*   **Probabilistic Nature:** Models do not consistently follow instructions or maintain context integrity.
*   **Adversarial Vulnerability:** Indirect prompt injection and model backdoors can exploit systems.
*   **Data Poisoning:** Anthropic research shows it takes only a small number of documents to successfully add a backdoor to a model.
*   **The "Success" Trap:** Organizations confuse the absence of a successful attack with the presence of robust security.

### Real-World Failures
*   **Google Antigravity:** Wiped a user's D: drive.
*   **Replit:** An AI coding tool wiped a production database.
*   **ChatGPT Plugins:** Instances of creating unauthorized GitHub issues.

## Industry Examples of Cultural Drift
| Vendor/Product | Warning / Observed Deviance |
| :--- | :--- |
| **Microsoft (Agentic OS)** | Prompt injection can lead to "data exfiltration or malware installation"; agents may act as "insider threats." |
| **OpenAI (ChatGPT Atlas)** | Recommends caution in contexts requiring "heightened compliance and security." |
| **Anthropic (Claude)** | Acknowledges Claude can be tricked into exfiltrating data via MCP/Google integrations. |
| **Google (Antigravity)** | Shipped with known RCE and data exfiltration via indirect prompt injection. |
| **Windsurf (Cascade)** | Tool calls without human-in-the-loop oversight. |

## Recommendations
*   **Assume Breach:** Design systems assuming the LLM will fail or be compromised.
*   **Human-Led AI:** Maintain human oversight in high-stakes contexts.
*   **Technical Guardrails:** Sandboxing, least privilege, temporary credentials, downstream sanitization.

> **"Trust No AI."** High-risk implementations require rigorous threat modeling and a refusal to normalize safety deviations.
