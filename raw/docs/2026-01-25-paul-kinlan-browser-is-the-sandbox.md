---
source_url: https://aifoc.us/the-browser-is-the-sandbox/
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-25-paul-kinlan-browser-is-the-sandbox
---

# The Browser is the Sandbox: Agentic AI and Web Security

**Author:** Paul Kinlan
**Date:** January 25, 2026
**Core Thesis:** The modern web browser, refined over 30 years to run untrusted code, provides a superior and safer environment for "agentic" AI tasks (like file manipulation and automation) compared to giving CLI tools unfettered access to a local filesystem.

## 1. The Problem: The Risk of Agentic Loops
Current AI CLI tools (like Claude Code) often run with broad permissions on a user's machine.
*   **The Risk:** Giving an autonomous system unfettered access can lead to destructive actions or data exfiltration.
*   **The Current Solution:** Anthropic uses a "sandbox experiment" to create a locked-down VM restricted to a specific directory.
*   **The Proposed Solution:** Leverage the browser's existing security primitives to create a "chroot-like" environment for AI.

## 2. The Three Pillars of Browser Sandboxing

### A. The File System
The browser offers three layers of access, allowing for a balance of utility and safety:
1.  **Read-only:** `<input type="file" webkitdirectory>` for folder selection.
2.  **Origin-private filesystem:** A private storage area accessible only to the current site.
3.  **Full Access (File System Access API):** Provides a handle to a specific folder.
    *   *Insight:* This acts as a `chroot` environment; the AI can read/write within the folder but cannot "escape" to parent or sibling directories.

### B. The Network
To prevent data exfiltration, the network must be strictly managed.
*   **Content Security Policy (CSP):** The primary tool for restriction.
*   **Strategy:** Use `default-src 'none'` and selectively whitelist only the LLM provider (e.g., Anthropic or OpenAI).
*   **The "Double Iframe" Technique:** A method to isolate untrusted LLM-generated content. An outer frame defines the policy, and an inner frame holds the content.

**Code Snippet: The Double Iframe Policy Firewall**
```html
<!-- OUTER FRAME: Defines the 'No Network' Policy -->
<iframe
  id="jail"
  sandbox="allow-scripts"
  srcdoc="
    <meta http-equiv='Content-Security-Policy' content='default-src &quot;none&quot;; script-src &quot;unsafe-inline&quot;; style-src &quot;unsafe-inline&quot;'>

    <!-- INNER FRAME: Holds the content -->
    <iframe sandbox='' srcdoc='
        <h1>LLM Generated Content</h1>
        <script>
            // This fetch will fail immediately due to default-src none
            fetch(&quot;https://evil.com&quot;);
        </script>
    '></iframe>
">
</iframe>
```

### C. The Execution Environment
Running untrusted code (tools) requires isolation from the UI thread.
*   **Web Workers:** Isolate code execution and can inherit strict CSPs.
*   **WebAssembly (WASM):** Allows running complex software (like SQLite or ffmpeg) safely. WASM is designed to execute untrusted binaries without compromising the host.

## 3. Practical Implementation: Co-do
The author developed **[Co-do](http://co-do.xyz/)**, an AI-powered file manager that runs entirely in the browser.

**Key Features:**
*   **Boundary Control:** Uses File System Access API to lock the AI into one folder.
*   **Network Lockdown:** CSP blocks all traffic except to specific AI API endpoints.
*   **Output Guarding:** Renders AI responses in sandboxed iframes with `allow-scripts` disabled.
*   **WASM Tools:** Custom tools (like SHA256 hashing) run in isolated Web Workers that can be terminated if they loop infinitely.

## 4. Critical Gaps and Limitations
Despite the browser's strengths, several "leaks" and hurdles remain:
*   **Third-Party Trust:** You are still sending file data to the LLM provider (Anthropic/OpenAI/Google).
*   **Downstream Malware:** An AI could create a `.docx` with a malicious macro. The browser is safe, but the file is dangerous if opened later in Word.
*   **The `csp` Attribute:** Currently only supported in Blink-based browsers (Chrome/Edge).
*   **No Undo:** Destructive operations (deleting a file) are permanent unless the user has a separate backup.
*   **Permission Fatigue:** The constant tension between security (asking every time) and UX (blanket permissions).

## 5. Future Requirements for Browser Vendors
To fully realize the "Browser as Sandbox" vision, Kinlan suggests:
1.  **Universal `csp` attribute support** for iframes across all engines (WebKit/Gecko).
2.  **Better Iframe Sizing:** A way to size frames to content without requiring `allow-same-origin`.
3.  **Fenced Frames:** Wider adoption of Chrome's "Fenced Frames" to disable network access entirely via `disableUntrustedNetwork()`.
4.  **Reduced Overhead:** Iframes are "heavy"; a lighter-weight `<sandbox>` element would be more efficient for streaming AI content.
