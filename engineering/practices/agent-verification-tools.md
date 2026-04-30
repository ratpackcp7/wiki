---
title: Agent Verification Tools
created: 2026-04-11
updated: 2026-04-11
type: practice
tags: [agents, tdd, browser-automation, cli, go, verification, claude-code]
sources:
  - url: https://simonwillison.net/2026/Feb/10/showboat-and-rodney/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/16/rodney-claude-code/
    fetched: 2026-04-11
  - url: https://github.com/simonw/showboat
    fetched: 2026-04-11
  - url: https://github.com/simonw/showboat/releases/tag/v0.6.0
    fetched: 2026-04-11
  - url: https://github.com/simonw/rodney
    fetched: 2026-04-11
  - url: https://github.com/simonw/datasette-showboat/releases/tag/0.1a0
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: unverified
---

# Agent Verification Tools

As AI coding agents (Claude Code, Codex, etc.) produce more code, the QA burden shifts to humans. Two Go CLI tools from Simon Willison solve complementary parts of this problem: **proving code works** and **automating browser verification**.

## Showboat — Executable Demo Documents

A CLI that builds a Markdown doc combining commentary, executed commands, and captured output. The doc is both readable documentation and reproducible proof.

### Why it matters
- Agents can't "cheat" by editing Markdown — `showboat verify` re-runs all code blocks and diffs against recorded output.
- Real-time streaming via `SHOWBOAT_REMOTE_URL` lets supervisors watch agent work live.
- `showboat pop` allows self-correction (remove a failed step).

### Core commands
| Command | Purpose |
|---------|---------|
| `init <file> <title>` | Start a demo doc |
| `note <file> [text]` | Add commentary |
| `exec <file> <lang> [code]` | Run code, capture output |
| `image <file> <path>` | Embed an image |
| `pop <file>` | Remove last section (error fix) |
| `verify <file>` | Re-run all blocks, diff output |
| `extract <file>` | Emit CLI commands to recreate |

### Install
```shell
uv tool install showboat   # or: uvx showboat --help
```

### Agent prompt pattern
> "Run `uvx showboat --help` and then use showboat to create a demo.md document describing the feature you just built."

## Rodney — CLI Browser Automation

A CLI wrapper for the [rod](https://github.com/go-rod/rod) Go library. Drives a persistent headless Chrome instance — multiple CLI commands connect to the same long-running browser, preserving tabs/state between invocations.

### Why it matters
- Agents can take screenshots, run accessibility audits, and interact with web UIs from the CLI.
- `rodney assert` provides shell-scriptable assertions (exit 0/1/2 pattern for CI).
- Pairs with Showboat: agent runs `rodney screenshot`, then `showboat image` to embed in the demo doc.

### Core commands
| Command | Purpose |
|---------|---------|
| `start [--show] [-k]` | Launch Chrome (headless default) |
| `open <url>` | Navigate tab |
| `click / input / select` | Interact with elements |
| `js 'expression'` | Execute JS, get result |
| `screenshot [file]` | Full-page screenshot |
| `assert 'expr' 'expected'` | Assert JS result |
| `ax-tree --json` | Accessibility audit |
| `stop` | Shut down browser |

### Install
```shell
uv tool install rodney   # or: uvx rodney --help
```

### Session scoping
`--local` flag creates `./.rodney/` for directory-scoped sessions (isolated cookies, state). Auto-detected if present.

## Showboat + Rodney workflow

The intended pattern for agent verification:

1. Agent builds a feature
2. Agent runs `rodney start` → `rodney open` → `rodney screenshot` to capture visual proof
3. Agent uses `showboat exec` and `showboat image` to build a demo doc
4. Human reviews the demo doc or watches via streaming
5. Human runs `showboat verify` to confirm outputs still match

This replaces the "agent says it works" workflow with "agent shows it works with reproducible evidence."

## Recent changes

- **2026-02-16**: Showboat v0.6.0 — new `SHOWBOAT_REMOTE_URL` feature for remote monitoring of agent demo docs. datasette-showboat 0.1a0 (initial release) accepts and displays these POST submissions. ([release](https://github.com/simonw/showboat/releases/tag/v0.6.0))
- **2026-02-16**: Rodney + Claude Code desktop — visual feedback loop using `Read /path/to/image` to see Rodney screenshots inline during agent coding sessions. ([blog](https://simonwillison.net/2026/Feb/16/rodney-claude-code/))

## Chris's preferences

- See `chris-preferences.md#agent-tooling` for Chris's stance on AI agent workflows.
- Delta from best practice: Chris uses Hermes agent (Bob) rather than Claude Code directly — Showboat/Rodney could be adapted for Bob's autonomous verification tasks.
- Last sync with chris-preferences: 2026-04-11
