---
source_url: https://github.com/fastapi/fastapi/releases/tag/0.123.5
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2025-12-02-fastapi-release-0-123-5
---

# Release 0.123.5 · fastapi/fastapi

Released 02 Dec 21:07 by @tiangolo. [691 commits](https://github.com/fastapi/fastapi/compare/0.123.5...master) to master since this release.

[`c57ac7b`](https://github.com/fastapi/fastapi/commit/c57ac7bdf3613798c94caceff562a41fa16d4a2d)

### Features

*   ✨ Allow using dependables with `functools.partial()`. PR [#9753](https://github.com/fastapi/fastapi/pull/9753) by [@lieryan](https://github.com/lieryan).
*   ✨ Add support for wrapped functions (e.g. `@functools.wraps()`) used with forward references. PR [#5077](https://github.com/fastapi/fastapi/pull/5077) by [@lucaswiman](https://github.com/lucaswiman).
*   ✨ Handle wrapped dependencies. PR [#9555](https://github.com/fastapi/fastapi/pull/9555) by [@phy1729](https://github.com/phy1729).

### Fixes

*   🐛 Fix optional sequence handling with new union syntax from Python 3.10. PR [#14430](https://github.com/fastapi/fastapi/pull/14430) by [@Viicos](https://github.com/Viicos).

### Refactors

*   🔥 Remove dangling extra condiitonal no longer needed. PR [#14435](https://github.com/fastapi/fastapi/pull/14435) by [@tiangolo](https://github.com/tiangolo).
*   ♻️ Refactor internals, update `is_coroutine` check to reuse internal supported variants (unwrap, check class). PR [#14434](https://github.com/fastapi/fastapi/pull/14434) by [@tiangolo](https://github.com/tiangolo).

### Translations

*   🌐 Sync German docs. PR [#14367](https://github.com/fastapi/fastapi/pull/14367) by [@nilslindemann](https://github.com/nilslindemann).
