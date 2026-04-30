---
title: Kimi K2.5 — Visual Agentic Intelligence
created: 2026-04-11
updated: 2026-04-11
type: model-release
tags: [llm, multimodal, agents, moe, open-weight, moonshot]
sources:
  - url: https://huggingface.co/moonshotai/Kimi-K2.5
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/27/kimi-k25/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Kimi K2.5 — Visual Agentic Intelligence

## Model specs

| Spec | Value |
|------|-------|
| Architecture | Mixture-of-Experts (MoE) |
| Total params | 1T |
| Activated params | 32B per token |
| Context | 256K tokens |
| Vision encoder | MoonViT (400M params) |
| Experts | 384 total, 8 selected per token, 1 shared |
| Vocabulary | 160K |

## Key capabilities

- **Native multimodal** — visual knowledge, cross-modal reasoning, tool use grounded in visual inputs
- **Agent swarm** — self-directed decomposition into parallel sub-tasks via dynamic domain-specific agents (up to 100 sub-agents, 1,500 tool calls per task)
- **Dual modes** — Instant (fast, `temperature: 0.6`) and Thinking (reasoning-heavy, `temperature: 1.0`)
- **Code from visual specs** — generates code from UI designs, video workflows

## Benchmarks (Thinking mode)

- AIME 2025: **96.1**
- GPQA-Diamond: **87.6**
- MathVista (mini): **90.1**
- InfoVQA: **92.6**
- SWE-Bench Verified: **76.8**
- BrowseComp (Agent Swarm mode): **78.4**

## Deployment

- Engines: vLLM, SGLang, KTransformers
- Min transformers version: `4.57.1`
- Native INT4 quantization
- Available on OpenRouter: `moonshotai/kimi-k2.5`

## License

Modified MIT — open-weight with commercial attribution clause (>100M MAU or >$20M monthly revenue requires "Kimi K2.5" UI attribution).

## Notes

- 595GB on HuggingFace — impractical for local inference on consumer hardware (requires ~1TB RAM, e.g., 2x M3 Ultra Mac Studios)
- Competes with GPT-5.2 and Claude 4.5 on reasoning benchmarks
- Agent swarm paradigm is differentiated — most models require manual workflow configuration for multi-agent setups

## Chris's preferences

- See `chris-preferences.md#ai-models` for Chris's stance.
- Not currently in-use. Evaluate if OpenRouter pricing is competitive for coding/vision tasks.
- Last sync with chris-preferences: 2026-04-11
