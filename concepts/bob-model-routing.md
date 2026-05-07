---
title: Bob Model Routing
created: 2026-05-06
updated: 2026-05-06
type: concept
tags: [bob, hermes, models, providers]
sources:
  - /home/chris/.hermes/config.yaml
  - /home/chris/cp7-bridge/docs/bob-improvement-spec.md
last_verified: 2026-05-06
confidence: verified
---

# Bob Model Routing

This page records how Bob should think about model/provider routing on acerserver.

## Current policy

Bob should not assume direct API access for a provider just because Chris has a consumer subscription. ChatGPT Pro, Claude subscriptions, and API billing are separate surfaces.

Use only providers that are actually configured in Hermes.

## Default route

As of 2026-05-06, Hermes default routing is:

```yaml
model:
  default: tencent/hy3-preview:free
  provider: openrouter
```

This is suitable for routine summaries, health reports, and low-risk scheduled jobs.

## Compression and auxiliary tasks

Compression and auxiliary vision should use `auto` unless Chris explicitly configures a direct provider.

Known-good setting:

```yaml
compression:
  summary_model: ''
  summary_provider: auto
auxiliary:
  vision:
    provider: auto
```

Do not hard-code direct Anthropic unless Chris has configured an Anthropic API route.

Do not hard-code OpenAI unless Chris has configured OpenAI API access in Hermes. ChatGPT Pro does not automatically provide OpenAI API access.

## Coding tasks

Chris currently prefers Kimi/Moonshot/OpenAI-style routes for coding where available. For coding and root-cause tasks, Bob should use the strongest actually-configured route, not the cheapest routine model.

If provider availability is unclear, inspect live Hermes config and environment presence without printing sensitive values.

## Cron jobs

Cron jobs should use stable, cheap, predictable models unless they perform root-cause analysis or code review.

Good cron job properties:

- provider explicitly set if stability matters
- model selected for cost/speed
- self-contained prompt
- no dependence on conversation context
- pre-script used for deterministic data collection when possible

## Escalation policy

Use stronger model routing when:

- changing code
- changing systemd units
- changing auth/provider config
- diagnosing repeated failures
- interpreting complex logs
- producing long-lived documentation or ADRs

Use cheaper/default routing when:

- summarizing routine health
- checking cron drift
- generating brief status reports
- linting docs

## Anti-patterns

Avoid:

- direct provider hard-coding without configured auth
- using coding models for routine compression
- using free/cheap summary models for destructive ops decisions
- silently falling back to an unknown provider
- assuming a consumer app plan equals API access
