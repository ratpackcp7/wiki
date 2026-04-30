---
source_url: https://simonwillison.net/2025/Dec/3/dependency-groups/
fetched: 2026-04-11T08:15:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-03-simon-willison-dependency-groups
---

# TIL: Dependency groups and uv run

TIL [Dependency groups and uv run](https://til.simonwillison.net/uv/dependency-groups)
— I've adopted a new (to me) pattern for my Python projects to make them easier to hack on using `uv run`. I'm using a [PEP 735 dependency group](https://peps.python.org/pep-0735/) called `dev` to declare my development dependencies - in particular `pytest` - such that running `uv run pytest` executes the tests for my project without me having to even think about setting up a virtual environment first.

Posted 3rd December 2025 at 4:55 am
