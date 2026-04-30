---
source_url: https://simonwillison.net/2026/Apr/24/recent-claude-code-quality-reports/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-24
slug: an-update-on-recent-claude-code-quality-reports
---

[Simon Willison’s Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

24th April 2026 - Link Blog

**[An update on recent Claude Code quality reports](https://www.anthropic.com/engineering/april-23-postmortem)
** ([via](https://news.ycombinator.com/item?id=47878905 "Hacker News")
) It turns out the high volume of complaints that Claude Code was providing worse quality results over the past two months was grounded in real problems.

The models themselves were not to blame, but three separate issues in the Claude Code harness caused complex but material problems which directly affected users.

Anthropic's postmortem describes these in detail. This one in particular stood out to me:

> On March 26, we shipped a change to clear Claude's older thinking from sessions that had been idle for over an hour, to reduce latency when users resumed those sessions. A bug caused this to keep happening every turn for the rest of the session instead of just once, which made Claude seem forgetful and repetitive.

I _frequently_ have Claude Code sessions which I leave for an hour (or often a day or longer) before returning to them. Right now I have 11 of those (according to `ps aux  | grep 'claude '`) and that's after closing down dozens more the other day.

I estimate I spend more time prompting in these "stale" sessions than sessions that I've recently started!

If you're building agentic systems it's worth reading this article in detail - the kinds of bugs that affect harnesses are deeply complicated, even if you put aside the inherent non-deterministic nature of the models themselves.

Posted [24th April 2026](https://simonwillison.net/2026/Apr/24/)
 at 1:31 am

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

[ai 1981](https://simonwillison.net/tags/ai/)
 [prompt-engineering 186](https://simonwillison.net/tags/prompt-engineering/)
 [generative-ai 1757](https://simonwillison.net/tags/generative-ai/)
 [llms 1724](https://simonwillison.net/tags/llms/)
 [anthropic 276](https://simonwillison.net/tags/anthropic/)
 [coding-agents 196](https://simonwillison.net/tags/coding-agents/)
 [claude-code 108](https://simonwillison.net/tags/claude-code/)

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