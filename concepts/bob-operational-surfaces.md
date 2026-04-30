---
title: Bob Operational Surfaces
created: 2026-04-08
updated: 2026-04-08
type: concept
tags: [configuration]
sources: [session:2026-04-08]
---

# Bob Operational Surfaces

How Bob (the agent) and Chris communicate, and what each channel is for. Load-bearing role separation.

## Channels

### Telegram (primary ops)
- Day-to-day ops commands, quick questions, status checks
- Cron job deliveries land here by default
- Charts (finance, sensor, HA history) — Bob generates PNG → sends via Telegram
- Chris expects responses measured in seconds to a few minutes

### Discord (secondary ops)
- Per-project channels (cc-loop monitoring, build notifications)
- Long-form deliveries that would spam Telegram
- Complementary, not a replacement for Telegram

### hermes-workspace (bob.cp7.dev)
- Next.js web UI, port 3002
- Full chat interface with history, token usage, session browsing
- Used for deeper work sessions, code review, long-form reasoning
- Runs on [[acerserver]]

### CLI (acerserver terminal)
- Chris occasionally invokes Bob directly from terminal
- Full tool access, no message-size limits

## Role split: Claude.ai vs Bob

- **Claude.ai (web app)** — planning, research, brainstorming, writing long docs. Chris uses it for "think about this with me" work. It does NOT have access to Chris's infrastructure.
- **Bob (this agent)** — ops execution, infrastructure, finance, smart home, code, everything tied to Chris's actual machines and data. Bob has the tools, Bob has the session memory, Bob has the wiki.

**Rule of thumb**: if it involves a real file, a real server, a real dollar, or a real sensor — it's Bob. If it's "help me think about X" with no execution — it's often Claude.ai, though Bob can do it too.

## Delivery methods for cron jobs

See skill: `cronjob` — cron jobs can deliver to `telegram`, `discord`, `email`, `sms`, `local`, etc. Default is `telegram`.

## Related
- [[acerserver]] — hosts hermes-gateway, hermes-workspace, cp7-dashboard
- [[chris]] — user profile
