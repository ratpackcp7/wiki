---
source_url: https://simonwillison.net/2026/Jan/29/datasette-10a24/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-29-simon-willison-datasette-10a24
---

# Datasette 1.0a24

29th January 2026 - Link Blog

**[Datasette 1.0a24](https://docs.datasette.io/en/latest/changelog.html#a24-2026-01-29)**. New Datasette alpha this morning. Key new features:

*   Datasette's `Request` object can now handle `multipart/form-data` file uploads via the new [await request.form(files=True)](https://docs.datasette.io/en/latest/internals.html#internals-formdata) method. I plan to use this for a `datasette-files` plugin to support attaching files to rows of data.
*   The [recommended development environment](https://docs.datasette.io/en/latest/contributing.html#setting-up-a-development-environment) for hacking on Datasette itself now uses [uv](https://github.com/astral-sh/uv). Crucially, you can clone Datasette and run `uv run pytest` to run the tests without needing to manually create a virtual environment or install dependencies first, thanks to the [dev dependency group pattern](https://til.simonwillison.net/uv/dependency-groups).
*   A new `?_extra=render_cell` parameter for both table and row JSON pages to return the results of executing the [render_cell() plugin hook](https://docs.datasette.io/en/latest/plugin_hooks.html#render-cell-row-value-column-table-database-datasette-request). This should unlock new JavaScript UI features in the future.

More details [in the release notes](https://docs.datasette.io/en/latest/changelog.html#a24-2026-01-29). I also invested a bunch of work in eliminating flaky tests that were intermittently failing in CI - I think those are all handled now.

Posted 29th January 2026 at 5:21 pm
