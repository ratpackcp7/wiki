---
source_url: https://poethepoet.natn.io/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: docs
slug: 2025-12-16-poe-the-poet
---

# Poe the Poet — Task Runner for Python

"Batteries included" task runner for the Python ecosystem. Define tasks in pyproject.toml, execute within the project's virtualenv (Poetry, uv, etc.).

## Key Features
- Works with Poetry and uv
- Task types: cmd, shell, expr, script
- Auto-detects managed virtualenvs
- Supports .env files and env var referencing
- Tasks run in sequence, parallel, or as DAG
- Shell completion, self-documenting tasks
- Named CLI arguments for tasks

## Quick Start
```bash
pipx install poethepoet
```

```toml
[tool.poe.tasks]
test = "pytest --cov=my_app"
livehtml = "sphinx-autobuild -b html docs docs/_build"
```

```bash
poe test -v
```

## Environment Variables
- $POE_ROOT: path to project root
- $POE_PWD: original working directory

## Compatibility
- Python 3.10 – 3.14
- MIT license
