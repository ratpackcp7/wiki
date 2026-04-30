---
source_url: https://simonwillison.net/2026/Feb/7/claude-fast-mode/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-07-simon-willison-claude-fast-mode
---

# Claude: Speed up responses with fast mode

New "research preview" from Anthropic today: you can now access a faster version of their frontier model Claude Opus 4.6 by typing `/fast` in Claude Code... but at a cost that's 6x the normal price.

Opus is usually $5/million input and $25/million output. The new fast mode is $30/million input and $150/million output!

There's a 50% discount until the end of February 16th, so only a 3x multiple (!) before then.

How much faster is it? The linked documentation doesn't say, but [on Twitter](https://x.com/claudeai/status/2020207322124132504) Claude say:

> Our teams have been building with a 2.5x-faster version of Claude Opus 4.6.
> 
> We're now making it available as an early experiment via Claude Code and our API.

Claude Opus 4.5 had a context limit of 200,000 tokens. 4.6 has an option to increase that to 1,000,000 at 2x the input price ($10/m) and 1.5x the output price ($37.50/m) once your input exceeds 200,000 tokens. These multiples hold for fast mode too, so after Feb 16th you'll be able to pay a hefty $60/m input and $225/m output for Anthropic's fastest best model.
