---
source_url: https://github.com/simonw/rodney
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-16-simonw-rodney
---

# Rodney: Chrome Automation CLI

**Rodney** is a Go-based command-line tool designed to drive a persistent headless Chrome instance using the [rod](https://github.com/go-rod/rod) library. Unlike standard automation scripts that start and stop a browser for every task, Rodney allows multiple CLI commands to interact with the same long-running browser process.

## Core Architecture
Rodney functions by maintaining a persistent Chrome process and connecting to it via WebSockets for each command.
*   **`rodney start`**: Launches Chrome (headless by default) and saves the WebSocket debug URL to `~/.rodney/state.json`.
*   **`rodney connect H:P`**: Connects to an existing Chrome instance on a remote debug port.
*   **`rodney [command]`**: Connects to the running instance, executes the task (e.g., `open`, `click`, `js`), and disconnects.
*   **`rodney stop`**: Shuts down the Chrome instance and cleans up state.

## Installation & Requirements
*   **Requirements**: Go 1.21+, Google Chrome or Chromium installed.
*   **Build Command**: `go build -o rodney .`
*   **Environment Variables**:
    *   `RODNEY_HOME`: Data directory (Default: `~/.rodney`).
    *   `ROD_CHROME_BIN`: Path to Chrome binary.
    *   `ROD_TIMEOUT`: Default timeout for queries (Default: `30s`).

## Command Reference

### Browser Management & Navigation
| Command | Description |
| :--- | :--- |
| `start [--show] [--insecure]` | Launch Chrome (`--show` for visible window). |
| `open <url>` | Navigate to a URL (adds `http://` automatically). |
| `reload [--hard]` | Reload page; `--hard` bypasses cache. |
| `clear-cache` | Wipes the browser cache via CDP. |
| `status` | Show browser info and active page. |

### Extraction & Interaction
*   **Information**: `url`, `title`, `text "selector"`, `html "selector"`, `attr "selector" "name"`.
*   **Forms/Input**: `click`, `input "selector" "text"`, `clear`, `select`, `submit`, `focus`.
*   **Files**: 
    *   `file "selector" path/to/file` (or `-` for stdin).
    *   `download "selector" [file]` (downloads href/src target).
*   **JavaScript**: `rodney js "document.title"` (automatically wraps expressions in arrow functions).

### Screenshots & PDFs
*   `rodney screenshot [-w N] [-h N] [file.png]`
*   `rodney screenshot-el ".selector" [file.png]`
*   `rodney pdf [output.pdf]`

### Tab Management
*   `pages`: List all tabs (`*` marks active).
*   `newpage [url]`: Open URL in new tab.
*   `page <index>`: Switch to tab by index.
*   `closepage [index]`: Close specific or active tab.

### Accessibility (A11y) Testing
Uses Chrome's Accessibility CDP domain to expose what assistive technologies see:
*   `ax-tree [--depth N] [--json]`: Dumps the full accessibility tree.
*   `ax-find --role R --name N`: Finds specific accessible nodes.
*   `ax-node "selector"`: Inspects a specific element's a11y properties.

## Assertions & Exit Codes
Rodney is designed for CI/CD pipelines by using specific exit codes:
*   **Exit 0**: Success.
*   **Exit 1**: **Check Failed** (The command ran, but the condition was false).
*   **Exit 2**: **Error** (Bad arguments, timeout, or no browser session).

### Assertion Examples
```shell
# Check if element exists
rodney exists ".loading"

# Check visibility
rodney visible "#modal"

# Assert JS expression (Truthy or Equality)
rodney assert 'document.title' 'Home'
rodney assert 'document.querySelector("h1") !== null' -m "Header missing"
```

## Directory-Scoped Sessions
Use `--local` to create isolated browser sessions (cookies, state, profile) per project.
*   **Local State**: `./.rodney/state.json`
*   **Auto-detection**: If `./.rodney/state.json` exists, Rodney uses it automatically unless `--global` is specified.

## Proxy Support
Rodney automatically detects `HTTPS_PROXY` / `HTTP_PROXY` environment variables. Because Chrome cannot natively authenticate to proxies during HTTPS tunnels, Rodney:
1.  Launches a local forwarding proxy.
2.  Injects `Proxy-Authorization` headers.
3.  Configures Chrome to route through this local bridge.
