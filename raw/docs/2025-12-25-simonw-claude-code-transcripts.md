---
source_url: https://github.com/simonw/claude-code-transcripts
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-25-simonw-claude-code-transcripts
---

# Claude Code Transcripts

Tools for publishing transcripts for Claude Code sessions.

**Warning:** The `web` commands (for listing and converting web sessions) are currently broken due to changes in unofficial Anthropic APIs. See [Issue #77](https://github.com/simonw/claude-code-transcripts/issues/77) for details.

## Installation & Quick Start

The tool is written in Python and is best managed via `uv`.

Install via uv:
```shell
uv tool install claude-code-transcripts
```

Run without installing:
```shell
uvx claude-code-transcripts --help
```

Quickest way to view a recent local session:
```shell
claude-code-transcripts
```
This opens an interactive picker, generates HTML in a temp directory, and opens it in your browser.

## Core Commands

| Command | Description |
| :--- | :--- |
| `local` | (Default) Select from sessions in `~/.claude/projects`. |
| `web` | Select from web sessions via Claude API (currently broken). |
| `json` | Convert a specific JSON/JSONL file or URL. |
| `all` | Convert all local sessions into a browsable HTML archive. |

## Detailed Usage & Features

### 1. Local & Web Sessions
- **Local:** Uses `--limit` (default 10) to control the number of sessions displayed.
- **Web:** Displays sessions grouped by GitHub repository. On macOS, it automatically retrieves credentials from the keychain if logged into Claude Code.

### 2. Output Options
All commands support the following flags:
- `-o, --output DIRECTORY`: Specify output location.
- `-a, --output-auto`: Auto-names subdirectories based on session ID.
- `--repo OWNER/NAME`: Links commits to the specified GitHub repo.
- `--json`: Includes the original source data in the output folder.
- `--gist`: Uploads the transcript to a GitHub Gist.

### 3. Publishing to GitHub Gist
Using the `--gist` flag provides a shareable preview URL via gisthost.github.io.
- **Requirement:** Must have GitHub CLI (`gh`) installed and authenticated.
- **Output Example:**
  ```
  Gist: https://gist.github.com/username/abc123def456
  Preview: https://gisthost.github.io/?abc123def456/index.html
  ```

### 4. Batch Processing (`all` command)
Creates a structured archive of every local session:
- **Master Index:** Lists all projects.
- **Project Pages:** Lists sessions by date.
- **Flags:** `--dry-run` (preview only), `--include-agents` (include agent-* files), and `-q` (quiet mode).

## Development & Technical Details

- **License:** Apache-2.0
- **Languages:** Python (54.8%), HTML (42.0%), JavaScript (3.2%).
- **Testing:** Uses `pytest`. Run via `uv run pytest`.
- **Key Contributors:** Simon Willison, Claude (AI), and Brendan Becker.

### Generated Output Structure
When a transcript is generated, it produces:
- `index.html`: A timeline of prompts and commits.
- `page-XXX.html`: Paginated transcript content.
- (Optional) `session.json`: The raw source data.

## Resources
- **Example Transcript:** https://static.simonwillison.net/static/2025/claude-code-microjs/index.html
- **Background Article:** https://simonwillison.net/2025/Dec/25/claude-code-transcripts/
