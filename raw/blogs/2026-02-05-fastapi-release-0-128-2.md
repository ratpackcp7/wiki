---
source_url: https://github.com/fastapi/fastapi/releases/tag/0.128.2
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-05-fastapi-release-0-128-2
---

# FastAPI Release 0.128.2

**Release Date:** February 5, 2025
**Release Author:** [@tiangolo](https://github.com/tiangolo)
**Commit Hash:** `79406a4`

---

### ✨ New Features
*   **PEP 695 Support:** Added support for `TypeAliasType`, improving compatibility with modern Python typing standards. ([#13920](https://github.com/fastapi/fastapi/pull/13920))
*   **Dependency Annotations:** You can now use the `Response` type hint directly as a dependency annotation. ([#14794](https://github.com/fastapi/fastapi/pull/14794))

### 🐛 Bug Fixes
*   **JSON Type Handling:** Fixed a bug (issue [#10997](https://github.com/fastapi/fastapi/issues/10997)) regarding the use of `Json[list[str]]` types. ([#14616](https://github.com/fastapi/fastapi/pull/14616))

### 🌐 Documentation & Translations
This release includes significant updates to the internationalization of FastAPI's documentation:

*   **New Languages Enabled:**
    *   Traditional Chinese (`zh-hant`)
    *   French (`fr`)
    *   Turkish (`tr`)
*   **Translation Updates:**
    *   Updated "outdated" and "missing" content for: **German (de), Portuguese (pt), Korean (ko), Spanish (es), Turkish (tr), French (fr), Traditional Chinese (zh-hant), and Ukrainian (uk).**
*   **General Docs:**
    *   Updated documentation regarding the translation process.
    *   Fixed a duplicate word typo in `advanced-dependencies.md`.

### 🔨 Internal Changes
*   **Translation Scripts:** Updated internal scripts for managing docs and translations.
*   **Configuration:** Added a `max pages to translate` setting to the internal configurations. ([#14840](https://github.com/fastapi/fastapi/pull/14840))

---

### 📊 Release Statistics
*   **Commits:** 332 commits to master since the previous release.
*   **Community Engagement:** 22 people reacted to the release, with 18 "Thumbs Up" and 7 "Hooray" reactions.
