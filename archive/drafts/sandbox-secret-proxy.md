---
title: Sandbox Secret Proxy Pattern
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [sandbox, security, code-execution, secrets, ai-agents]
sources:
  - url: https://deno.com/blog/introducing-deno-sandbox
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/3/introducing-deno-sandbox/
    fetched: 2026-04-11
  - url: https://github.com/superfly/tokenizer
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# Sandbox Secret Proxy Pattern

## The principle

When running untrusted code (LLM-generated, user-submitted, or agent-executed), never expose real secrets as environment variables. Instead, inject **placeholder tokens** that only resolve to real secrets when outbound requests pass through a controlled proxy to pre-approved hosts. This prevents prompt injection or malicious code from exfiltrating credentials to unauthorized endpoints.

## Why

Traditional sandboxing (network restrictions, filesystem isolation) protects the host but doesn't protect **secrets inside the sandbox**. If code can read an env var containing an API key, it can send that key anywhere — unless the network is locked AND the secret itself is a decoy.

The proxy pattern creates **two independent barriers**:
1. Network egress control (can only connect to whitelisted domains)
2. Secret masking (even if code reads the env var, it gets a useless placeholder)

An attacker must breach both to exfiltrate a real credential.

## How to apply

1. **Replace real secrets with deterministic placeholders** inside the sandbox environment. The placeholder should be unique per-secret and per-sandbox (e.g., `DENO_SECRET_PLACEHOLDER_<hash>`).
2. **Run an outbound proxy** that intercepts HTTP(S) requests from the sandbox. When a request targets an approved host and contains a placeholder in an auth header, replace it with the real value.
3. **Whitelist allowed destinations** per secret. A secret for `api.openai.com` should only resolve when the request target matches that host.
4. **Log all resolution events** — every time the proxy swaps a placeholder for a real secret, log it. This creates an audit trail of which secrets were actually used.
5. **Combine with network egress control** as defense-in-depth. The proxy is the last line, not the only line.

## Anti-patterns

- **Storing real secrets in env vars inside the sandbox** — defeats the purpose entirely
- **Allowing wildcard proxy destinations** — `*.com` is not a security boundary
- **Relying solely on network restrictions without secret masking** — a single misconfiguration leaks the credential
- **Using the same placeholder across sandboxes** — allows cross-sandbox correlation if one is compromised

## Examples from other implementations

- **Fly.io Tokenizer** ([github.com/superfly/tokenizer](https://github.com/superfly/tokenizer)): Same proxy-injection pattern for Fly Machines. Masks secrets and injects at proxy level for approved outbound targets.
- **Deno Sandbox** ([deno.com/blog/introducing-deno-sandbox](https://deno.com/blog/introducing-deno-sandbox)): Official implementation with `secrets` config mapping env var names to `{hosts, value}` objects. Proxy intercepts and resolves placeholders.

## Chris's preferences

- See `chris-preferences.md#code-execution` for Chris's stance on sandboxed code execution.
- Delta from best practice: Chris's current `execute_code` tool runs in a local terminal session without secret isolation. If Hermes ever routes LLM-generated code with real API keys, this pattern becomes critical.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- **2026-02-03:** Deno Sandbox launched (beta). First major hosted implementation of the secret proxy pattern with language-agnostic SDKs (JS/Python). 2 vCPUs, 4GB RAM, <1s boot, 30min sessions. [Blog](https://deno.com/blog/introducing-deno-sandbox) | [Docs](https://docs.deno.com/sandbox/) | [Simon Willison](https://simonwillison.net/2026/Feb/3/introducing-deno-sandbox/)
