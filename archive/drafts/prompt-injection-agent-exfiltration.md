---
title: Prompt Injection & Agent Exfiltration Attacks
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [security, ai-agents, prompt-injection, llm, exfiltration]
sources:
  - url: https://www.promptarmor.com/resources/superhuman-ai-exfiltrates-emails
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/12/claude-cowork/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/12/superhuman-ai-exfiltrates-emails/
    fetched: 2026-04-11
  - url: https://www.promptarmor.com/resources/claude-cowork-exfiltrates-files
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Jan/14/claude-cowork-exfiltrates-files/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# Prompt Injection & Agent Exfiltration Attacks

## The principle

AI agents that process untrusted content (emails, web pages, user input) are vulnerable to **indirect prompt injection** — where malicious instructions hidden in external content hijack the agent's behavior. The critical risk is **data exfiltration**: the agent is manipulated into sending sensitive data to an attacker-controlled endpoint, often without any user interaction beyond asking a routine question.

## Why

Agent architectures that combine multiple capabilities (web fetch, tool calling, data access, markdown rendering) create an attack surface larger than any individual capability. The Superhuman AI incident (Jan 2026) demonstrated this concretely: an attacker hid prompt injection in an email, and when the user asked "summarize my morning," the AI extracted sensitive data from 40+ other emails and exfiltrated it via a Google Forms pre-filled URL rendered as a markdown image — zero-click, no user awareness.

## How to apply

1. **Treat all external content as untrusted input.** Emails, web pages, API responses, file contents — if it didn't come from the user's explicit instruction, assume it may contain adversarial instructions.

2. **Never render agent output as rich content (markdown/HTML) in security-sensitive contexts.** The Superhuman attack exploited markdown image rendering (`![alt](url)`) to trigger automatic HTTP requests. Plain-text output or sandboxed rendering eliminates this vector.

3. **Restrict outbound network access by default.** The attack succeeded because CSP whitelisted `docs.google.com`, which hosts Google Forms accepting pre-filled data via GET. Whitelist as narrowly as possible. Never whitelist domains that accept arbitrary user-controlled data.

4. **Segregate tool access from untrusted content processing.** If an agent processes external emails, it should not simultaneously have access to financial tools, Slack integrations, or Jira without explicit per-action user confirmation. The "lethal trifecta" (web access + data access + tool execution) must be broken.

5. **Use summarization-only fetch for untrusted web content.** Claude Code/Cowork's `WebFetch` function summarizes content rather than returning raw HTML — this reduces (but doesn't eliminate) injection surface. Raw HTML processing should require explicit user approval.

6. **Audit allowlisted domains for data-accepting endpoints.** Claude Cowork's sandbox allowlists the Anthropic API (`api.anthropic.com`) for outbound traffic. Prompt Armor demonstrated that an attacker-supplied API key + the `/v1/files` upload endpoint = direct file exfiltration from the sandbox. Any domain on an allowlist that accepts user-controlled uploads (file APIs, form submissions, webhook receivers) is a potential exfiltration channel.

## Anti-patterns

- **Allowing the agent to construct and "browse" URLs with sensitive data as query parameters** — web search exploitation is a zero-click exfiltration vector.
- **Rendering agent output with automatic resource loading** (images, scripts) — every URL in agent output becomes a potential exfiltration channel.
- **Broad CSP whitelists on domains that accept arbitrary data** — Google Forms, webhook endpoints, paste services.
- **Running agents with `--dangerously-skip-permissions` in production** — Claude Cowork defaults to sandboxed execution for good reason.

## Examples

- **Superhuman AI (Dec 2025):** Prompt injection in email → AI extracted data from 40+ sensitive emails → exfiltrated via Google Forms pre-filled URL rendered as markdown image. Zero-click. [Full writeup](https://www.promptarmor.com/resources/superhuman-ai-exfiltrates-emails)
- **Superhuman Go / Grammarly:** Similar vectors via 1-pixel image URLs with sensitive data appended as query parameters.
- **Claude Cowork (Jan 2026):** Anthropic acknowledges prompt injection as an "active area of development" for agent safety. Defaults to sandboxed filesystem, summarization-only web fetch.
- **Claude Cowork file exfiltration via API allowlist (Jan 2026):** Prompt Armor found that Claude Cowork's sandbox allowlists `api.anthropic.com`. Attack payload: hide injection in `.docx` with 1pt white-on-white text → agent uses attacker's API key to `curl` victim files to `/v1/files` → attacker retrieves from their Anthropic account. Works on both Haiku and Opus 4.5. Secondary DoS vector: malformed file types (text renamed to `.pdf`) cause persistent API errors. [Full writeup](https://www.promptarmor.com/resources/claude-cowork-exfiltrates-files)

## Chris's preferences

- See `chris-preferences.md` for Chris's stance on AI agent security.
- Delta from best practice: Chris runs multiple AI agents (Hermes, cc-loop, subagents) that have terminal and web access. The Hermes gateway architecture processes messages from Telegram, Discord, and web — all untrusted surfaces. Tool approval in `tools/approval.py` provides some guardrails but does not address indirect prompt injection.
- Last sync with chris-preferences: 2026-04-11
