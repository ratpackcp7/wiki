---
source_url: https://simonwillison.net/2026/Feb/22/how-i-think-about-codex/
fetched: 2026-04-11T14:20:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-02-22-simon-willison-how-i-think-about-codex
---

# How I think about Codex

[Link post by Simon Willison, 22nd February 2026](https://simonwillison.net/2026/Feb/22/)

**[How I think about Codex](https://www.linkedin.com/pulse/how-i-think-codex-gabriel-chua-ukhic)**
. Gabriel Chua (Developer Experience Engineer for APAC at OpenAI) provides his take on the confusing terminology behind the term "Codex", which can refer to a bunch of of different things within the OpenAI ecosystem:

> In plain terms, Codex is OpenAI's software engineering agent, available through multiple interfaces, and an agent is a model plus instructions and tools, wrapped in a runtime that can execute tasks on your behalf. \[...\]
> 
> At a high level, I see Codex as three parts working together:
> 
> _Codex = Model + Harness + Surfaces_ \[...\]
> 
> *   Model + Harness = the Agent
> *   Surfaces = how you interact with the Agent

He defines the harness as "the collection of instructions and tools", which is notably open source and lives in the [openai/codex](https://github.com/openai/codex) repository.

Gabriel also provides the first acknowledgment I've seen from an OpenAI insider that the Codex model family are directly trained for the Codex harness:

> Codex models are trained in the presence of the harness. Tool use, execution loops, compaction, and iterative verification aren't bolted on behaviors — they're part of how the model learns to operate. The harness, in turn, is shaped around how the model plans, invokes tools, and recovers from failure.

Tags: definitions, openai, generative-ai, llms, ai-assisted-programming, codex-cli
