---
source_url: https://github.com/fastapi/fastapi/releases/tag/0.123.1
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2025-12-02-fastapi-release-0-123-1
---

# Release 0.123.1 · fastapi/fastapi

Released 02 Dec 04:31 by @tiangolo. [731 commits](https://github.com/fastapi/fastapi/compare/0.123.1...master) to master since this release.

[`c337320`](https://github.com/fastapi/fastapi/commit/c3373205d03af626631b12ad91f26e77e6ddfd49)

### Fixes

*   🐛 Avoid accessing non-existing "$ref" key for Pydantic v2 compat remapping. PR [#14361](https://github.com/fastapi/fastapi/pull/14361) by [@svlandeg](https://github.com/svlandeg).
*   🐛 Fix `TypeError` when encoding a decimal with a `NaN` or `Infinity` value. PR [#12935](https://github.com/fastapi/fastapi/pull/12935) by [@kentwelcome](https://github.com/kentwelcome).

### Internal

*   🐛 Fix Windows UnicodeEncodeError in CLI test. PR [#14295](https://github.com/fastapi/fastapi/pull/14295) by [@hemanth-thirthahalli](https://github.com/hemanth-thirthahalli).
*   🔧 Update sponsors: add Greptile. PR [#14429](https://github.com/fastapi/fastapi/pull/14429) by [@tiangolo](https://github.com/tiangolo).
*   👥 Update FastAPI GitHub topic repositories. PR [#14426](https://github.com/fastapi/fastapi/pull/14426) by [@tiangolo](https://github.com/tiangolo).
*   ⬆ Bump markdown-include-variants from 0.0.6 to 0.0.7. PR [#14423](https://github.com/fastapi/fastapi/pull/14423) by [@YuriiMotov](https://github.com/YuriiMotov).
*   👥 Update FastAPI People - Sponsors. PR [#14422](https://github.com/fastapi/fastapi/pull/14422) by [@tiangolo](https://github.com/tiangolo).
*   👥 Update FastAPI People - Contributors and Translators. PR [#14420](https://github.com/fastapi/fastapi/pull/14420) by [@tiangolo](https://github.com/tiangolo).
