---
title: AI Agent Skill Architecture
created: 2026-04-11
updated: 2026-04-11
type: practice
tags: [ai-agents, skills, context-management, llm-tooling, codex, hermes]
sources:
  - url: https://github.com/openai/codex/blob/ad7b9d63c326d5c92049abd16f9f5fb64a573a69/codex-rs/core/src/skills/render.rs
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/13/openai-codex-cli/
    fetched: 2026-04-11
  - url: https://agentskills.io/specification
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/19/agent-skills/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# AI Agent Skill Architecture

## The principle

AI agent skill systems should follow a **progressive disclosure** pattern: load metadata at startup, load full instructions only when triggered, and minimize context footprint at every step. This keeps the agent's context lean while supporting extensibility to hundreds of skills.

## Why

LLM context windows are finite and expensive. Loading every skill's full content upfront wastes tokens on irrelevant instructions and degrades performance on the actual task. Progressive disclosure mirrors how humans use reference manuals — scan the index, then read only the relevant chapter.

## How to apply

### 1. Skill discovery via metadata only
Store skill bodies on disk (`~/.codex/skills/`, `~/.hermes/skills/`). At startup, scan for `SKILL.md` files and extract only:
- Name
- Description (from YAML frontmatter)
- File path

Present this as a compact listing in the system prompt, not the full content.

### 2. Trigger rules
Two trigger paths, both valid:
- **Explicit:** User names a skill (`$SkillName` or plain text match)
- **Implicit:** The task clearly matches the YAML `description` field

Multiple skill mentions → use all of them. Skills do NOT persist across turns unless re-mentioned.

### 3. Progressive loading on activation
When a skill triggers:
1. Open `SKILL.md` — read only enough to follow the workflow
2. If `references/` exists, load only the specific files needed
3. Prefer running/patching existing `scripts/` over retyping code
4. Reuse `assets/` or templates instead of recreating from scratch

### 4. Coordination when multiple skills apply
- Choose the minimal set that covers the request
- State the order of use (one short line)
- If skipping an obvious skill, say why

### 5. Context hygiene
- Summarize long sections instead of pasting them
- Prefer one-hop file references (no deeply nested includes)
- When variants exist (frameworks, providers), pick only the relevant one

## Anti-patterns

- **Bulk-loading all skills** at startup — wastes context on instructions that won't be used
- **Carrying skills across turns** — stale instructions from a previous task pollute the current one
- **Inlining skill content into system prompt** — defeats the purpose of file-based skills
- **No fallback on missing skills** — agent should state the issue and continue, not halt

## Cross-reference with Hermes

Hermes implements this same pattern:
- Skills live at `~/.hermes/skills/<name>/SKILL.md`
- Discovery via YAML `description` frontmatter field
- Loaded as user messages (not system prompt) to preserve prompt caching
- Skill slash commands injected dynamically via `agent/skill_commands.py`

Key difference: Hermes skills are injected as **user messages** on trigger, while Codex CLI renders them as system prompt sections. Hermes's approach preserves Anthropic prompt caching better.

## Recent changes

- **2025-12-19:** Anthropic's skills mechanism moved to open standard at [agentskills.io](https://agentskills.io/). Spec is "deliciously tiny" but under-specified. Adopted by OpenCode, Cursor, Amp, Letta, goose, GitHub, VS Code, and OpenAI Codex. ([source](https://simonwillison.net/2025/Dec/19/agent-skills/))

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on agent architecture.
- Chris values lessons as transferable principles, not tool-specific tips — this page captures the pattern, not just the Codex implementation.
- Last sync with chris-preferences: 2026-04-11
