---
source_url: https://github.com/fastapi/fastapi/releases/tag/0.123.2
fetched: 2026-04-11
fetcher: on-demand
content_type: changelog
slug: 2025-12-02-fastapi-release-0-123-2
---

# Release 0.123.2 · fastapi/fastapi

Released 02 Dec 05:32 by @tiangolo. [716 commits](https://github.com/fastapi/fastapi/compare/0.123.2...master) to master since this release.

[`3c54a8f`](https://github.com/fastapi/fastapi/commit/3c54a8f07b70cdd40e3d81ea319e9fcccd2481d2)

### Fixes

*   🐛 Fix unformatted `{type_}` in FastAPIError. PR [#14416](https://github.com/fastapi/fastapi/pull/14416) by [@Just-Helpful](https://github.com/Just-Helpful).
*   🐛 Fix parsing extra non-body parameter list. PR [#14356](https://github.com/fastapi/fastapi/pull/14356) by [@YuriiMotov](https://github.com/YuriiMotov).
*   🐛 Fix parsing extra `Form` parameter list. PR [#14303](https://github.com/fastapi/fastapi/pull/14303) by [@YuriiMotov](https://github.com/YuriiMotov).
*   🐛 Fix support for form values with empty strings interpreted as missing (`None` if that's the default), for compatibility with HTML forms. PR [#13537](https://github.com/fastapi/fastapi/pull/13537) by [@MarinPostma](https://github.com/MarinPostma).

### Docs

*   📝 Add tip on how to install `pip` in case of `No module named pip` error in `virtual-environments.md`. PR [#14211](https://github.com/fastapi/fastapi/pull/14211) by [@zadevhub](https://github.com/zadevhub).
*   📝 Update Primary Key notes for the SQL databases tutorial to avoid confusion. PR [#14120](https://github.com/fastapi/fastapi/pull/14120) by [@FlaviusRaducu](https://github.com/FlaviusRaducu).
*   📝 Clarify estimation note in documentation. PR [#14070](https://github.com/fastapi/fastapi/pull/14070) by [@SaisakthiM](https://github.com/SaisakthiM).
