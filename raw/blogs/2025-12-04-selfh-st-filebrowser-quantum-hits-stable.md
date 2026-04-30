---
source_url: https://selfh.st/post/filebrowser-quantum-hits-stable/
fetched: 2025-12-04
fetcher: blogwatcher
content_type: blog
slug: 2025-12-04-selfh-st-filebrowser-quantum-hits-stable
---

# FileBrowser Quantum Hits Stable Release

**FileBrowser Quantum** is an ambitious evolution of the original [filebrowser.org](https://filebrowser.org/) project, which entered maintenance-only mode earlier this year. Developed by Graham Steffaniak, the project has transitioned from a casual development cycle to a professional workflow featuring a dedicated **Stable** release track.

## Key Features & Improvements
FileBrowser Quantum aims to maintain the simplicity of the original while adding modern, enterprise-grade features:

*   **Office Integration:** Full support for **OnlyOffice** editing.
*   **Advanced Authentication:** Includes **Two-Factor (2FA)** and **OIDC Single-Sign-On (SSO)**.
*   **Access Control:** A granular system for file access that integrates with OIDC groups.
*   **Enhanced Sharing:** Highly customizable sharing controls and options.
*   **Performance:** Blazing fast search and folder size calculations via filesystem indexing.
*   **UI/UX:** Responsive interface with modern animations, customizable sidebars, and a built-in **Duplicate File Finder**.
*   **Developer Friendly:** Includes a friendly API experience with **Swagger documentation**.

## Installation & Versions
The application supports **Windows, Linux, macOS, FreeBSD, and Docker**.

> "Installation is as simple as downloading the appropriate release (or Docker image) and running the program with your custom `config.yaml`."

### Release Tracks:
*   **Stable Version:** Recommended for most users who want a predictable, bug-free experience.
*   **Beta Version:** For users who want the latest features and are willing to provide feedback via GitHub Discussions or Issues.

## Considerations & Limitations
While powerful, FileBrowser Quantum may not fit every use case:

*   **Resource Usage:** Because it indexes the filesystem for fast search, it can use **more memory** than the original. (Note: Indexing can be disabled for specific sources or entirely).
*   **Missing Features:** It does **not** currently support:
    *   Command runners (removed from original)
    *   Mobile companion apps
    *   WebDAV, Collabra, or FTP (not planned for the immediate future)

## Interface Highlights
*   **Customizable Sidebar:** Tailor the navigation to your workflow.
*   **Gallery View:** Includes folder previews for visual media management.
*   **Context Menus:** Modern light/dark mode support with intuitive right-click actions.
*   **Duplicate Finder:** Built-in tool to identify and manage redundant files.

## Important Links
*   **Official Documentation:** [filebrowserquantum.com/en/docs](https://filebrowserquantum.com/en/docs/getting-started/)
*   **GitHub Repository:** [gtsteffaniak/filebrowser](https://github.com/gtsteffaniak/filebrowser)
*   **Community:** [GitHub Discussions](https://github.com/gtsteffaniak/filebrowser/discussions)
