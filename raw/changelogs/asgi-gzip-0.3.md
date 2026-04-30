---
source_url: https://github.com/simonw/asgi-gzip/releases/tag/0.3
fetched: 2026-04-11T07:35:00-05:00
fetcher: on-demand
content_type: changelog
slug: asgi-gzip-0.3
project: simonw/asgi-gzip
version: "0.3"
---

# asgi-gzip 0.3

Released 2026-04-09 by simonw

Commit: [`673d8c8`](https://github.com/simonw/asgi-gzip/commit/673d8c8926ed763a948929305ea244e8eedc8fcc)

## Changes

- Don't apply compression to `text/event-stream` responses. [#6](https://github.com/simonw/asgi-gzip/issues/6)

## Context

asgi-gzip is gzip middleware for ASGI applications, extracted from Starlette. It had been incorrectly compressing Server-Sent Events (SSE) `text/event-stream` responses, breaking SSE in production. The fix was ported from Starlette's own commit: [a9a8dab](https://github.com/Kludex/starlette/commit/a9a8dab0cc3cbd05dca37650fc392717b9fe5bbf).
