---
source_url: https://simonwillison.net/2025/Dec/16/poe-the-poet/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-16-simon-willison-poe-the-poet
---

# Poe the Poet

**[Poe the Poet](https://poethepoet.natn.io/)**. I was looking for a way to specify additional commands in my `pyproject.toml` file to execute using `uv`. There's an [enormous issue thread](https://github.com/astral-sh/uv/issues/5903) on this in the `uv` issue tracker (300+ comments dating back to August 2024) and from there I learned of several options including this one, Poe the Poet.

It's neat. I added it to my [s3-credentials](https://github.com/simonw/s3-credentials) project just now and the following now works for running the live preview server for the documentation:

    uv run poe livehtml

Here's the snippet of TOML I added to my `pyproject.toml`:

[dependency-groups]
test = [
    "pytest",
    "pytest-mock",
    "cogapp",
    "moto>=5.0.4",
]
docs = [
    "furo",
    "sphinx-autobuild",
    "myst-parser",
    "cogapp",
]
dev = [
    {include-group = "test"},
    {include-group = "docs"},
    "poethepoet>=0.38.0",
]

[tool.poe.tasks]
docs = "sphinx-build -M html docs docs/_build"
livehtml = "sphinx-autobuild -b html docs docs/_build"
cog = "cog -r docs/*.md"

Since `poethepoet` is in the `dev=` dependency group any time I run `uv run ...` it will be available in the environment.
