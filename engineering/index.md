---
title: Engineering Index
created: 2026-04-11
updated: 2026-04-11T16:30:00-05:00
---

# Engineering Wiki Index

## Stacks
|- [Django](stacks/django.md) — production SQLite, ORM, Litestream deployment (2026-04-11)
|- [SQLite](stacks/sqlite.md) — WAL, FTS5, extensions, backup patterns, cysqlite (2026-04-11)
||- [FastAPI](stacks/fastapi.md) — pydantic-settings, aiosqlite, lifespan, gotchas (2026-04-11)
## Stacks
||- [Django](stacks/django.md) — production SQLite, ORM, Litestream deployment (2026-04-11)
- [SQLite](stacks/sqlite.md) — WAL, FTS5, extensions, backup patterns, cysqlite (2026-04-11)
- [FastAPI](stacks/fastapi.md) — pydantic-settings, aiosqlite, lifespan, gotchas (2026-04-11)
- [React Native/Expo](stacks/react-native-expo.md) — mobile-first, unistyles, expo-router (2026-04-24)
- [Home Assistant](stacks/home-assistant.md) — automation, sensors, HA API (2026-04-24)
- [Docker](stacks/docker.md) — containers, compose, socket-proxy (2026-04-24)
- [systemd](stacks/systemd.md) — services, user-timers, watchdog (2026-04-24)
- [llm CLI](stacks/llm.md) — Simon Willison's terminal interface for LLMs (2026-04-25)

## Recent changes
||- 2026-04-25: Daily ingest — 7 blog posts captured (5 raw-only, 2 compiled), llm CLI tooling page created, Bitwarden CLI security incident documented
||- 2026-04-11: Backfill ingest of posts/2026-02-25.json — 5 posts captured (4 Simon Willison, 1 FastAPI release), FastAPI stack updated with 0.133.1 (Agent Skill + test fix), Claude Code remote control docs captured
||- 2026-04-11: Backfill ingest of posts/2026-02-24.json — 4 posts captured (2 Simon Willison, 2 FastAPI releases), FastAPI stack updated with 0.132.1–0.133.0 (Starlette 1.0+ support)
||- 2026-04-11: Backfill ingest of posts/2026-02-21.json — 4 posts captured (2 Simon Willison, 2 FastAPI), FastAPI stack updated with 0.129.1–0.129.2
||- 2026-04-11: Backfill ingest of posts/2026-02-19.json — 10 posts (Simon Willison), SWE-bench leaderboard drafted, Gemini 3 Deep Think updated with 3.1 Pro pricing
||- 2026-04-11: Backfill ingest of posts/2026-02-17.json — 12 posts (Simon Willison), SQLite hamming extension compiled, Qwen3.5/Claude Sonnet 4.6/dynamic filtering drafted
||- 2026-04-11: Backfill ingest of posts/2026-02-13.json — 3 posts captured, no compilation (all opinion/demos)
||- 2026-04-11: Backfill ingest of posts/2026-02-12.json — 7 posts captured, FastAPI 0.129.0 compiled, Codex Spark + Gemini 3 Deep Think drafted
|
## Principles
|- [API Key Security](principles/api-key-security.md) — privilege escalation when services share keys, Google Maps→Gemini case study (2026-04-11)
|- [API Design](principles/api-design.md) — REST, webhooks, error handling (2026-04-24)
|- [AI-Assisted Development](principles/ai-assisted-development.md) — agentic workflows, iterative building (2026-04-24)

## Practices
|- [Bitwarden CLI Compromise](practices/bitwarden-cli-compromise.md) — supply chain attack in v2026.4.0, credential exposure (2026-04-25)
|- [Agent Verification Tools](practices/agent-verification-tools.md) — Showboat + Rodney for agent demo/browser automation (2026-04-11)
|- [Testing with Coding Agents](practices/testing-with-coding-agents.md) — getting AI agents to write good tests (2026-04-11)
|- [Agent Skill Architecture](practices/agent-skill-architecture.md) — designing reusable skill.md patterns (2026-04-24)
|- [Engineering Lessons](lessons.md) — compiled technical lessons and operational gotchas (2026-04-24)

## Drafts (unverified)
- [GGML & llama.cpp — Hugging Face Acquisition](drafts/2026-02-20-ggml-llama-cpp-hf.md) — ggml.ai joins HF, llama.cpp stays open-source, single-click transformers integration (2026-04-11)
- [Browser-Based Agent Sandboxing](drafts/browser-based-agent-sandboxing.md) — sandbox approaches for coding agents (2026-04-11)
- [ChatGPT Sandbox Capabilities](drafts/chatgpt-sandbox-capabilities.md) — OpenAI's container environment as of Jan 2026 (2026-04-11)
- [Cloudflare Workers + Python + SQLite](drafts/cloudflare-workers-python-sqlite.md) — Pyodide + D1 research (2026-04-11)
- [Coding Agent Skills Standard](drafts/coding-agent-skills-standard.md) — SKILL.md convention, agentskills.io, OpenAI Codex (2026-04-11)
- [Kimi K2.5](drafts/kimi-k25.md) — Moonshot AI 1T MoE multimodal model, agent swarm paradigm (2026-04-11)
- [Multi-Agent Coordination](drafts/multi-agent-coordination.md) — planner/worker hierarchy patterns (2026-04-11)
- [Prompt Injection Agent Exfiltration](drafts/prompt-injection-agent-exfiltration.md) — agent security risks (2026-04-11)
- [Sandbox Secret Proxy](drafts/sandbox-secret-proxy.md) — placeholder tokens + proxy injection pattern for secret isolation in code sandboxes (2026-04-11)
- [OpenAI Skills API](drafts/openai-skills-api.md) — reusable skill packaging for LLM APIs, comparison with Hermes skills (2026-04-11)
- [GLM-5](drafts/glm-5.md) — 744B MIT-licensed model, agentic benchmarks, OpenRouter available (2026-04-11)
- [GPT-5.3-Codex-Spark](drafts/2026-02-12-codex-spark.md) — OpenAI × Cerebras ultra-fast coding model, 1000+ tok/s (2026-04-11)
- [Gemini 3 Deep Think](drafts/2026-02-12-gemini-3-deep-think.md) — Google reasoning model, ARC-AGI-2 84.6%, Codeforces 3455 Elo (2026-04-11)
- [Qwen 3.5](drafts/qwen35.md) — Alibaba 397B MoE, 17B active, 256K context, OpenRouter $0.39/M input (2026-04-11)
- [SWE-bench Leaderboard](drafts/2026-02-19-swe-bench-leaderboard.md) — Feb 2026 independent benchmark, Claude 4.5 Opus #1, 4 Chinese models in top 10 (2026-04-11)
- [Claude Sonnet 4.6](drafts/claude-sonnet-46.md) — Anthropic model, Opus 4.5 performance at Sonnet pricing, prefix support dropped (2026-04-11)
- [Anthropic Dynamic Filtering](drafts/anthropic-dynamic-filtering.md) — web search code execution filtering, +11% accuracy, -24% tokens (2026-04-11)

## Directories
- `principles/` — how to think about problems (low churn)
- `languages/` — Python, TypeScript, Bash, SQL idioms (medium churn)
- `stacks/` — Next.js, React Native/Expo, FastAPI, SQLite, Docker, systemd (high churn)
- `practices/` — workflow and process (medium churn)
- `drafts/` — unverified, in-progress pages
