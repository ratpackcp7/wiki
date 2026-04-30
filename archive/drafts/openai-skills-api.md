---
title: OpenAI Skills API
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [openai, skills, api, llm-tooling, ai-agents]
sources:
  - url: https://developers.openai.com/cookbook/examples/skills_in_api
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/11/openai-api-skills/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/11/skills-in-openai-api/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# OpenAI Skills API

## Overview

OpenAI's Skills API enables models to execute reusable, self-contained scripts and tools by packaging instructions and code with a `SKILL.md` manifest. Skills sit between system prompts (always-on behavior) and tools (atomic capabilities) — they package repeatable procedures.

**Key distinction from Hermes skills:** OpenAI skills run inside a hosted shell environment (`container_auto`), where the model installs dependencies and executes scripts. Hermes skills are instructions injected as user messages, executed via the agent's existing toolset.

## Key Concepts

1. **SKILL.md manifest** — Required YAML frontmatter (`name`, `description`) + instructions. One per folder.
2. **Packaging** — Folder with SKILL.md + scripts/ + requirements.txt + assets/. Upload as ZIP (max 50MB).
3. **Attachment** — Skills attach to the `shell` tool's `environment` object, not directly to the model.
4. **Inline skills** — Can send base64-encoded zip data directly in the JSON request (no pre-upload needed).
5. **Version pinning** — `version: 2` for production, `version: "latest"` for development.

## Comparison with Hermes Skills

| Feature | OpenAI Skills | Hermes Skills |
|---------|--------------|---------------|
| Execution | Hosted shell (container) | Agent's terminal tool |
| Manifest | SKILL.md with frontmatter | SKILL.md with frontmatter |
| Packaging | ZIP upload or inline base64 | Directory in ~/.hermes/skills/ |
| Discovery | API reads frontmatter | CLI/gateway scans directory |
| Isolation | Container sandboxed | Agent's terminal session |
| Cost | API call per invocation | Included in agent context |

## Relevance to Chris

Hermes has its own skills system. OpenAI's approach is worth monitoring as a competing pattern — the inline skill capability and container isolation are notable. If Hermes ever adds hosted execution, this is the design space to reference.

## Chris's preferences

- See `chris-preferences.md#ai-agents` for Chris's stance.
- Delta from best practice: Hermes uses instruction-based skills, not hosted execution. Simpler but less isolated.
- Last sync with chris-preferences: 2026-04-11
