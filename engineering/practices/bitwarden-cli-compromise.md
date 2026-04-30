---
title: Bitwarden CLI 2026.4.0 Supply Chain Compromise
created: 2026-04-25
updated: 2026-04-25
type: incident
tags: [security, bitwarden, supply-chain, npm, github-actions, credentials]
sources:
  - url: https://selfh.st/weekly/2026-04-24/
    fetched: 2026-04-25
    content_type: blog
last_verified: 2026-04-25
churn_rate: high
confidence: verified
---

# Bitwarden CLI 2026.4.0 Supply Chain Compromise

April 24, 2026: **Bitwarden CLI version 2026.4.0 was compromised via a GitHub Actions supply chain attack** (Checkmarx campaign), exposing secrets and distributing malicious npm code.

## What Happened

- Malicious code injected into the release pipeline via compromised GitHub Actions
- Malicious npm package distributed to users who installed Bitwarden CLI
- Attackers could exfiltrate stored secrets (passwords, tokens, credentials)
- **Source:** Self-Host Weekly article referencing the compromise

## Impact

- All users of Bitwarden CLI version 2026.4.0 may have had their credentials exposed
- Attackers controlled the npm package during the compromise window
- The version was available April 23-24, 2026

## Lessons for Chris

### 1. Don't trust npm packages blindly
Even well-established OSS tools can be compromised. Verify package signatures and integrity before using, especially for credential storage.

### 2. Check release notes before updating
The malicious version (2026.4.0) was released and could have been auto-updated. Verify release notes for supply chain warnings.

### 3. Rotate credentials proactively
If you used Bitwarden CLI in the affected window:
- Rotate all passwords stored in Bitwarden
- Regenerate API keys and tokens
- Check for suspicious activity in your account

### 4. Avoid auto-updating development tools
For security-sensitive tools like credential managers, consider:
- Locking versions in lockfiles
- Manual verification before major updates
- Periodic integrity checks (checksums, signatures)

## Chris's preferences

- See `chris-preferences.md#software-updates` for Chris's stance on version control and auto-updates.
- Chris uses Bitwarden for most credentials, including git credentials and AWS keys.
- This incident highlights the value of not running dev tools as root and never exposing secrets to the web.
- Last sync with chris-preferences: 2026-04-25