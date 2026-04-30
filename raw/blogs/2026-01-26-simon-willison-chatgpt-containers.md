---
source_url: https://simonwillison.net/2026/Jan/26/chatgpt-containers/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-26-simon-willison-chatgpt-containers
---

# ChatGPT Containers can now run bash, pip/npm install packages, and download files

ChatGPT's sandboxed code execution environment (formerly "Code Interpreter" or "Advanced Data Analysis") has received a massive, undocumented upgrade. It now functions more like a full-featured Linux container, supporting multiple programming languages, package installation, and direct file downloads.

## Key New Capabilities

### Direct Bash Execution
ChatGPT can now run Bash commands directly. Previously, it was limited to Python or running shell commands via Python's `subprocess` module.
- Supported Languages: Python, Node.js, Ruby, Perl, PHP, Go, Java, Swift, Kotlin, C, and C++.
- Missing: Rust (not yet supported).

### Package Installation (`pip` and `npm`)
The container can now install external libraries despite having no outbound network access. This is achieved via a custom internal proxy: `applied-caas-gateway1.internal.api.openai.org`.
- Python: Uses `pip` and `uv` configured to a private PyPI mirror.
- Node.js: Uses `npm` configured to a private registry.

### The `container.download` Tool
ChatGPT can now fetch files from the public web and save them directly to the container's filesystem (`/mnt/data/`).
- Signature:
  ```json
  {
    "url": "https://example.com/somefile.zip",
    "filepath": "/mnt/data/somefile.zip"
  }
  ```
- Security: To prevent data exfiltration via prompt injection, the tool only allows downloads for URLs that have appeared earlier in the conversation (e.g., via user input or a `web.run` search result).

## Technical Environment Details

### Proxy Configuration
Research into the environment variables reveals how OpenAI manages package installation without open internet access:
```bash
PIP_INDEX_URL=https://reader:****@packages.applied-caas-gateway1.internal.api.openai.org/.../pypi-public/simple
NPM_CONFIG_REGISTRY=https://reader:****@packages.applied-caas-gateway1.internal.api.openai.org/.../npm-public
NETWORK=caas_packages_only
```
- Infrastructure: Downloads originate from Microsoft Azure Cloud (centralus) in Des Moines, Iowa.
- User-Agent: `Mozilla/5.0 ... ChatGPT-User/1.0; +https://openai.com/bot`

## Comprehensive Tool List (Internal Signatures)

Based on a "GPT-5.2 Thinking" session, the following tools are currently available to the model:

| Tool Name | Description | Key Functions/Signatures |
| :--- | :--- | :--- |
| **`container`** | The core execution engine. | `exec(cmd: string[])`, `download(url, filepath)`, `feed_chars(session, chars)` |
| **`python`** | Private reasoning. | `python.exec(FREEFORM)` |
| **`python_user_visible`** | Code the user sees. | Generates plots, tables, and files. |
| **`web`** | Internet access. | `web.run({ search_query, open, screenshot, etc. })` |
| **`canmore`** | Canvas integration. | `create_textdoc`, `update_textdoc` (supports 30+ languages) |
| **`automations`** | Task scheduling. | `create`, `update`, `list` (via iCal VEVENT) |
| **`gmail/gcal/gcontacts`** | Workspace integration. | Read-only access to messages, events, and contacts. |
| **`file_search`** | Internal knowledge. | `msearch`, `mclick` for searching uploaded/connected sources. |
| **`guardian_tool`** | Policy enforcement. | `get_policy({ category: "election_voting" })` |

## Key Insights & Implications
- **Bash is King:** By enabling Bash, OpenAI has turned ChatGPT into a powerful coding agent similar to Claude Code. If it can run Bash, it can perform almost any computational task.
- **Safety vs. Utility:** The `container.download` tool is a significant utility boost, allowing the AI to grab datasets and process them immediately. The "URL must be seen first" restriction is a critical defense against prompt injection.
- **Documentation Gap:** Despite these massive changes, OpenAI has not updated its official release notes.
- **Future Hints:** Environment variables mention registries for Go, Maven, Gradle, Cargo, and Docker, suggesting support for these ecosystems may be imminent.
