---
source_url: https://simonwillison.net/2026/Feb/26/google-api-keys/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-26-simon-willison-google-api-keys
---

# Google API Keys Weren't Secrets. But then Gemini Changed the Rules.

**[Google API Keys Weren't Secrets. But then Gemini Changed the Rules.](https://trufflesecurity.com/blog/google-api-keys-werent-secrets-but-then-gemini-changed-the-rules)** ([via](https://news.ycombinator.com/item?id=47156925 "Hacker News")) Yikes! It turns out Gemini and Google Maps (and other services) share the same API keys... but Google Maps API keys are designed to be public, since they are embedded directly in web pages. Gemini API keys can be used to access private files and make billable API requests, so they absolutely should not be shared.

If you don't understand this it's very easy to accidentally enable Gemini billing on a previously public API key that exists in the wild already.

> What makes this a privilege escalation rather than a misconfiguration is the sequence of events.
>
> 1. A developer creates an API key and embeds it in a website for Maps. (At that point, the key is harmless.)
> 2. The Gemini API gets enabled on the same project. (Now that same key can access sensitive Gemini endpoints.)
> 3. The developer is never warned that the keys' privileges changed underneath it. (The key went from public identifier to secret credential).

Truffle Security found 2,863 API keys in the November 2025 Common Crawl that could access Gemini, verified by hitting the `/models` listing endpoint. This included several keys belonging to Google themselves, one of which had been deployed since February 2023 (according to the Internet Archive) hence predating the Gemini API that it could now access.

Google are working to revoke affected keys but it's still a good idea to check that none of yours are affected by this.
