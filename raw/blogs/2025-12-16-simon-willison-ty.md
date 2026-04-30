---
source_url: https://simonwillison.net/2025/Dec/16/ty/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-16-simon-willison-ty
---

# ty: An extremely fast Python type checker and LSP

**[ty: An extremely fast Python type checker and LSP](https://astral.sh/blog/ty)** ([via](https://news.ycombinator.com/item?id=46294289)) The team at Astral have been working on this for quite a long time, and are finally releasing the first beta. They have some big performance claims:

> Without caching, ty is consistently between 10x and 60x faster than mypy and Pyright. When run in an editor, the gap is even more dramatic. As an example, after editing a load-bearing file in the PyTorch repository, ty recomputes diagnostics in 4.7ms: 80x faster than Pyright (386ms) and 500x faster than Pyrefly (2.38 seconds). ty is very fast!

The easiest way to try it out is via `uvx`:

    cd my-python-project/
    uvx ty check

I tried it against sqlite-utils and it turns out I have quite a lot of work to do!

Astral also released a new [VS Code extension](https://marketplace.visualstudio.com/items?itemName=astral-sh.ty) adding ty-powered language server features like go to definition. I'm still getting my head around how this works and what it can do.
