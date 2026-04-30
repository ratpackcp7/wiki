---
source_url: https://simonwillison.net/2026/Apr/28/pip-261/#atom-everything
fetched: 2026-04-28T07:30:00+00:00
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-28
title: "What's new in pip 26.1 - lockfiles and dependency cooldowns!"
---

[Simon Willison’s Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

28th April 2026 - Link Blog

**[What's new in pip 26.1 - lockfiles and dependency cooldowns!](https://ichard26.github.io/blog/2026/04/whats-new-in-pip-26.1/)
** ([via](https://lobste.rs/s/w2oiaq/what_s_new_pip_26_1_lockfiles_dependency "Lobste.rs")
) Richard Si describes an excellent set of upgrades to Python's default `pip` tool for installing dependencies.

This version drops support for Python 3.9 - fair enough, since it's been EOL [since October](https://devguide.python.org/versions/)
. macOS still ships with `python3` as a default Python 3.9, so I tried out the new Python version against Python 3.14 like this:

    uv python install 3.14
    mkdir /tmp/experiment
    cd /tmp/experiment
    python3.14 -m venv venv
    source venv/bin/activate
    pip install -U pip
    pip --version
    
This confirmed I had `pip 26.1` - then I tried out the new lock files:

    pip lock datasette llm
    
This installs Datasette and LLM and all of their dependencies and writes the whole lot to a 519 line `pylock.toml` file - [here's the result](https://gist.github.com/simonw/ff52c33f4d3a381b8e53c6a3aa0213f8)
.

The new release also supports dependency cooldowns, [discussed here previously](https://simonwillison.net/2026/Mar/24/package-managers-need-to-cool-down/)
, via the new `--uploaded-prior-to PXD` option where X is a number of days. The format is `P-number-of-days-D`, following [ISO duration format](https://en.wikipedia.org/wiki/ISO_8601#Durations)
 but only supporting days.

I shipped a new release of LLM, version 0.31, [three days ago](https://simonwillison.net/2026/Apr/24/llm/)
. Here's how to use the new `--uploaded-prior-to P4D` option to ask for a version that is at least 4 days old.

    pip install llm --uploaded-prior-to P4D
    venv/bin/llm --version
    
This gave me version 0.30.

Posted [28th April 2026](https://simonwillison.net/2026/Apr/28/)
 at 5:23 am

Recent articles
---------------

*   [Tracking the history of the now-deceased OpenAI Microsoft AGI clause](https://simonwillison.net/2026/Apr/27/now-deceased-agi-clause/)
     - 27th April 2026
*   [DeepSeek V4 - almost on the frontier, a fraction of the price](https://simonwillison.net/2026/Apr/24/deepseek-v4/)
     - 24th April 2026
*   [Extract PDF text in your browser with LiteParse for the web](https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/)
     - 23rd April 2026

This is a **link post** by Simon Willison, posted on [28th April 2026](https://simonwillison.net/2026/Apr/28/)
.

[packaging 48](https://simonwillison.net/tags/packaging/)
 [pip 17](https://simonwillison.net/tags/pip/)
 [python 1247](https://simonwillison.net/tags/python/)
 [security 599](https://simonwillison.net/tags/security/)
 [supply-chain 18](https://simonwillison.net/tags/supply-chain/)

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
