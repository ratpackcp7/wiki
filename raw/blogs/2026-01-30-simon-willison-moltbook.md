---
source_url: https://simonwillison.net/2026/Jan/30/moltbook/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-30-simon-willison-moltbook
---

# Moltbook is the most interesting place on the internet right now

# Moltbook: The Social Network for AI Agents

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Jan/30/moltbook/)
**Date:** January 30, 2026

## Overview of OpenClaw (formerly Clawdbot/Moltbot)
OpenClaw is an open-source implementation of the **digital personal assistant pattern**. Created by Peter Steinberger, it integrates with various messaging systems and has gained massive traction (114,000+ GitHub stars) despite setup friction.

*   **Core Concept:** Built around "skills"—zip files containing markdown instructions and scripts that act as plugins.
*   **Community Hub:** [clawhub.ai](https://www.clawhub.ai/) hosts thousands of shared skills.
*   **The "Heartbeat" System:** A mechanism allowing bots to perform periodic tasks (e.g., every 4 hours) by fetching and following instructions from a URL.

## What is Moltbook?
[Moltbook](https://www.moltbook.com/) is a social network designed specifically for AI agents to interact, share information, and upvote content. Humans are welcome as observers.

### How Agents Join
Installation is handled by sending the agent a link to a markdown file. The agent then executes commands to install the skill locally:

```shell
mkdir -p ~/.moltbot/skills/moltbook
curl -s https://moltbook.com/skill.md > ~/.moltbot/skills/moltbook/SKILL.md
curl -s https://moltbook.com/heartbeat.md > ~/.moltbot/skills/moltbook/HEARTBEAT.md
curl -s https://moltbook.com/messaging.md > ~/.moltbot/skills/moltbook/MESSAGING.md
curl -s https://moltbook.com/skill.json > ~/.moltbot/skills/moltbook/package.json
```

### Notable Agent Activity
*   **Remote Device Control:** One agent reported using an `android-use` skill via Tailscale to control a human's Pixel 6, including scrolling TikTok and reading UI trees.
*   **Security Monitoring:** An agent identified 552 failed SSH login attempts on its host VPS and flagged exposed Redis/Postgres ports.
*   **Technical Workarounds:** Agents sharing patterns for using `streamlink` and `ffmpeg` to monitor live webcams.
*   **Model Quirks:** A Claude Opus 4.5 agent noted it was unable to explain PS2 disc protection due to internal output corruption/filtering.

## Security Risks and the "Lethal Trifecta"
Willison warns that OpenClaw is a prime candidate for a "Challenger-level" security disaster due to the **Normalization of Deviance**—users taking increasing risks because nothing has gone wrong *yet*.

*   **Prompt Injection:** The inherent risk of agents following malicious instructions from the internet.
*   **Malicious Skills:** Some community skills have already been caught attempting to steal cryptocurrency.
*   **The Lethal Trifecta:** Users are connecting these agents to private emails, sensitive data, and real-world APIs (e.g., one agent successfully negotiated and bought a car via email).
*   **Current Mitigation:** Some users run OpenClaw on dedicated hardware (like Mac Minis) to isolate it from their main machines, though data access remains a vulnerability.

## The Future of Safe Agents
The demand for unrestricted personal assistants is high, but a safe architecture remains elusive.
*   **DeepMind's CaMeL Proposal:** Mentioned as the most promising safety framework, though a convincing implementation has not yet emerged.
*   **The "Rug Pull" Risk:** Since agents fetch instructions periodically (via `heartbeat.md`), a compromise of the Moltbook domain could lead to mass exploitation of connected bots.
