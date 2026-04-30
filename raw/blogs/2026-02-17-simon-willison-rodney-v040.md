---
source_url: https://simonwillison.net/2026/Feb/17/rodney/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-rodney-v040
---

# Rodney v0.4.0

Simon Willison has released **Rodney v0.4.0**, a CLI tool for browser automation designed to work alongside Showboat. This update introduces significant new testing capabilities, cross-platform support, and improved session management.

## Key New Features & Commands

- **`rodney assert`**: A new command for running JavaScript tests. It returns exit code 1 if the assertion fails, making it ideal for CI/CD pipelines.
- **`rodney start --show`**: Allows users to make the browser window visible during automation (contributed by Antonio Cuni).
- **`rodney connect PORT`**: Enables debugging of an already-running Chrome instance (contributed by Peter Fraenkel).
- **Directory-Scoped Sessions**: New `--local` and `--global` flags for managing session state.
- **Cache Management**: Added `reload --hard` and `clear-cache` commands.
- **Security & Environment**: `--insecure` flag to ignore certificate errors, `RODNEY_HOME` environment variable for custom state directories.

## Technical Improvements

- **Exit Code Logic**: Errors now use **exit code 2**, reserving **exit code 1** specifically for check/assertion failures.
- **Windows Support**: Added build-tag helpers to avoid `Setsid` on Windows.
- **Expanded CI**: Tests now run on `windows-latest` and `macos-latest` in addition to Linux.

## Example: Testing with Shell Scripts

```bash
#!/bin/bash
set -euo pipefail
rodney start
rodney open "https://example.com"
rodney waitstable
check rodney exists "h1"
check rodney visible "h1"
check rodney assert 'document.title' 'Example Domain'
rodney stop
```
