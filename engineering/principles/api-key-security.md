---
title: API Key Security
created: 2026-04-11
updated: 2026-04-11
type: principle
tags: [security, api-keys, google-cloud, credentials, privilege-escalation]
sources:
  - url: https://trufflesecurity.com/blog/google-api-keys-werent-secrets-but-then-gemini-changed-the-rules
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/26/google-api-keys/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# API Key Security

## The principle

API keys granted for one purpose can silently gain new privileges when additional services are enabled on the same project. Treat every API key as a secret unless you have verified, from the provider's current documentation, that it is safe to expose. Never assume a key's permissions are static — audit them when the project's enabled services change.

## Why

Google spent a decade telling developers that `AIza...` keys were "not secrets" — safe to embed in client-side JavaScript for Maps, Firebase, etc. Then Gemini launched. When the Generative Language API is enabled on a GCP project, existing unrestricted keys silently gain access to Gemini endpoints — including reading private files and incurring AI billing costs. Truffle Security found 2,863 exposed keys in the November 2025 Common Crawl, including Google's own.

This is not a Google-specific problem. Any platform that adds sensitive APIs to existing projects without requiring explicit key re-authorization creates this class of vulnerability.

## How to apply

1. **Scope every API key to specific services** — never leave keys "Unrestricted." If a key only needs Maps, restrict it to Maps only.
2. **Separate keys by purpose** — one key per service. Never reuse a client-side key for server-side or AI APIs.
3. **Audit when enabling new APIs** — every time you enable a new API on a GCP project, review all existing keys for unintended access.
4. **Scan for leaked keys proactively** — use `trufflehog filesystem /path/to/code --only-verified` or equivalent before commits.
5. **Treat "not a secret" claims skeptically** — provider guidance changes. The Firebase docs said "not a secret" for years; now those keys can access Gemini.

## Anti-patterns

- Embedding API keys in client-side code without service restrictions
- Reusing a single key across multiple services for "convenience"
- Assuming provider security guidance from years ago still applies
- Enabling new APIs on a project without auditing existing credentials

## Chris's preferences

- See `chris-preferences.md` for Chris's stance.
- Delta from best practice: Chris runs self-hosted services behind Cloudflare tunnel — API key management applies to any GCP projects (if any) and third-party API keys in `.env` files across projects.
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- 2026-02-25: Truffle Security disclosed Google API key privilege escalation — keys designed for Maps silently gain Gemini access ([primary source](https://trufflesecurity.com/blog/google-api-keys-werent-secrets-but-then-gemini-changed-the-rules))
- 2026-02-26: Simon Willison covered the disclosure, noting 2,863 vulnerable keys in Common Crawl including Google's own ([blog](https://simonwillison.net/2026/Feb/26/google-api-keys/))
