---
source_url: https://developers.google.com/youtube/terms/required-minimum-functionality#embedded-player-api-client-identity
fetched: 2026-04-11
content_type: docs
slug: youtube-embedded-player-api-client-identity
---

# YouTube Embedded Player — API Client Identity

From YouTube API Services: Required Minimum Functionality.

## Referer Requirement

API Clients must identify themselves via the `HTTP Referer` request header.

- **Web Browsers:** Use `strict-origin-when-cross-origin` Referrer-Policy. Do not use `noreferrer` when using `window.open`.
- **Mobile/Desktop Apps (WebViews):** Since `Referer` is often empty by default, it must be set manually.

### Referer Format
The Referer must be a fully qualified HTTPS URL using the **Application ID**.

### Implementation Examples
- **Android (`loadDataWithBaseURL`):** Set the `baseUrl` parameter.
- **iOS (`loadRequest:`):** `[request addValue:referrerUrl forHTTPHeaderField:@"Referer"];`
- **Android `CustomTabs`:** Use `Intent.EXTRA_REFERRER` with the `android-app://` scheme.

## Player Constraints
- **Minimum Size:** 200px × 200px. Recommended: 480px × 270px for 16:9.
- **Autoplay:** Only when >50% visible. Only one player may autoplay per page.
- **Visual Integrity:** No overlays or frames may obscure the player or controls.
