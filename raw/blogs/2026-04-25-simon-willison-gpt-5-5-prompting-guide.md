---
source_url: https://simonwillison.net/2026/Apr/25/gpt-5-5-prompting-guide
fetched: 2026-04-25T07:30:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-04-25-simon-willison-gpt-5-5-prompting-guide
---

# GPT-5.5 prompting guide

[Simon Willison's Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

25th April 2026 - Link Blog

**[GPT-5.5 prompting guide](https://developers.openai.com/api/docs/guides/prompt-guidance?model=gpt-5.5)**. Now that GPT-5.5 is [available in the API](https://developers.openai.com/api/docs/models/gpt-5.5), OpenAI have released a wealth of useful tips on how best to prompt the new model.

Here's a neat trick they recommend for applications that might spend considerable time thinking before returning a user-visible response:

    Before any tool calls for a multi-step task, send a short user-visible update that acknowledges the request and states the first step. Keep it to one or two sentences.

I've already noticed their Codex app doing this, and it does make longer running tasks feel less like the model has crashed.

OpenAI suggest running the following in Codex to upgrade your existing code using advice embedded in their `openai-docs` skill:

    $openai-docs migrate this project to gpt-5.5

The upgrade guide the coding agent will follow [is this one](https://github.com/openai/skills/blob/724cd511c96593f642bddf13187217aa155d2554/skills/.curated/openai-docs/references/upgrade-guide.md#model-string--light-prompt-rewrite), which even includes light instructions on how to rewrite prompts to better fit the model.

Also relevant is the [Using GPT-5.5 guide](https://developers.openai.com/api/docs/guides/latest-model), which opens with this warning:

> To get the most out of GPT-5.5, treat it as a new model family to tune for, not a drop-in replacement for `gpt-5.2` or `gpt-5.4`. Begin migration with a fresh baseline instead of carrying over every instruction from an older prompt stack. Start with the smallest prompt that preserves the product contract, then tune reasoning effort, verbosity, tool descriptions, and output format against representative examples.

Interesting to see OpenAI recommend starting from scratch rather than trusting that existing prompts optimized for previous models will continue to work effectively with GPT-5.5.

Posted [25th April 2026](https://simonwillison.net/2026/Apr/25/)
 at 4:13 am

Recent articles
---------------

*   [DeepSeek V4 - almost on the frontier, a fraction of the price](https://simonwillison.net/2026/Apr/24/deepseek-v4/)
     - 24th April 2026
*   [Extract PDF text in your browser with LiteParse for the web](https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/)
     - 23rd April 2026
*   [A pelican for GPT-5.5 via the semi-official Codex backdoor API](https://simonwillison.net/2026/Apr/23/gpt-5-5/)
     - 23rd April 2026

This is a **link post** by Simon Willison, posted on [25th April 2026](https://simonwillison.net/2026/Apr/25/).

[ai 1984](https://simonwillison.net/tags/ai/)
 [openai 412](https://simonwillison.net/tags/openai/)
 [prompt-engineering 187](https://simonwillison.net/tags/prompt-engineering/)
 [generative-ai 1760](https://simonwillison.net/tags/generative-ai/)
 [llms 1727](https://simonwillison.net/tags/llms/)
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