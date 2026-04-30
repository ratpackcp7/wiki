---
source_url: https://simonwillison.net/2026/Jan/1/gisthost/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-01-simon-willison-gisthost
---

# Introducing gisthost.github.io

Simon Willison introduces [gisthost.github.io](https://gisthost.github.io/), a fork of the long-standing `gistpreview.github.io` tool. It allows users to render HTML files stored in GitHub Gists directly in the browser.

---

### Background: How Gist Preview Works

GitHub Gists serve files as plain text by default to prevent security risks, using headers like `Content-Type: text/plain` and `X-Content-Type-Options: nosniff`. However, they also include `Access-Control-Allow-Origin: *`, which allows external sites to fetch the content via JavaScript.

The "genius" of the original `gistpreview` tool is that it uses GitHub's own infrastructure (GitHub Pages and the Gist API) to bypass the plain-text restriction.

#### Key Technical Implementation

The tool fetches Gist content via the GitHub API and uses `document.write()` to render it. This method is preferred over `innerHTML` because it ensures inline scripts are executed.

```javascript
// Core logic from the original gistpreview
fetch('https://api.github.com/gists/' + gistId)
.then(function (res) {
  return res.json().then(function (body) {
    if (res.status === 200) {
      return body;
    }
    throw new Error('Gist <strong>' + gistId + '</strong>, ' + body.message.replace(/\(.*\)/, ''));
  });
})
.then(function (info) {
  // ... logic to find index.html or the first file ...
  var content = info.files[fileName].content;
  document.write(content);
})
```

---

### Improvements in gisthost.github.io

Willison forked the project to modernize the codebase and address two specific bugs:

*   **Substack URL Mangling:** Substack adds tracking parameters (e.g., `?gist_id=&utm_source=substack`) that break the original tool's Gist ID parsing. The fork now correctly parses the ID by reading only up to the equals sign.
*   **Truncated Files:** The standard GitHub Gist JSON API truncates large files. `gisthost` includes logic to handle these larger files (specifically useful for long Claude Code transcripts).
*   **Code Cleanup:** Removed legacy dependencies including jQuery, Bootstrap, and old polyfills. The entire tool is now inlined into a [single index.html file](https://github.com/gisthost/gisthost.github.io/blob/main/index.html).

---

### Actionable Use Case: Claude Code Transcripts

The primary driver for these updates was the [claude-code-transcripts](https://github.com/simonw/claude-code-transcripts) project. This CLI tool exports HTML versions of Claude Code sessions.

**Usage Example:**
To export a session and host it immediately via Gist Host:
```bash
uvx claude-code-transcripts web --gist
```
*Note: As of version 0.5, this tool defaults to using gisthost.github.io.*

---

### Key Facts & Figures

*   **Original Tool:** `gistpreview.github.io` (last updated ~10 years ago).
*   **New Tool:** `gisthost.github.io`.
*   **Hosting:** Entirely hosted on GitHub Pages; data fetched from GitHub Gist API.
*   **CORS Support:** Gists provide `Access-Control-Allow-Origin: *`, making this architecture possible.

---

### Primary source: gisthost.github.io index.html

The application is contained entirely within a single `index.html` file using vanilla JavaScript and CSS.

**URL Structure:**
*   Base: `https://gisthost.github.io/?[GIST_ID]`
*   Specific File: `https://gisthost.github.io/?[GIST_ID]/[FILE_NAME]`

**Handling Truncated Content:**
GitHub's API truncates large files. The script fetches the full raw content if the initial API response is incomplete:

```javascript
// Fetch full content if truncated
if (fileInfo.truncated && fileInfo.raw_url) {
  return fetch(fileInfo.raw_url)
    .then(function (res) {
      if (!res.ok) throw new Error('Failed to fetch full content');
      return res.text();
    });
} else {
  return fileInfo.content;
}
```

**Styling:** Uses a system-font-based design with max-width container of 680px and responsive form elements.

---

### claude-code-transcripts

Python-based tool to convert Claude Code session files (JSON/JSONL) into clean, mobile-friendly, paginated HTML transcripts.

**Installation:** `uv tool install claude-code-transcripts`

**Commands:** `local` (from ~/.claude/projects), `web` (via Claude API — currently broken per issue #77), `json` (from file/URL), `all` (archive all sessions).

**Key option:** `--gist` uploads to GitHub Gist and provides a preview URL via gisthost.github.io.
