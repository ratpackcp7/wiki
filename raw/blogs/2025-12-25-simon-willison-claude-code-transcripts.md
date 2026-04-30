---
source_url: https://simonwillison.net/2025/Dec/25/claude-code-transcripts/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-25-simon-willison-claude-code-transcripts
---

# A new way to extract detailed transcripts from Claude Code

Simon Willison has released **claude-code-transcripts** (https://github.com/simonw/claude-code-transcripts), a Python CLI tool that converts Claude Code sessions into detailed, shareable HTML pages. These transcripts provide a superior interface for reviewing Claude's work, including "hidden" thinking traces not usually visible in the terminal.

## Quick Start
If you have uv (https://docs.astral.sh/uv/) installed, you can run it without installation:

```bash
uvx claude-code-transcripts
```

Alternative installation:
- `uv tool install claude-code-transcripts`
- `pip install claude-code-transcripts`

### Key Features
- **Interactive Selection:** Displays a list of local Claude Code sessions to choose from.
- **HTML Output:** Generates an `index.html` summary and detailed `page_x.html` files.
- **Gist Integration:** Use the `--gist` flag (requires gh CLI (https://cli.github.com/)) to automatically upload and preview transcripts via `gistpreview.github.io`.
- **Web Support:** Can fetch sessions from the Claude Code web interface (the asynchronous coding agent).

## Why This Tool Exists
Willison notes that he is now writing more code via Claude Code (often on his phone) than in a traditional editor. This shift creates a documentation gap:
- **Context Preservation:** Transcripts capture prompts, suggestions, justifications, and strategies that were previously recorded in GitHub issues.
- **Visibility:** Standard terminal exports miss "thinking traces."
- **Mobile Workflow:** It is difficult to extract transcripts from the Claude iPhone app; this tool bridges that gap by syncing and converting those sessions.

## Technical Implementation
The tool was built almost entirely using Claude Code itself.

### Dependencies
- **CLI/UI:** `click`, `click-default-group`, and `questionary` (for interactive lists).
- **Logic/Templating:** `Jinja2`, `httpx`, and `markdown`.
- **Testing:** `pytest`, `pytest-httpx`, and `syrupy` (for HTML snapshot testing).

### Reverse Engineering the API
To fetch web sessions, Willison used OpenAI Codex to reverse-engineer the private Claude Code API. A key discovery was how to extract OAuth tokens from the macOS Keychain:

```shell
curl -sS -f \
    -H "Authorization: Bearer $(security find-generic-password -a "$USER" -w -s "Claude Code-credentials" | jq -r .claudeAiOauth.accessToken)" \
    -H "anthropic-version: 2023-06-01" \
    -H "Content-Type: application/json" \
    -H "x-organization-uuid: $(jq -r '.oauthAccount.organizationUuid' ~/.claude.json)" \
    "https://api.anthropic.com/v1/sessions"
```

## Examples & Resources
- **Live Example:** [12-page transcript example](https://static.simonwillison.net/static/2025/claude-code-microjs/index.html)
- **Project Repository:** [simonw/claude-code-transcripts](https://github.com/simonw/claude-code-transcripts)
- **Self-Documenting Development:** Willison included links to the transcripts of the tool's own creation in the commit log (https://github.com/simonw/claude-code-transcripts/commits/main/).
