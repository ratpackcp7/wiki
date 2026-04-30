---
source_url: https://simonwillison.net/2025/Dec/16/s3-credentials/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-16-simon-willison-s3-credentials-0-17-detail
---

# s3-credentials 0.17 (detail)

## New Features in Version 0.17

The latest release introduces five new commands focused on policy management and local credential serving:

* **Policy Management:**
    * `get-bucket-policy` and `set-bucket-policy`: Retrieve or update the JSON policy for a specific bucket.
    * `get-public-access-block` and `set-public-access-block`: Manage the "Block Public Access" settings for a bucket.
* **Local Credential Server:**
    * `localserver`: Starts a web server that provides time-limited IAM credentials via a JSON API.

### The `localserver` Command

* **Default Port:** 8094 (configurable via `-p/--port`).
* **API Response:** Returns a JSON object containing IAM expiring credentials for a specified bucket.
* **Caching & Expiry:** Caches credentials internally and only regenerates them once they expire.
* **Concurrency:** Designed to avoid "dog pile effects" (thundering herd) when multiple requests hit the server during credential expiration.

### Development via AI (Claude Code)
Simon Willison used Claude Code to build the majority of this feature.
