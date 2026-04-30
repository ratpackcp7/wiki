---
source_url: https://simonwillison.net/2026/Feb/15/em-dashes/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-15-simon-willison-em-dashes
---

# Em dash

I'm occasionally accused of using LLMs to write the content on my blog. I don't do that, and I don't think my writing has much of an LLM smell to it... with one notable exception:

    # Finally, do em dashes
    s = s.replace(' - ', u'\u2014')

That code to add em dashes to my posts dates back to [at least 2015](https://github.com/simonw/simonwillisonblog/blob/e6d0327b37debdf820b5cfef4fb7d09a9624cea9/blog/templatetags/entry_tags.py#L145-L146) when I ported my blog from an older version of Django (in a long-lost Mercurial repository) and started afresh on GitHub.

Posted 15th February 2026 at 9:40 pm
