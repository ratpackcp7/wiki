---
source_url: https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-23
slug: extract-pdf-text-in-your-browser-with-liteparse-for-the-web
---

# Summary: Extract PDF text in your browser with LiteParse for the web

Simon Willison has developed a browser-based version of **LiteParse**, an open-source tool by LlamaIndex designed for high-quality PDF text extraction. This implementation allows users to parse PDFs entirely client-side, ensuring privacy and ease of use.

## 🚀 The Project: LiteParse for the Web
The original LiteParse is a Node.js CLI tool used primarily by AI agents. Willison ported its core functionality to the browser using **PDF.js** and **Tesseract.js**.

*   **Live Demo:** [https://simonw.github.io/liteparse/](https://simonw.github.io/liteparse/)
*   **Core Value:** It performs "spatial text parsing," using heuristics to detect multi-column layouts and return text in a sensible linear flow, rather than just dumping raw characters.
*   **Privacy:** All processing happens in the user's browser; **nothing leaves the machine.**
*   **Features:**
    *   Toggleable OCR (Optical Character Recognition).
    *   Option to render page screenshots.
    *   Outputs both extracted **Text** and structured **JSON** (including dimensions, position, and font data).

## 🛠️ Development Process: "Vibe Coding" with AI
Willison built the entire web application using **Claude Code** and **Claude Opus 4.7**, describing the process as "pure vibe coding"—writing code without manually reviewing or even looking at the individual lines of HTML/TypeScript.

### Key Workflow & Tools
*   **Initial Research:** Started on an iPhone using the Claude app to test the original library via GitHub cloning and npm installation.
*   **Implementation:** Switched to **Claude Code** on a laptop to execute a detailed `plan.md`.
*   **Development Strategy:**
    *   Used **Red/Green TDD** (Test-Driven Development) via Playwright.
    *   Utilized `npx vite` for a development server with live-reloading.
    *   Requested "small commits along the way" to improve agent effectiveness and code reviewability.
*   **Deployment:** Automated via **GitHub Actions** to deploy the Vite app to **GitHub Pages**.
*   **Verification:** To ensure the AI didn't "cheat" (e.g., leaving `TODO` comments instead of real code), Willison used **OpenAI Codex (GPT-5.5)** to audit the architectural differences between the Node.js and Web versions.

### Key Prompting Examples
> `Get this working as a web app. index.html, when loaded, should render an app that lets users open a PDF in their browser and select OCR or non-OCR mode and have this run. Read notes.md for initial research on this problem, then write out plan.md with your detailed implementation plan`

> `Look at the web/ folder - set up GitHub actions for this repo such that any push runs the tests, and if the tests pass it then does a GitHub Pages deploy...`

## 💡 Insights on "Vibe Coding"
Willison defines **vibe coding** as using AI to write code without the developer reviewing or caring about the underlying syntax. He notes that while this project was "pure vibe coding," it was successful because:
1.  **Low Blast Radius:** As a static site, bugs are non-critical.
2.  **Security by Design:** Client-side processing eliminates the need for a security audit.
3.  **Engineering Intent:** Success required high-level engineering decisions (e.g., identifying that porting to the browser was the right move).

**Total "Build It" Time:** 59 minutes.