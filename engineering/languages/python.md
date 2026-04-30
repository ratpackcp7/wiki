---
title: Python
created: 2026-04-11
updated: 2026-04-11
type: language
tags: [python, tooling, astral, uv, ruff, ty, security, pep735, dependency-groups, poethepoet]
sources:
  - url: https://astral.sh/blog/open-source-security-at-astral
    fetched: 2026-04-11
  - url: https://github.com/astral-sh/uv
    fetched: 2026-04-11
  - url: https://peps.python.org/pep-0735/
    fetched: 2026-04-11
  - url: https://til.simonwillison.net/uv/dependency-groups
    fetched: 2026-04-11
  - url: https://astral.sh/blog/ty
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/16/ty/
    fetched: 2026-04-11
  - url: https://poethepoet.natn.io/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/16/poe-the-poet/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: medium
confidence: verified
---

# Python

## Tooling (Astral stack)

Chris uses the Astral ecosystem exclusively:

| Tool | Role | Status |
|------|------|--------|
| **uv** | Package manager (replaces pip/poetry) | Primary |
| **ruff** | Linter + formatter (replaces flake8/black) | Primary |
| **ty** | Type checker (replaces mypy) | Beta (2025-12-16) — 10-60x faster than mypy/Pyright |

### Key concepts

1. **`uv` is the default** — never `pip install` directly in project venvs. Use `uv pip install` or `uv add`. Virtualenvs via `uv venv`, not `python -m venv`.

2. **Ruff for everything** — linting AND formatting. Don't run flake8 or black alongside. `ruff check --fix` + `ruff format`.

3. **Pin Python version in `pyproject.toml`** — `requires-python = ">=3.12"` or whatever the project needs. uv respects this.

4. **Never `--break-system-packages`** — always use venvs. This is a Chris preference enforced across all projects.

## Supply chain security (Astral practices, 2026-04-08)

Astral published their security posture for uv/ruff/ty. Key practices applicable to any Python project using their tools:

### CI/CD hardening

- **Pin GitHub Actions to full commit SHAs**, not tags. Tools: [zizmor](https://github.com/zizmorcore/zizmor) for auditing, [pinact](https://github.com/suzuki-shunsuke/pinact) for pinning.
- **Ban `pull_request_target` and `workflow_run`** triggers org-wide — these are the most exploited GitHub Actions vectors. Use job summaries or GitHub Apps instead.
- **Start every workflow with `permissions: {}`**, broaden per-job only.
- **Use deployment environments** with environment-specific secrets (not repo-wide).
- **Release builds must not use cache** — prevents GitHub Actions cache poisoning attacks.

### Release integrity

- **Trusted Publishing** (OIDC-based) for PyPI/crates.io — eliminates long-lived credentials.
- **Sigstore attestations** link artifacts to the workflow that built them.
- **Immutable releases** on GitHub prevent attackers from swapping published binaries.
- **Two-person approval** for release environments.

### Dependency management

- **`uv` supports dependency cooldowns natively** — delay updates until new releases are vetted by community.
- **Minimize dependencies** — eliminate rarely-used compression schemes, avoid binary blobs.
- **Active upstream support** via Astral OSS Fund.

## Testing

### pytest subtests (9.0+)

pytest 9.0.0 (released 2025-11-08) merged the `pytest-subtests` plugin into core. Subtests are a dynamic alternative to `@pytest.mark.parametrize` — values are computed at runtime rather than at collection time.

```python
# Parametrize: static, known at collection
@pytest.mark.parametrize("setting", app.SETTINGS)
def test_settings_are_documented(headings, setting):
    assert setting.name in headings

# Subtests: dynamic, computed at execution
def test_settings_are_documented(headings, subtests):
    for setting in app.SETTINGS:
        with subtests.test(setting=setting.name):
            assert setting.name in headings
```

**When to use subtests over parametrize:**
- Test data is generated at runtime (from setup code, DB queries, etc.)
- Slightly faster execution (no per-param test collection)
- Single setup shared across all iterations

**When to keep parametrize:**
- Static decision tables / known input sets
- Need `--last-failed` to target individual params (plugins can't target subtests)
- Need individual test identity in CI reports

**Reporting:** Failures show as `SUBFAILED[label] (key=value)`. Use `-v` to see passed subtests. Type hint: `subtests: pytest.Subtests`.

## Conventions

- **Project layout:** Standard `src/` layout with `pyproject.toml` at root. uv manages the lockfile (`uv.lock`).
- **Testing:** `pytest` + `pytest-asyncio` for async code. `ruff` for linting before commits.
- **Type hints:** Expected on all function signatures. `ty` will enforce when stable; for now, best-effort with ruff's type-aware rules.

## Dependency management (PEP 735)

Use **dependency groups** (`[dependency-groups]` in `pyproject.toml`) for non-redistributable deps like dev/test tools. This is a PEP 735 feature, finalized Oct 2024.

### Why not extras?

Extras (`[project.optional-dependencies]`) are published metadata — they install the package itself. Dependency groups are local-only and never included in built distributions. They're the right place for `pytest`, `ruff`, `sphinx`, etc.

### Pattern: `dev` group

The `dev` group is special in uv — `uv run` always installs dev group deps automatically:

```toml
[dependency-groups]
test = ["pytest>7", "pytest-asyncio"]
docs = ["sphinx"]
dev = [
    {include-group = "test"},
    {include-group = "docs"},
]
```

```shell
uv add --dev pytest          # adds to dev group
uv run pytest                # auto-installs dev deps, runs pytest
uv run --group test pytest   # run with specific group only
```

### Nested groups with `include-group`

Compose groups from subgroups. Cycles are forbidden; tools should not deduplicate — if a package appears with conflicting constraints, the tool resolves it as a standard conflict.

### Getting started from scratch

```shell
mkdir my-lib && cd my-lib
uv init --lib
uv add --dev pytest
uv run pytest
```

The `[build-system]` section (added by `uv init --lib`) signals uv treats the directory as an editable package. Without it, set `tool.uv.package = true` explicitly.

## Task runners (Poe the Poet)

For defining project tasks in `pyproject.toml` (like Makefile targets but integrated with uv):

```toml
[tool.poe.tasks]
test = "pytest --cov=my_app"
livehtml = "sphinx-autobuild -b html docs docs/_build"
```

Usage: `uv run poe test` — poethepoet lives in the `dev` dependency group and is always available via `uv run`.

Primary use case: running dev workflows (docs servers, test runners, build scripts) without a Makefile or shell scripts. Integrates with PEP 735 dependency groups natively.

## Gotchas

1. **uv.lock is authoritative** — never hand-edit. If conflicts arise, `uv lock --upgrade` regenerates.
2. **ruff format ≠ black** — defaults differ slightly (line length 88 by default, same as black, but some edge cases differ). Run `ruff format` consistently, don't mix formatters.
3. **zizmor catches what humans miss** — run `zizmor .` on any repo with GitHub Actions before assuming CI is secure.

## Chris's preferences

- See `chris-preferences.md#Python` for Chris's Python stance.
- uv, ruff, ty — no pip, no flake8, no mypy. Confirmed from project conventions.
- Complete scripts, not snippets.
- Delta from best practice: Chris's projects are small-team/solo, so some enterprise CI hardening (two-person release approval, deployment environments) may be overkill. Apply the high-value items (SHA pinning, permissions lockdown, trusted publishing).
- Last sync with chris-preferences: 2026-04-11

## Recent changes

- 2025-12-05: pytest 9.0.0 subtests feature added to Testing section. ([docs](https://docs.pytest.org/en/stable/how-to/subtests.html), [Simon Willison TIL](https://simonwillison.net/2025/Dec/5/til-pytest-subtests/))
- 2025-12-16: Astral releases ty beta — Python type checker and LSP, 10-60x faster than mypy/Pyright. Updated tooling table. ([Astral blog](https://astral.sh/blog/ty), [Simon Willison](https://simonwillison.net/2025/Dec/16/ty/))
- 2025-12-16: Poe the Poet task runner added — define tasks in pyproject.toml, run via `uv run poe <task>`. ([docs](https://poethepoet.natn.io/), [Simon Willison](https://simonwillison.net/2025/Dec/16/poe-the-poet/))
- 2026-04-11: Page created. Astral security practices ingested from their blog post.
- 2026-04-11: PEP 735 dependency groups + uv run pattern added (source: PEP 735 spec, Simon Willison TIL 2025-12-03).

## Sources

- [Open source security at Astral](https://astral.sh/blog/open-source-security-at-astral) — William Woodruff, 2026-04-08
- [zizmor](https://github.com/zizmorcore/zizmor) — GitHub Actions security auditor
- [pinact](https://github.com/suzuki-shunsuke/pinact) — Action SHA pinning tool
- [dependency cooldowns](https://blog.yossarian.net/2025/11/21/We-should-all-be-using-dependency-cooldowns) — blog post on the pattern
- [PEP 735](https://peps.python.org/pep-0735/) — Dependency Groups in pyproject.toml (Final, Oct 2024)
- [Dependency groups and uv run](https://til.simonwillison.net/uv/dependency-groups) — Simon Willison TIL, 2025-12-03
- [pytest subtests docs](https://docs.pytest.org/en/stable/how-to/subtests.html) — pytest 9.0+ core feature
- [Subtests in pytest 9.0.0+](https://til.simonwillison.net/pytest/subtests) — Simon Willison TIL, 2025-12-05
