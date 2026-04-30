---
source_url: https://fly.io/blog/mcps-everywhere/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-mcps-everywhere
---

# What are MCP Servers?

Sam Ruby explainer on the Model Context Protocol (MCP).

Core analogies: MCPs as Alexa Skills, API 2.0 (multiplexing + server push), APIs with introspection (built-in tool discovery), Robotic Limbs (LLM = brain, MCP = eyes/hands/legs).

Architecture: MCP servers are NOT serverless — they maintain long-lived, stateful connections. Lifecycle: initialize request → initialize response → initialized notification → operation phase → shutdown.

Design philosophy: Best MCP servers designed for LLM workflows, not raw API endpoints. Avoid raw auto-generation from OpenAPI schemas. CLI-first approach works well. Paradigm shift: add your tools to the LLM, not LLMs to apps.

Security: Local stdio MCPs require plain-text secrets and run third-party code. Recommendation: remote hosting with bearer token access, isolation on remote machine.

Future: Agentic OS, MCP servers potentially making app stores/browsers obsolete. Desktop Commander MCP example — needs secure box rather than local execution.
