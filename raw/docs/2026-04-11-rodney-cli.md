---
source_url: https://github.com/simonw/rodney
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-04-11-rodney-cli
---

# Rodney: Chrome Automation CLI

**Rodney** is a Go-based CLI tool designed to drive a persistent headless Chrome instance using the [rod](https://github.com/go-rod/rod) library. Unlike standard automation tools that start a fresh browser for every script, Rodney allows multiple CLI commands to connect to the same long-running Chrome process, preserving tabs and state between invocations.

## Core Architecture
*   **Persistent Browser:** `rodney start` launches Chrome (headless by default) and saves the WebSocket debug URL to `~/.rodney/state.json`.
*   **Short-lived CLI:** Each subsequent command (e.g., `rodney open`) is a brief process that connects via WebSocket, executes an action, and disconnects.
*   **State Management:** Supports both global (`~/.rodney/`) and directory-scoped (`./.rodney/`) sessions via the `--local` flag.

## Installation & Requirements
*   **Requirements:** Go 1.21+, Google Chrome or Chromium.
*   **Build Command:** `go build -o rodney .`
*   **Environment Variables:**
    *   `ROD_CHROME_BIN`: Path to Chrome binary.
    *   `RODNEY_HOME`: Custom data directory.
    *   `ROD_TIMEOUT`: Default 30s for element queries.

## Command Reference

### Browser Control & Navigation
| Command | Description |
| :--- | :--- |
| `start [--show] [-k]` | Launch Chrome (visible with `--show`; ignore TLS with `-k`) |
| `connect <host:port>` | Connect to an existing remote Chrome instance |
| `status` / `stop` | Show browser info or shut down the process |
| `open <url>` | Navigate active tab (automatically adds `http://` if missing) |
| `reload [--hard]` | Refresh page (bypass cache with `--hard`) |
| `pages` / `newpage` | List all tabs or open a new one |

### Extraction & Interaction
*   **Extract:** `url`, `title`, `text "selector"`, `html "selector"`, `attr "selector" "name"`.
*   **Interact:** `click`, `input`, `clear`, `hover`, `focus`, `select`, `submit`.
*   **Files:**
    *   `file "#input" path/to/file` (or `-` for stdin).
    *   `download "selector" [file]` (or `-` for stdout).
*   **JavaScript:** `rodney js "document.title"` (automatically wraps expressions in arrow functions).

### Waiting & Screenshots
*   **Wait:** `wait` (element visible), `waitload` (page load), `waitstable` (DOM stable), `waitidle` (network idle).
*   **Screenshots:**
    *   `screenshot [-w N] [-h N] [file]` (Full page).
    *   `screenshot-el "selector" [file]` (Specific element).

## Testing & Assertions
Rodney is optimized for CI/CD and shell scripting by using specific exit codes:
*   **Exit 0:** Success.
*   **Exit 1:** Check failed (condition not met).
*   **Exit 2:** Error (timeout, no browser, bad arguments).

### Assertion Examples
```shell
# Check if element exists
rodney exists ".loading"

# Assert JS expression truthiness or equality
rodney assert 'document.title' 'Home'
rodney assert 'document.querySelectorAll("a").length' '5' -m "Wrong link count"

# Accessibility (a11y) checks
rodney ax-find --role button --name "Submit"
rodney ax-tree --json  # Dump full accessibility tree
```

## Advanced Features

### Proxy Support
Rodney automatically handles authenticated HTTP proxies (`HTTPS_PROXY=http://user:pass@host:port`). It launches a local forwarding proxy to inject `Proxy-Authorization` headers, bypassing Chrome's native inability to authenticate during HTTPS tunnel establishment.

### Directory-Scoped Sessions
Use `--local` to isolate browser sessions (cookies, history, state) to a specific project folder:
```shell
rodney start --local
# Creates ./.rodney/state.json and ./.rodney/chrome-data/
```
*Note: Rodney auto-detects a local session if `./.rodney/state.json` exists.*

### Shell Scripting Integration
```shell
#!/bin/bash
rodney start
rodney open https://example.com
if rodney exists ".error-message"; then
    rodney text ".error-message"
    exit 1
fi
rodney stop
```
