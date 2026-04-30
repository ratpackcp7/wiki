---
source_url: https://simonwillison.net/2025/Dec/24/claude-code-transcripts/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-24-simon-willison-claude-code-transcripts
---

# Release: claude-code-transcripts 0.1

Release [claude-code-transcripts 0.1](https://github.com/simonw/claude-code-transcripts/releases/tag/0.1) — Tools for publishing transcripts for Claude Code sessions

Posted 24th December 2025 at 11:45 pm

## Primary source: GitHub repo

Claude Code Transcripts is an open-source tool by Simon Willison designed to convert Claude Code session files (JSON/JSONL) into clean, mobile-friendly, paginated HTML transcripts.

**Note:** The `web` commands (for listing and converting web sessions) are currently broken due to changes in unofficial Anthropic APIs. See [issue #77](https://github.com/simonw/claude-code-transcripts/issues/77).

### Installation

```shell
uv tool install claude-code-transcripts
# or
uvx claude-code-transcripts --help
```

### Core commands

| Command | Description |
| :--- | :--- |
| `local` | (Default) Select from local sessions in `~/.claude/projects`. |
| `web` | Select from web sessions via the Claude API (currently broken). |
| `json` | Convert a specific JSON/JSONL file or URL. |
| `all` | Convert all local sessions into a structured, browsable HTML archive. |

### Key features

- `-o, --output DIRECTORY`: Specify output folder.
- `-a, --output-auto`: Auto-names subdirectories based on session ID.
- `--repo OWNER/NAME`: Links commits to the specified GitHub repo.
- `--json`: Includes the original source data in the output directory.
- `--gist`: Uploads the transcript to a GitHub Gist (requires `gh` CLI).

### Release notes (0.1)

Initial release. Use the `claude-code-publish` command to convert a Claude Code for web `session.json` file to a folder of browseable HTML.

- License: Apache-2.0
- Languages: Python (54.8%), HTML (42.0%), JavaScript (3.2%)
- Example transcript: https://static.simonwillison.net/static/2025/claude-code-microjs/index.html
