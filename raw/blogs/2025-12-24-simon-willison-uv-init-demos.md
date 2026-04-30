---
source_url: https://simonwillison.net/2025/Dec/24/uv-init-demos/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-24-simon-willison-uv-init-demos
---

# uv-init-demos

**[uv-init-demos](https://github.com/simonw/uv-init-demos)**. `uv` has a useful `uv init` command for setting up new Python projects, but it comes with a bunch of different options like `--app` and `--package` and `--lib` and I wasn't sure how they differed.

So I created this GitHub repository which demonstrates all of those options, generated using this [update-projects.sh](https://github.com/simonw/uv-init-demos/blob/main/update-projects.sh) script ([thanks, Claude](https://gistpreview.github.io/?9cff2d3b24ba3d5f423b34abc57aec13)) which will run on a schedule via GitHub Actions to capture any changes made by future releases of `uv`.

Posted 24th December 2025 at 10:05 pm

Tags: projects, python, github-actions, git-scraping, uv
