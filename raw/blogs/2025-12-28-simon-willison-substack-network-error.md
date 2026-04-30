---
source_url: https://simonwillison.net/2025/Dec/28/substack-network-error/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-28-simon-willison-substack-network-error
---

# Substack Network error = security content they don't allow to be sent

I just sent out the [latest edition](https://simonw.substack.com/p/a-new-way-to-extract-detailed-transcripts) of the newsletter version of this blog. It's a long one! Turns out I wrote a lot of stuff in the past 10 days.

The newsletter is out two days later than I had planned because I kept running into an infuriating issue with Substack: it would refuse to save my content with a "Network error" and "Not saved" and I couldn't figure out why.

![Screenshot of the Substack UI, with a Network error message on purple and a Not saved message higher up. The content in that editor includes an explanation of a SQL injection vulnerability.](https://static.simonwillison.net/static/2025/substack-error.jpg)

So I [asked ChatGPT to dig into it](https://chatgpt.com/share/6950ad7d-6948-8006-9833-201d2edff1be), which dug up [this Hacker News](https://news.ycombinator.com/item?id=43793526) post about the string `/etc/hosts` triggering an error.

And yeah, it turns out my newsletter included [this post](https://simonwillison.net/2025/Dec/18/ssrf-clickhouse-postgresql/) describing a SQL injection attack against ClickHouse and PostgreSQL which included the full exploit that was used.

Deleting that annotated example exploit allowed me to send the letter!

Posted 28th December 2025 at 4:16 am

Tags: security, sql-injection, newsletter, substack
