---
source_url: https://simonwillison.net/2025/Dec/3/til-dependency-groups-and-uv-run/
fetched: 2026-04-11T08:15:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-03-simon-willison-til-dependency-groups-and-uv-run
---

# TIL: Dependency groups and uv run (link post)

3rd December 2025 - Link Blog

**TIL: Dependency groups and uv run** — I wrote up the new pattern I'm using for my various Python project repos to make them as easy to hack on with `uv` as possible. The trick is to use a [PEP 735 dependency group](https://peps.python.org/pep-0735/) called `dev`, declared in pyproject.toml like this:

    [dependency-groups]
    dev = ["pytest"]
    
With that in place, running `uv run pytest` will automatically install that development dependency into a new virtual environment and use it to run your tests.

This means you can get started hacking on one of my projects (here [datasette-extract](https://github.com/datasette/datasette-extract)) with just these steps:

    git clone https://github.com/datasette/datasette-extract
    cd datasette-extract
    uv run pytest

I also split my [uv TILs out](https://til.simonwillison.net/uv) into a separate folder. This meant I had to setup redirects for the old paths, so I had [Claude Code help build me](https://gistpreview.github.io/?f460e64d1768b418b594614f9f57eb89) a new plugin called [datasette-redirects](https://github.com/datasette/datasette-redirects) and then [apply it to my TIL site](https://github.com/simonw/til/commit/5191fb1f98f19e6788b8e7249da6f366e2f47343), including [updating the build script](https://gistpreview.github.io/?d78470bc652dc257b06474edf3dea61c) to correctly track the creation date of files that had since been renamed.

Tags: packaging, python, ai, til, uv, coding-agents, claude-code
