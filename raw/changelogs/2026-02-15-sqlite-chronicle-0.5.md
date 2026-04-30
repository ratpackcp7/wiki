---
source_url: https://github.com/simonw/sqlite-chronicle/releases/tag/0.5
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2026-02-15-sqlite-chronicle-0.5
---

# sqlite-chronicle 0.5

Released 15 Feb 2026 by simonw

[`87b9b91`](https://github.com/simonw/sqlite-chronicle/commit/87b9b91c42974b72f015758d0291b583225941f3)

- `INSERT OR REPLACE INTO` now works correctly. [#20](https://github.com/simonw/sqlite-chronicle/issues/20)
- Switched to `[dependency-groups]` for dev dependencies, so `uv run pytest` now runs the tests against a fresh checkout.
- New utility functions `disable_chronicle(), is_chronicle_enabled(), and list_chronicled_tables()`. [#18](https://github.com/simonw/sqlite-chronicle/pull/18)
- CLI tool for disabling chronicle: `python -m sqlite_chronicle db.sqlite table --disable`.
