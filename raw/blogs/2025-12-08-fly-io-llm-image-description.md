---
source_url: https://fly.io/blog/llm-image-description/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-llm-image-description
---

# Picture This: Open Source AI for Image Description

Nolan Darilek (blind developer at Fly.io) on AI image descriptions for accessibility.

Stack: Ollama (LLM), LLaVA (multimodal model, Apache-licensed), PocketBase (backend with SQLite/Auth/API), Python client.

Implementation: Image upload hook → prompt to Ollama describing for blind screen reader users. Follow-up hook for conversational context.

Autostart/autostop for cost optimization on GPU Machines.

Performance: ~45s cold start (machine + model load + response), seconds warm. 34b model gives detailed descriptions.

Repo: github.com/superfly/llm-describer
