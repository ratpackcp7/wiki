---
source_url: https://simonwillison.net/2026/Jan/15/open-responses/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-04-11-simon-willison-open-responses
---

# Open Responses

[Open Responses](https://www.openresponses.org/) — a vendor-neutral specification for the JSON API that clients can use to talk to hosted LLMs.

Open Responses aims to provide a documented standard, derived from OpenAI's Responses API. The API was designed with features of more recent models — such as reasoning traces — baked into the design.

## Launch Partners
OpenRouter, Hugging Face, LM Studio, vLLM, Ollama, Vercel, NVIDIA, Databricks, Red Hat, OpenAI, Llama Stack.

> "I was hoping for one based on their older Chat Completions API since so many other products have cloned it already, but basing it on Responses does make sense since that API was designed with the feature of more recent models — such as reasoning traces — baked into the design." — Simon Willison

## Conformance Testing
The official repository includes `src/lib/compliance-tests.ts` for server validation, available as a React app on the official site that can be pointed at any implementation served via CORS.

Missing: equivalent conformance tests for client implementations.

## Key Features
- Multi-provider by default
- Consistent streaming events, tool invocation patterns, and "items" as atomic output units
- Extensible without fragmentation

**Blog:** Simon Willison  
**Date:** 2026-01-15  
**Tags:** json, standards, ai, openai, llms, openrouter
