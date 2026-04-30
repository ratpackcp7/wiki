---
source_url: https://simonwillison.net/2025/Dec/29/shot-scraper/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-29-simon-willison-shot-scraper
---

# shot-scraper 1.9

[shot-scraper 1.9](https://github.com/simonw/shot-scraper/releases/tag/1.9). New release of my [shot-scraper](https://shot-scraper.datasette.io/) CLI tool for taking screenshots and scraping websites with JavaScript from the terminal.

> *   The `shot-scraper har` command has a new `-x/--extract` option which extracts all of the resources loaded by the page out to a set of files. This location can be controlled by the `-o dir/` option. [#184](https://github.com/simonw/shot-scraper/issues/184)
>
> *   Fixed the `shot-scraper accessibility` command for compatibility with the latest Playwright. [#185](https://github.com/simonw/shot-scraper/pull/185)

The new `shot-scraper har -x https://simonwillison.net/` command is really neat. The inspiration was [the digital forensics expedition](https://simonwillison.net/2025/Dec/26/slop-acts-of-kindness/#digital-forensics-with-shot-scraper-har) I went on to figure out why Rob Pike got spammed. You can now perform a version of that investigation like this:

    cd /tmp
    shot-scraper har --wait 10000 'https://theaidigest.org/village?day=265' -x

Then dig around in the resulting JSON files in the `/tmp/theaidigest-org-village` folder.

Posted 29th December 2025 at 10:33 pm

Tags: projects, annotated-release-notes, shot-scraper
