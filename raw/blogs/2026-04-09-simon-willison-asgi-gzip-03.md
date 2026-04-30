---
source_url: https://simonwillison.net/2026/Apr/9/asgi-gzip/#atom-everything
fetched: 2026-04-11T07:35:00-05:00
fetcher: on-demand
content_type: blog
slug: 2026-04-09-simon-willison-asgi-gzip-03
---

# Release: asgi-gzip 0.3

**Author:** Simon Willison
**Date:** 9th April 2026

Release [asgi-gzip 0.3](https://github.com/simonw/asgi-gzip/releases/tag/0.3) — gzip middleware for ASGI applications, extracted from Starlette

I ran into trouble deploying a new feature using [SSE](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events) to a production Datasette instance, and it turned out that instance was using [datasette-gzip](https://github.com/simonw/datasette-gzip) which uses [asgi-gzip](https://github.com/simonw/asgi-gzip) which was incorrectly compressing `event/text-stream` responses.

`asgi-gzip` was extracted from Starlette, and has [a GitHub Actions scheduled workflow](https://simonwillison.net/2022/Apr/28/issue-on-changes/) to check Starlette for updates that need to be ported to the library... but that action had stopped running and hence had missed [Starlette's own fix](https://github.com/Kludex/starlette/commit/a9a8dab0cc3cbd05dca37650fc392717b9fe5bbf) for this issue.

I ran the workflow and integrated the new fix, and now `datasette-gzip` and `asgi-gzip` both correctly handle `text/event-stream` in SSE responses.

Tags: gzip, python, asgi
