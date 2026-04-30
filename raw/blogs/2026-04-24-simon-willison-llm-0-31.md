---
source_url: https://simonwillison.net/2026/Apr/24/llm
fetched: 2026-04-25T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-24-simon-willison-llm-0-31
---

# Release: llm 0.31

[Simon Willison's Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

24th April 2026

Release [llm 0.31](https://github.com/simonw/llm/releases/tag/0.31)
 — Access large language models from the command-line

> *   New GPT-5.5 OpenAI model: `llm -m gpt-5.5`. [#1418](https://github.com/simonw/llm/issues/1418)
>
> *   New option to set the [text verbosity level](https://developers.openai.com/cookbook/examples/gpt-5/gpt-5_new_params_and_tools#1-verbosity-parameter)
>     for GPT-5+ OpenAI models: `-o verbosity low`. Values are `low`, `medium`, `high`.
>
> *   New option for setting the [image detail level](https://developers.openai.com/api/docs/guides/images-vision#choose-an-image-detail-level)
>     used for image attachments to OpenAI models: `-o image_detail low` - values are `low`, `high` and `auto`, and GPT-5.4 and 5.5 also accept `original`.
>
> *   Models listed in `extra-openai-models.yaml` are now also registered as asynchronous. [#1395](https://github.com/simonw/llm/issues/1395)

Posted [24th April 2026](https://simonwillison.net/2026/Apr/24/)
 at 11:35 pm

Recent articles
---------------

*   [DeepSeek V4 - almost on the frontier, a fraction of the price](https://simonwillison.net/2026/Apr/24/deepseek-v4/)
     - 24th April 2026
*   [Extract PDF text in your browser with LiteParse for the web](https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/)
     - 23rd April 2026
*   [A pelican for GPT-5.5 via the semi-official Codex backdoor API](https://simonwillison.net/2026/Apr/23/gpt-5-5/)
     - 23rd April 2026

This is a **beat** by Simon Willison, posted on [24th April 2026](https://simonwillison.net/2026/Apr/24/).

[openai 412](https://simonwillison.net/tags/openai/)
 [llm 590](https://simonwillison.net/tags/llm/)
 [gpt 122](https://simonwillison.net/tags/gpt/)

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