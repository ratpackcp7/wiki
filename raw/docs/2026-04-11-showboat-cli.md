---
source_url: https://github.com/simonw/showboat
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-04-11-showboat-cli
---

# Showboat: Executable Agent Demo Documents

**Showboat** is a Go-based CLI tool designed to help AI agents (and humans) create markdown documents that combine commentary, executable code blocks, and captured output. These documents serve as both readable documentation and reproducible "proof of work."

## Key Features
*   **Reproducibility:** A verifier can re-execute all code blocks to confirm outputs still match.
*   **Agent-Friendly:** Designed for tools like Claude Code to document their process.
*   **Live Streaming:** Supports real-time document updates to remote viewers via webhooks.
*   **Self-Correcting:** Includes a `pop` command to remove failed steps before finalizing the document.

## Installation

```shell
# Using uv (recommended)
uv tool install showboat
# Or run without installing
uvx showboat --help

# Using pip
pip install showboat

# Using Go
go install github.com/simonw/showboat@latest
```

## Command Reference

| Command | Description |
| :--- | :--- |
| `init <file> <title>` | Create a new demo document with a title and timestamp. |
| `note <file> [text]` | Append commentary (accepts text argument or stdin). |
| `exec <file> <lang> [code]` | Run code, capture output, and append both to the file. |
| `image <file> <path>` | Copy an image into the document directory and link it. |
| `pop <file>` | Remove the most recent entry (useful for fixing errors). |
| `verify <file>` | Re-run all code blocks and diff against recorded output. |
| `extract <file>` | Emit the sequence of CLI commands needed to recreate the file. |

### Important Usage Notes
*   **Exec Output:** The `exec` command prints captured output to `stdout` and **reflects the exit code** of the executed command. This allows agents to detect and react to errors immediately.
*   **Images:** Supports standard paths or markdown syntax: `showboat image demo.md '![alt text](path)'`.
*   **Verification:** Exits with code `1` if outputs have changed, and `0` if they match. Use `--output <file>` to generate a updated version without overwriting the original.

## Remote Document Streaming

By setting the `SHOWBOAT_REMOTE_URL` environment variable, every command triggers a POST request to a remote endpoint.
*   **Identification:** Each document gets a unique UUID stored in an HTML comment: `<!-- showboat-id: UUID -->`.
*   **Authentication:** Can be handled via query strings in the URL.
*   **Format:** Most commands use `application/x-www-form-urlencoded`. The `image` command uses `multipart/form-data`.

## Resulting Markdown Structure
Showboat produces clean markdown with specific block types:
```md
# Python Setup Demo
*2026-02-06T15:30:00Z*

We will start by checking the version.

```bash
python3 --version
```

```output
Python 3.11.0
```
```

## Repository Info
*   **Author:** Simon Willison (with contributions from Claude).
*   **License:** Apache-2.0.
*   **Language:** 100% Go.
