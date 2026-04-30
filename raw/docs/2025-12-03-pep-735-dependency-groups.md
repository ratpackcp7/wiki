---
source_url: https://peps.python.org/pep-0735/
fetched: 2026-04-11T08:15:00-05:00
fetcher: on-demand
content_type: docs
slug: pep-735-dependency-groups
---

# PEP 735 – Dependency Groups in pyproject.toml

**Status:** Final (Accepted Oct 2024)
**Author:** Stephen Rosen

A standardized mechanism for storing non-redistributable requirements (like development or test dependencies) in pyproject.toml.

## Core Specification

PEP 735 introduces a new top-level table, `[dependency-groups]`, where each key is a group name and each value is a list of requirements.

### Syntax

```toml
[dependency-groups]
test = ["pytest>7", "coverage"]
docs = ["sphinx", "sphinx-rtd-theme"]
typing = ["mypy", "types-requests"]
# Using "include-group" to extend other groups
typing-test = [
    {include-group = "test"},
    {include-group = "typing"},
    "useful-types"
]
```

### Key Differences from Extras

| Feature | requirements.txt | project.optional-dependencies (Extras) | Dependency Groups |
| :--- | :--- | :--- | :--- |
| Standardization | No (pip-specific) | Yes | Yes |
| Published? | No | Yes (in Metadata) | No |
| Installs Self? | No | Yes (installs package + deps) | No |
| Non-Package Support | Yes | No (requires [project] table) | Yes |

**Key Insight:** "Dependency Groups are not Hidden Extras." Unlike extras, installing a dependency group does not imply installing the package itself or its core dependencies.

## Use with uv

uv treats dependency groups as first-class. The `dev` group is special — `uv run` always installs dev group dependencies automatically.

```shell
uv add --dev pytest
uv run pytest
uv run --group test pytest
```

## Validation Strategy

Tools SHOULD NOT eagerly validate all groups in the table. Tools SHOULD only error when a user attempts to use/evaluate a group containing unrecognized data (lazy validation).

## Rejected Ideas

- Path dependencies (no cross-tool standard yet)
- Including the project via `{include-project = true}`
- Including groups in `[project.dependencies]`
