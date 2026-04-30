---
title: ChatGPT Sandbox Capabilities (Jan 2026)
created: 2026-04-11
updated: 2026-04-11
type: comparison
tags: [ai-agents, chatgpt, openai, sandbox, code-interpreter]
sources:
  - url: https://simonwillison.net/2026/Jan/26/chatgpt-containers/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/26/chatgpt-container-environment/
    fetched: 2026-04-11
  - url: https://github.com/simonw/research/tree/main/chatgpt-container-environment
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# ChatGPT Sandbox Capabilities (Jan 2026)

## Overview
As of January 2026, ChatGPT's code execution environment (formerly "Code Interpreter") has been upgraded to function as a near-full Linux container with Bash execution, multi-language support, and a curated package proxy.

## Key capabilities
- **Bash execution** — direct shell access, not just Python subprocess
- **Multi-language** — Python, Node.js, Ruby, Perl, PHP, Go, Java, Swift, Kotlin, C, C++
- **Package install** — pip/uv/npm via internal OpenAI CAAS Artifactory proxy (no general internet)
- **`container.download`** — privileged fetch for public URLs (URL must appear in conversation first)
- **No general outbound network** — user code (urllib, requests) blocked; only package managers and `container.download` work

## Architecture
- Runs on Azure (centralus / Des Moines, Iowa)
- Three lanes: user code (blocked), package management (internal proxy), tooling (`container.download`)
- Internal proxy supports: PyPI, npm, Maven, Gradle, Cargo, Docker registries
- Docker CLI not installed, but Docker Registry v2 API reachable via Python/HTTP

## Compared to Hermes/Bob
| Capability | ChatGPT Sandbox | Hermes (Bob) |
| :--- | :--- | :--- |
| Bash | ✅ | ✅ |
| Internet access | Limited (proxy + download tool) | ✅ (full) |
| Package install | ✅ (internal mirror) | ✅ (full) |
| Persistent filesystem | Session only | ✅ (persistent) |
| Background processes | ❌ | ✅ |
| Multi-turn state | Session | ✅ (SQLite) |

## Chris's preferences
- See `chris-preferences.md` for Chris's stance on AI agent tooling.
- Last sync with chris-preferences: 2026-04-11

## Sources
- Simon Willison blog post: https://simonwillison.net/2026/Jan/26/chatgpt-containers/
- Simon Willison research: https://github.com/simonw/research/tree/main/chatgpt-container-environment
