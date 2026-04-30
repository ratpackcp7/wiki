---
source_url: https://simonwillison.net/2025/Dec/1/youtube-embed-153-error/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-01-simon-willison-youtube-embed-153-error
---

# YouTube Embeds: Fixing the "Error 153" Player Issue

Simon Willison details a specific technical bug where YouTube video embeds fail with a **"Error 153: Video player configuration error."** The issue stems from restrictive HTTP security headers blocking necessary identification data required by YouTube.

## The Root Cause: Referrer-Policy
The error is caused by the `Referrer-Policy` HTTP header. In Django applications, the `SecurityMiddleware` may default to a setting that suppresses the `Referer` header for cross-origin requests.

*   **The Problematic Header:**
    ```http
    Referrer-Policy: same-origin
    ```
*   **Why it fails:** According to [YouTube's documentation](https://developers.google.com/youtube/terms/required-minimum-functionality#embedded-player-api-client-identity), API clients must provide identification via the `HTTP Referer` request header. The `same-origin` policy prevents this header from being sent to YouTube's servers, causing the player to fail.

## The Solution
To fix the error while maintaining privacy, the policy should be changed to `strict-origin-when-cross-origin`. This ensures that the site's origin (e.g., `https://simonwillison.net/`) is sent, but specific paths or query strings are stripped out.

### Implementation (Django)
Add the following line to your `settings.py`:
```python
SECURE_REFERRER_POLICY = "strict-origin-when-cross-origin"
```

## Technical Context & Definitions

### Policy Comparisons
*   **`same-origin`**: Sends origin, path, and query string for same-origin requests, but **sends no header** for cross-origin requests (breaking the YouTube embed).
*   **`strict-origin-when-cross-origin`**: 
    *   Sends full URL for same-origin requests.
    *   Sends **only the origin** (e.g., `Referer: https://example.com/`) for cross-origin requests.
    *   Sends nothing when security levels decrease (HTTPS to HTTP).

### Key Excerpts
> "API Clients that use the YouTube embedded player... must provide identification through the `HTTP Referer` request header... YouTube recommends using `strict-origin-when-cross-origin` Referrer-Policy, which is already the default in many browsers." — **YouTube Embedded Player Terms**

> "`strict-origin-when-cross-origin` offers more privacy... This prevents leaks of private data that may be accessible from other parts of the full URL such as the path and query string." — **Chrome Blog**
