---
source_url: https://simonwillison.net/2025/Dec/10/dark-mode/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-10-simon-willison-dark-mode
---

# Dark Mode

Simon Willison added dark mode to his blog using Claude Code, with CSS properties, `@media (prefers-color-scheme: dark)` and a `data-theme="dark"` attribute. Prompt:

> Add a dark theme which is triggered by user media preferences but can also be switched on using localStorage - then put a little icon in the footer for toggling it between default auto, forced regular and forced dark mode

Toggle in footer switches between auto, forced-light, and forced-dark. CSS duplication was fixed with Cog.

PR: https://github.com/simonw/simonwillisonblog/pull/572/files
Cog fix: https://github.com/simonw/simonwillisonblog/commit/d4bc7573775960a630145a287d854b8569da6f72
