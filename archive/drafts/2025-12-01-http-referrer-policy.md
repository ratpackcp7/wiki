---
title: HTTP Referrer-Policy and Embedded Player Identity
created: 2025-12-01
updated: 2025-12-01
type: principle
tags: [http, security, headers, web, django]
sources:
  - url: https://developers.google.com/youtube/terms/required-minimum-functionality#embedded-player-api-client-identity
    fetched: 2026-04-11
  - url: https://simonwillison.net/2025/Dec/1/youtube-embed-153-error/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# HTTP Referrer-Policy and Embedded Player Identity

## The principle
Third-party embedded content (YouTube, payment iframes, analytics scripts) often requires the `HTTP Referer` header for client identification. A misconfigured `Referrer-Policy` can silently break embeds with cryptic errors like YouTube's "Error 153."

## Why
- YouTube's API terms require embed clients to identify via the `Referer` header
- `Referrer-Policy: same-origin` **sends no header** for cross-origin requests → embed fails
- `Referrer-Policy: strict-origin-when-cross-origin` sends only the origin (e.g. `https://example.com/`) cross-origin → embed works, privacy preserved

## How to apply
1. **Django:** Set `SECURE_REFERRER_POLICY = "strict-origin-when-cross-origin"` in `settings.py`
2. **Non-Django:** Add `Referrer-Policy: strict-origin-when-cross-origin` to response headers via middleware or reverse proxy
3. **Never use `noreferrer`** on links/window.open calls if the page hosts embedded players
4. **Verify** with browser DevTools Network tab — check the `Referer` header on requests to the embed domain

## Anti-patterns
- Using `same-origin` on pages that embed YouTube or other third-party players
- Using `no-referrer` globally (breaks all cross-origin identification)
- Setting policy via `<meta>` tag only (doesn't apply to subresources in some browsers)

## Chris's preferences
- See `chris-preferences.md` — no relevant section yet.
- Chris uses Django for some projects; this is directly applicable.
