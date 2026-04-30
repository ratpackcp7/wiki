---
title: Coding Agent Skills Standard
created: 2026-04-11
updated: 2026-04-11
type: draft
tags: [ai-agents, coding-agents, skills, openai-codex, claude-code, agentskills-io]
sources:
  - url: https://developers.openai.com/codex/skills
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/2/introducing-the-codex-app/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
---

# Coding Agent Skills Standard

## The principle

AI coding agents are converging on a common authoring format for extensible capabilities: a `SKILL.md` file with YAML frontmatter (name + description) plus optional scripts/references/assets directories. This pattern enables progressive disclosure — the agent loads only metadata until a skill is activated, saving context window space.

## Why

Without a standard, every agent (Codex, Claude Code, Cursor, Hermes) reinvents skill packaging. The [open agent skills standard](https://agentskills.io/) proposes interoperability — skills written for one agent should work on another with minimal adaptation. OpenAI Codex adopted this standard as of February 2026.

## How to apply

### 1. Structure: SKILL.md + optional directories
Every skill is a directory containing:
- `SKILL.md` — required, frontmatter with `name` and `description`, body has instructions
- `scripts/` — optional executable code
- `references/` — optional documentation
- `assets/` — optional templates/resources

### 2. Progressive disclosure pattern
Agent loads skill metadata (name, description) at startup. Full instructions loaded only when the skill is activated. This prevents unused skills from consuming context.

### 3. Scope levels (OpenAI Codex convention)
- **REPO** — `$CWD/.agents/skills` — project-specific
- **USER** — `$HOME/.agents/skills` — cross-project personal
- **ADMIN** — `/etc/codex/skills` — system-wide

### 4. Invocation
- **Explicit:** `$skill-name` syntax or `/skills` command
- **Implicit:** agent matches task to skill description automatically

## Anti-patterns
- Baking skill logic into the agent core (kills extensibility)
- Loading all skills into system prompt (wastes context)
- Vague descriptions that cause false implicit activations

## Chris's preferences
- See `chris-preferences.md` for Chris's stance.
- Delta from best practice: Hermes uses `~/.hermes/skills/` with a different discovery mechanism (toolsets, not scopes). The SKILL.md frontmatter format is compatible. Hermes also supports skill slash commands injected as user messages — OpenAI uses `$` prefix invocation instead.
- Last sync with chris-preferences: 2026-04-11

## Recent changes
- 2026-02-02: OpenAI released Codex desktop app with first-class skills support, adopting the agentskills.io standard. SQLite-backed automations. (source: Simon Willison)
- 2025-12: Anthropic rebranded Claude Code to "Cowork" to signal general-purpose agent usage beyond coding. (source: blog post from 2026-02-02 post)

## Sources
- https://developers.openai.com/codex/skills (fetched: 2026-04-11)
- https://simonwillison.net/2026/Feb/2/introducing-the-codex-app/ (fetched: 2026-04-11)
