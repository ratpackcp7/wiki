---
source_url: https://simonwillison.net/2025/Dec/29/copyright-release/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-29-simon-willison-copyright-release
---

# Copyright Release for Contributions To SQLite

[Copyright Release for Contributions To SQLite](https://www.sqlite.org/copyright-release.html). D. Richard Hipp [called me out](https://news.ycombinator.com/item?id=46420453#46424225) for spreading misinformation on Hacker News that SQLite refuses outside contributions:

> No, Simon, we don't "refuse". We are just very selective and there is a lot of paperwork involved to confirm the contribution is in the public domain and does not contaminate the SQLite core with licensed code.

I deeply regret this error! I'm linking to the copyright release document here - it looks like SQLite's public domain nature makes this kind of clause extremely important:

> [...] To the best of my knowledge and belief, the changes and enhancements that I have contributed to SQLite are either originally written by me or are derived from prior works which I have verified are also in the public domain and are not subject to claims of copyright by other parties.

Out of curiosity I decided to see how many people have contributed to SQLite outside of the core team of Richard, Dan and Joe. I ran that query using Fossil, SQLite's own SQLite-based version control system, like this:

    brew install fossil
    fossil clone https://www.sqlite.org/src sqlite.fossil
    fossil sql -R sqlite.fossil "
      SELECT user, COUNT(*) as commits
      FROM event WHERE type='ci'
      GROUP BY user ORDER BY commits DESC
    "

I got back 38 rows, though I think `danielk1977` and `dan` may be duplicates.

**Update**: The SQLite team have clarified this on their [SQLite is Public Domain](https://sqlite.org/copyright.html) page. It used to read "In order to keep SQLite completely free and unencumbered by copyright, the project does not accept patches." - it now reads:

> In order to keep SQLite completely free and unencumbered by copyright, the project does not accept patches from random people on the internet. There is a process to get a patch accepted, but that process is involved and for smaller changes is not normally worth the effort.

Posted 29th December 2025 at 7:58 pm

Tags: open-source, sqlite, d-richard-hipp
