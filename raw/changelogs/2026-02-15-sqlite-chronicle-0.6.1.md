---
source_url: https://github.com/simonw/sqlite-chronicle/releases/tag/0.6.1
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2026-02-15-sqlite-chronicle-0.6.1
---

# sqlite-chronicle 0.6.1

Released 15 Feb 2026 by simonw (latest)

[`3a4df4a`](https://github.com/simonw/sqlite-chronicle/commit/3a4df4aea7333c0d9e1573ea72aca79746c68af8)

- If you delete a record and then insert a new record that reuses the same primary keys the `__added_ms` recorded for that new record will now record when it was re-created, not when the original was created. [#24](https://github.com/simonw/sqlite-chronicle/issues/24)
