---
source_url: https://simonwillison.net/2026/Jan/22/chris-lloyd/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-01-22-simon-willison-chris-lloyd
---

# A quote from Chris Lloyd

> Most people's mental model of Claude Code is that "it's just a TUI" but it should really be closer to "a small game engine".
> 
> For each frame our pipeline constructs a scene graph with React then:
> 
> -> layout elements  
> -> rasterize them to a 2d screen  
> -> diff that against the previous screen  
> -> _finally_ use the diff to generate ANSI sequences to draw
> 
> We have a ~16ms frame budget so we have roughly ~5ms to go from the React scene graph to ANSI written.

— [Chris Lloyd](https://news.ycombinator.com/item?id=46699072#46706040)
, Claude Code team at Anthropic

Posted 22nd January 2026 at 3:34 pm

Tags: react, claude-code
