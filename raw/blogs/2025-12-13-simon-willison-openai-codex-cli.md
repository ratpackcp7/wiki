---
source_url: https://simonwillison.net/2025/Dec/13/openai-codex-cli/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-13-simon-willison-openai-codex-cli
---

# OpenAI Codex CLI

> How to use a skill (progressive disclosure):
> After deciding to use a skill, open its `SKILL.md`. Read only enough to follow the workflow.
> If `SKILL.md` points to extra folders such as `references/`, load only the specific files needed for the request; don't bulk-load everything.
> If `scripts/` exist, prefer running or patching them instead of retyping large code blocks.
> If `assets/` or templates exist, reuse them instead of recreating from scratch.
>
> Description as trigger: The YAML `description` in `SKILL.md` is the primary trigger signal; rely on it to decide applicability. If unsure, ask a brief clarification before proceeding.

— [OpenAI Codex CLI](https://github.com/openai/codex/blob/ad7b9d63c326d5c92049abd16f9f5fb64a573a69/codex-rs/core/src/skills/render.rs#L20-L39), core/src/skills/render.rs, [full prompt](https://gist.github.com/simonw/25f2c3a9e350274bc2b76a79bc8ae8b2)

Posted 13th December 2025 at 3:47 am

Tags: ai, rust, openai, prompt-engineering, generative-ai, llms, codex-cli, skills
