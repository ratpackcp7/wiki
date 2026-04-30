---
source_url: https://github.com/fastapi/fastapi/releases/tag/0.136.1
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: FastAPI Releases
published_date: 2026-04-23
slug: 01361
---

# FastAPI Release Summary: 0.136.1

**Release Date:** April 23, 2024  
**Maintainer:** [@tiangolo](https://github.com/tiangolo)  
**Version:** `0.136.1`

---

## 🚀 Key Upgrades
The primary focus of this release is maintaining compatibility with modern dependency standards.

* **Pydantic v2 Optimization:** 
  > `⬆️ Update Pydantic v2 code to address deprecations. PR [#15101]`
  * This ensures the codebase remains compliant with the latest Pydantic v2 standards and avoids future breaking changes.

---

## 🛠️ Internal Changes & Maintenance

### Security & Auditing
* **Security Scanning:** Added `zizmor` to the workflow and addressed existing audit findings to improve codebase security.
* **Dependency Updates:** Significant number of dependency bumps to ensure security and stability.

### Dependency Bumps (Selected)
The release includes numerous updates to core and development dependencies:

| Category | Dependency | Version Change |
| :--- | :--- | :--- |
| **Core Framework** | `starlette` | `0.52.1` $\rightarrow$ `1.0.0` |
| **Data/Validation** | `python-multipart` | `0.0.22` $\rightarrow$ `0.0.26` |
| **GraphQL** | `strawberry-graphql` | `0.312.3` $\rightarrow$ `0.314.3` |
| **Auth/Security** | `pyjwt` | `2.12.0` $\rightarrow$ `2.12.1` |
| | `authlib` | `1.6.9` $\rightarrow$ `1.6.11` |
| **Testing/Dev** | `pytest` | `9.0.2` $\rightarrow$ `9.0.3` |
| | `mypy` | `1.19.1` $\rightarrow$ `1.20.1` |
| | `pytest-cov` | `7.0.0` $\rightarrow$ `7.1.0` |

### Miscellaneous
* **Documentation:** Tweaked translation scripts and updated `mkdocs-material` and `pymdown-extensions`.
* **Sponsorships:** Updated the sponsors list (removed Zuplo and Speakeasy).

---

## 📊 Release Metadata
* **Commits since last release:** 8 commits to master.
* **Primary Contributors:** [@svlandeg](https://github.com/svlandeg), [@YuriiMotov](https://github.com/YuriiMotov), [@tiangolo](https://github.com/tiangolo), and [@dependabot\[bot\]](https://github.com/apps/dependabot).