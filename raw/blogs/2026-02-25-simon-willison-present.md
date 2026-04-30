---
source_url: https://simonwillison.net/2026/Feb/25/present/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-25-simon-willison-present
---

# I vibe coded my dream macOS presentation app

Simon Willison "vibe coded" a custom macOS presentation app called **Present** in approximately 45 minutes for a talk at Social Science FOO Camp. The app addresses a specific pain point: the instability of using browser tabs as presentation slides.

## The Problem & Solution
Willison often presents using a sequence of web pages. While flexible, this method is risky; a browser crash can lose the entire deck.

**Present.app** solves this by:
*   **Format:** A native Swift/SwiftUI app (355KB total, 76KB compressed).
*   **Functionality:** A sequence of URLs acting as slides.
*   **Safety:** Automatically saves the URL list; if the app crashes, the state is restored upon restart.
*   **Portability:** Presentations are saved as simple `.txt` files (newline-delimited URLs).

### The Starting Prompt
> "Build a SwiftUI app for giving presentations where every slide is a URL. The app starts as a window with a webview on the right and a UI on the left for adding, removing and reordering the sequence of URLs. Then you click Play in a menu and the app goes full screen and the left and right keys switch between URLs"

## Key Features
*   **Editing Mode:** A sidebar UI for managing the URL sequence.
*   **Presentation Mode:** Full-screen view with arrow-key navigation, font size adjustment, and scrolling capabilities.
*   **Remote Control:** A built-in web server (listening on `0.0.0.0:9123`) allows control via a mobile phone.
    *   **Connectivity:** Uses **Tailscale** to bypass local Wi-Fi restrictions, allowing the phone to control the laptop from anywhere.
    *   **Mobile UI:** Includes Prev/Next buttons, a "Start" button, and a unique **touch-enabled scroll bar** to move the webpage on the laptop screen from the phone.

## Technical Implementation
Willison used **Claude Code** to generate the app. Notably, the AI implemented the remote control web server using raw socket programming rather than a library.

### Code Snippet: Minimal HTTP Parser
```swift
private func route(_ raw: String) -> String {
    let firstLine = raw.components(separatedBy: "\r\n").first ?? ""
    let parts = firstLine.split(separator: " ")
    let path = parts.count >= 2 ? String(parts[1]) : "/"

    switch path {
    case "/next":
        state?.goToNext()
        return jsonResponse("ok")
    case "/prev":
        state?.goToPrevious()
        return jsonResponse("ok")
```

## Agentic Engineering Insights
Willison highlighted a specific pattern used during this project: **Linear Walkthroughs**. He asked the AI model to provide a step-by-step explanation of the entire generated codebase to understand how it functioned without having to manually audit every file.

### Key Takeaways on "Vibe Coding"
1.  **Language Agnosticism:** Swift was the right tool for a native macOS experience, even though Willison does not know the language.
2.  **Zero-IDE Development:** The entire app was built without opening Xcode once (relying on command-line tools and AI).
3.  **Utility over Perfection:** The code is "clunky" and contains minor vulnerabilities (like CSRF on the local server), but it is perfectly functional for its specific, personal use case.
4.  **Expertise Still Matters:** While the AI did the heavy lifting, Willison's existing technical knowledge (Tailscale, networking, basic Swift environment setup) was essential to guide the process.

## Resources
*   **GitHub Repository:** [simonw/present](https://github.com/simonw/present)
*   **Pattern Guide:** [Linear Walkthroughs](https://simonwillison.net/guides/agentic-engineering-patterns/linear-walkthroughs/)
