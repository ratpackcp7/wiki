---
source_url: https://code.claude.com/docs/en/remote-control
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-25-claude-code-remote-control
---

# Claude Code: Remote Control

Remote Control allows users to continue local Claude Code sessions from any device (browser or mobile app) while the actual execution remains on the local machine.

## Core Concept
Unlike "Claude Code on the web" (which runs in the cloud), **Remote Control** keeps the session running locally. The web/mobile interface acts only as a "window" into your machine.
*   **Local Persistence:** Filesystem, MCP servers, tools, and project configs remain local.
*   **Sync:** Conversations stay in sync across terminal, browser, and phone.
*   **Resilience:** Sessions automatically reconnect if the local machine sleeps or loses network.

## Requirements & Setup
*   **Version:** Claude Code `v2.1.51` or later.
*   **Subscription:** Pro, Max, Team, or Enterprise (API keys are **not** supported).
*   **Admin Settings:** For Team/Enterprise, an admin must enable the toggle at [claude.ai/admin-settings/claude-code](https://claude.ai/admin-settings/claude-code).
*   **Auth:** Must be logged in via `claude /login` (claude.ai OAuth).

## Starting a Session

### 1. CLI Server Mode
Best for waiting for remote connections without an active local chat.
```bash
claude remote-control
```
*   **Key Flags:**
    *   `--name "Project Name"`: Sets a custom title.
    *   `--spawn <mode>`:
        *   `same-dir` (default): Sessions share the CWD.
        *   `worktree`: Each session gets a unique git worktree.
        *   `session`: Single-session mode (rejects others).
    *   `--capacity <N>`: Max concurrent sessions (default 32).
    *   `--sandbox`: Enables filesystem/network isolation.

### 2. Interactive CLI Session
Start a local chat that is *also* accessible remotely.
```bash
claude --remote-control
# or
claude --rc "My Project"
```

### 3. From an Existing Session
Enable remote access while already inside a Claude Code prompt.
```bash
/remote-control
# or
/rc My Project
```

### 4. VS Code Extension
Type `/remote-control` or `/rc` in the prompt box. Requires version `v2.1.79+`.

## Connecting from Other Devices
1.  **URL:** Open the session URL provided in the terminal.
2.  **QR Code:** Press `spacebar` in server mode to show a QR code for the Claude mobile app.
3.  **Session List:** Find the session at [claude.ai/code](https://claude.ai/code); remote sessions feature a **computer icon with a green dot**.

## Security & Connection
*   **No Inbound Ports:** Uses outbound HTTPS requests only; no need to open firewalls.
*   **Transport:** Traffic is routed via Anthropic API over TLS.
*   **Credentials:** Uses multiple short-lived, purpose-scoped credentials.

## Limitations
*   **Process Dependency:** If you close the terminal or quit VS Code, the session ends.
*   **Network Timeout:** If the local machine is offline for >10 minutes, the process exits.
*   **Ultraplan Conflict:** Starting an "Ultraplan" session will disconnect Remote Control.
*   **Concurrency:** Outside of "Server Mode," each process supports only one remote session.

## Troubleshooting Common Errors

| Error Message | Cause / Solution |
| :--- | :--- |
| **"Requires a subscription"** | Unset `ANTHROPIC_API_KEY` and run `claude auth login`. |
| **"Requires full-scope token"** | You used `setup-token`. Run `claude auth login` for OAuth. |
| **"Disabled by policy"** | Admin must enable the toggle in settings, or you are using an API key instead of OAuth. |
| **"Not yet enabled for account"** | Unset `DISABLE_TELEMETRY` or `CLAUDE_CODE_USE_BEDROCK/VERTEX`. |
| **"Credentials fetch failed"** | Check network/proxy on port 443; ensure you aren't using an API key. |

## Comparison: Remote Work Approaches

| Feature | Remote Control | Dispatch | Claude on Web |
| :--- | :--- | :--- | :--- |
| **Runs on** | Your Local Machine | Your Local Machine | Anthropic Cloud |
| **Trigger** | Browser/Mobile App | Mobile App | Browser |
| **Best For** | Steering in-progress work | Delegating tasks away from desk | No local setup / Parallel tasks |
