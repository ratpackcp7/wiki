---
source_url: https://simonwillison.net/2026/Feb/25/claude-code-remote-control/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-25-simon-willison-claude-code-remote-control
---

# Claude Code Remote Control

Anthropic has introduced a new **"Remote Control"** feature for Claude Code, allowing users to bridge the gap between their local terminal and Claude's web/mobile interfaces.

## Core Functionality
The feature allows you to initiate a session on your local machine and then send prompts to that specific machine via the Claude web interface, iOS app, or native desktop app.

*   **Activation Command:**
    ```bash
    claude remote-control
    ```
*   **Interface:** Once active, the session appears in the "Code" tab of the Claude iOS app (e.g., as "Remote Control Session (Mac)").
*   **Capabilities:** It can execute local commands, such as using AppleScript to control local applications (e.g., playing music in the Music app).

## Current Limitations & "Jank"
As a newly released feature, several technical hurdles and limitations were identified:

*   **Authentication Issues:** Users may encounter a "Remote Control is not enabled for your account" error. **Fix:** Log out and back into the Claude Code terminal app.
*   **Session Constraints:** Only one remote session can run on a machine at a time.
*   **Permissions:** The `--dangerously-skip-permissions` flag currently appears ineffective. Users must manually approve every action the agent takes.
*   **Stability:**
    *   Frequent **API 500 Internal Server Errors** were reported during testing.
    *   Restarting the local program breaks existing sessions without clear error messaging, leading to "mysterious API errors" rather than a termination notice.

## Scheduled Tasks (Claude Cowork)
Anthropic also announced recurring task scheduling for **Claude Cowork** (the general agent sibling to Claude Code).

### Key Constraints for Scheduled Tasks:
> "Scheduled tasks only run while your computer is awake and the Claude Desktop app is open. If your computer is asleep or the app is closed when a task is scheduled to run, Cowork will skip the task, then run it automatically once your computer wakes up or you open the desktop app again."

## Expert Insights
*   **Comparison:** This feature moves Claude into the territory of tools like **OpenClaw**, which focuses on mobile-to-device control.
*   **Future Outlook:** While currently buggy, the feature is expected to stabilize quickly. There is a clear desire for a "Cowork Cloud" product to bypass the requirement of keeping a local machine awake for scheduled tasks.
