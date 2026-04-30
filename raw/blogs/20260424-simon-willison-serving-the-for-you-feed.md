---
source_url: https://simonwillison.net/2026/Apr/24/serving-the-for-you-feed/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-24
slug: serving-the-for-you-feed
---

[Simon Willison’s Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

24th April 2026 - Link Blog

**[Serving the For You feed](https://atproto.com/blog/serving-the-for-you-feed)
**. One of Bluesky's most interesting features is that anyone can run their own [custom "feed" implementation](https://simonwillison.net/2026/Apr/24/serving-the-for-you-feed/bluesky%20custom%20feed)
 and make it available to other users - effectively enabling custom algorithms that can use any mechanism they like to recommend posts.

spacecowboy runs the [For You Feed](https://bsky.app/profile/did:plc:3guzzweuqraryl3rdkimjamk/feed/for-you)
, used by around 72,000 people. This guest post on the AT Protocol blog explains how it works.

The architecture is _fascinating_. The feed is served by a single Go process using SQLite on a "gaming" PC in spacecowboy's living room - 16 cores, 96GB of RAM and 4TB of attached NVMe storage.

Recommendations are based on likes: what else are the people who like the same things as you liking on the platform?

That Go server consumes the Bluesky firehose and stores the relevant details in SQLite, keeping the last 90 days of relevant data, which currently uses around 419GB of SQLite storage.

Public internet traffic is handled by a $7/month VPS on OVH, which talks to the living room server via Tailscale.

Total cost is now $30/month: $20 in electricity, $7 in VPS and $3 for the two domain names. spacecowboy estimates that the existing system could handle all ~1 million daily active Bluesky users if they were to switch to the cheapest algorithm they have found to work.

Posted [24th April 2026](https://simonwillison.net/2026/Apr/24/)
 at 1:08 am

Recent articles
---------------

*   [DeepSeek V4 - almost on the frontier, a fraction of the price](https://simonwillison.net/2026/Apr/24/deepseek-v4/)
     - 24th April 2026
*   [Extract PDF text in your browser with LiteParse for the web](https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/)
     - 23rd April 2026
*   [A pelican for GPT-5.5 via the semi-official Codex backdoor API](https://simonwillison.net/2026/Apr/23/gpt-5-5/)
     - 23rd April 2026

This is a **link post** by Simon Willison, posted on [24th April 2026](https://simonwillison.net/2026/Apr/24/)
.

[go 52](https://simonwillison.net/tags/go/)
 [scaling 148](https://simonwillison.net/tags/scaling/)
 [sqlite 461](https://simonwillison.net/tags/sqlite/)
 [software-architecture 25](https://simonwillison.net/tags/software-architecture/)
 [tailscale 11](https://simonwillison.net/tags/tailscale/)
 [bluesky 18](https://simonwillison.net/tags/bluesky/)

### Monthly briefing

Sponsor me for **$10/month** and get a curated email digest of the month's most important LLM developments.

Pay me to send you less!

[Sponsor & subscribe](https://github.com/sponsors/simonw/)

*   [Disclosures](https://simonwillison.net/about/#disclosures)
    
*   [Colophon](https://simonwillison.net/about/#about-site)
    
*   ©
*   [2002](https://simonwillison.net/2002/)
    
*   [2003](https://simonwillison.net/2003/)
    
*   [2004](https://simonwillison.net/2004/)
    
*   [2005](https://simonwillison.net/2005/)
    
*   [2006](https://simonwillison.net/2006/)
    
*   [2007](https://simonwillison.net/2007/)
    
*   [2008](https://simonwillison.net/2008/)
    
*   [2009](https://simonwillison.net/2009/)
    
*   [2010](https://simonwillison.net/2010/)
    
*   [2011](https://simonwillison.net/2011/)
    
*   [2012](https://simonwillison.net/2012/)
    
*   [2013](https://simonwillison.net/2013/)
    
*   [2014](https://simonwillison.net/2014/)
    
*   [2015](https://simonwillison.net/2015/)
    
*   [2016](https://simonwillison.net/2016/)
    
*   [2017](https://simonwillison.net/2017/)
    
*   [2018](https://simonwillison.net/2018/)
    
*   [2019](https://simonwillison.net/2019/)
    
*   [2020](https://simonwillison.net/2020/)
    
*   [2021](https://simonwillison.net/2021/)
    
*   [2022](https://simonwillison.net/2022/)
    
*   [2023](https://simonwillison.net/2023/)
    
*   [2024](https://simonwillison.net/2024/)
    
*   [2025](https://simonwillison.net/2025/)
    
*   [2026](https://simonwillison.net/2026/)