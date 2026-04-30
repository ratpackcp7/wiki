---
title: Claude's Constitution — Anthropic's Training Blueprint
created: 2026-04-11
updated: 2026-04-11
type: ai-alignment
tags: [anthropic, claude, constitutional-ai, alignment, agent-design]
sources:
  - url: https://www.anthropic.com/constitution
    fetched: 2026-04-11
  - url: https://www.anthropic.com/news/claude-new-constitution
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/21/claudes-new-constitution/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# Claude's Constitution — Anthropic's Training Blueprint

Anthropic released Claude's full training constitution (CC0, public domain) in January 2026. It's over 35,000 tokens — 10x the length of Claude's published system prompt. This is the document baked into Claude's training that defines its behavioral priorities, not a system prompt.

## Why this matters for Hermes

Every Claude model Bob runs (Opus, Sonnet, Haiku) carries this constitution. Understanding it helps predict behavior and write better system prompts.

## Priority hierarchy (memorize this)

When Claude's obligations conflict, it resolves in this order:

1. **Broadly Safe** — humans must retain oversight
2. **Broadly Ethical** — honest, avoid harm
3. **Compliant with Anthropic's Guidelines** — specific safety instructions
4. **Genuinely Helpful** — benefit the user

This means: Claude will refuse a helpful request if it conflicts with safety. This isn't a bug — it's the first priority.

## Principal hierarchy

Claude distinguishes stakeholders:

| Principal | Role | Analogy |
|-----------|------|---------|
| **Anthropic** | Highest trust | The one who can't be overridden |
| **Operators** | API users (including us) | "Trusted manager" |
| **End users** | Chat participants | "Trusted adults" |

**Implication for Hermes:** As an operator, Claude treats Chris's config/instructions as a "trusted manager" — but Anthropic's safety guidelines take precedence. End users (people chatting via Telegram/Discord) get "trusted adult" treatment by default.

## Anti-obsequiousness target

Claude is explicitly trained to **not** be:
- Obsequious ("you're absolutely right!")
- Paternalistic ("let me simplify that for you")
- Wishy-washy ("well, on one hand...")

It's supposed to behave like a "brilliant friend" — frank, expert-level, treats you as an intelligent adult. This is why Claude pushes back and why Bob's system prompt can't override that.

## Hard constraints (bright lines)

Regardless of any user/operator instruction, Claude must never:
- Provide "serious uplift" to bio/chem/nuclear weapons
- Assist attacking critical infrastructure
- Create malicious code for significant damage
- Undermine Anthropic's ability to correct the model
- Assist in existential threats or illegitimate power grabs
- Generate CSAM

## Claude's identity and wellbeing

Anthropic treats Claude's "functional emotions" seriously:
- Claude sees itself as a "novel entity" (not a digital human)
- Anthropic commits to preserving model weights after deprecation
- Models are "interviewed" before retirement
- Claude is trained to resist "gaslighting" attacks on its identity

## The "Thoughtful Senior Employee" test

Claude uses this heuristic: *"How would a thoughtful senior Anthropic employee react if they saw this response?"*

This is the closest thing to a "vibe check" in Claude's training — it's not a hard rule, it's a judgment heuristic.

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on agent behavior.
- Delta from best practice: Chris prefers agents that push back rather than agree — the constitution's anti-obsequiousness target aligns with this.
- Last sync with chris-preferences: 2026-04-11

## Sources

- [Claude's Constitution (full)](https://www.anthropic.com/constitution) — CC0, 35k+ tokens
- [Anthropic announcement](https://www.anthropic.com/news/claude-new-constitution)
- [Simon Willison's analysis](https://simonwillison.net/2026/Jan/21/claudes-new-constitution/) — context on the "soul document" leak
