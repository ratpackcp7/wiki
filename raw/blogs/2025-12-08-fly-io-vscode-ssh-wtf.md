---
source_url: https://fly.io/blog/vscode-ssh-wtf/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-08-fly-io-vscode-ssh-wtf
---

# VSCode's SSH Agent Is Bananas

Thomas Ptacek on VSCode's remote SSH editing feature.

Unlike Emacs Tramp (which lives off the land on remote connection), VSCode mounts a "full-scale invasion": runs Bash snippet stager, downloads agent including binary Node installation. Agent runs over port-forwarded SSH via WebSockets. Can wander filesystem, edit arbitrary files, launch shell PTY processes, persist itself.

In security-world, there's a name for tools that work this way (implied: RAT/malware-like).

Recommendation: Be nervous about VSCode-remote-editing on dev servers, "apoplectic" if used on production during incidents.

Note: Doesn't affect Fly.io's custom connection to Fly Machines, but worth knowing.
