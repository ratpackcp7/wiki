---
source_url: https://www.openresponses.org/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-15-open-responses-spec
---

# Open Responses

**Source:** [openresponses.org](https://www.openresponses.org/)

Open Responses is an open-source specification and ecosystem for building multi-provider, interoperable LLM interfaces based on the OpenAI Responses API. It defines a shared schema and tooling layer that enable a unified experience for calling language models, streaming results, and composing agentic workflows — independent of provider.

## Design Goals
- **Multi-provider by default**: one schema that maps cleanly to many model providers.
- **Friendly to agentic workflows**: consistent streaming events, tool invocation patterns, and "items" as the atomic unit of model output and tool use.
- **Extensible without fragmentation**: a stable core with room for provider-specific features.

## Community / Launch Partners
NVIDIA, Vercel, OpenRouter, Hugging Face, LM Studio, Databricks, Red Hat, Ollama, OpenAI, vLLM, Llama Stack.

## Resources
- [Spec](https://www.openresponses.org/)
- [Compliance/Conformance Tests](https://www.openresponses.org/compliance)
- [Governance/Charter](https://www.openresponses.org/governance)
- [GitHub](https://github.com/openresponses/openresponses) — includes `src/lib/compliance-tests.ts`
