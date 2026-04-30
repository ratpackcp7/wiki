---
title: Open Responses — Vendor-Neutral LLM API Specification
created: 2026-04-11
updated: 2026-04-11
type: draft
tags: [llm, api, standards, openrouter, openai]
sources:
  - url: https://www.openresponses.org/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/15/open-responses/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# Open Responses

A vendor-neutral specification for the JSON API that clients use to talk to hosted LLMs, derived from OpenAI's Responses API.

## What it is
- Open-source spec defining a shared schema for LLM API calls
- Covers: messages, tool calls, streaming, reasoning traces, multimodal inputs
- "Items" as atomic unit of model output and tool use

## Why it matters for Hermes
- Hermes currently normalizes across providers via OpenAI-compatible format
- Open Responses could become the standard normalization layer
- Launch partners include OpenRouter (Hermes's primary provider), Hugging Face, vLLM, Ollama
- If adopted, could simplify provider abstraction code in `run_agent.py`

## Current state
- Spec published at openresponses.org
- Server-side conformance tests available (React app + `compliance-tests.ts`)
- Client-side conformance tests still missing
- Governance charter published

## What to watch
- OpenRouter adoption timeline (would affect Hermes directly)
- Python client library availability
- Whether provider-specific extensions fragment the standard

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on LLM provider abstraction.
- Delta from best practice: Hermes already has a working multi-provider layer — evaluate Open Responses as a potential replacement only if it covers Hermes's tool-use patterns.
- Last sync with chris-preferences: 2026-04-11
