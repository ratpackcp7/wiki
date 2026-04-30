---
source_url: https://simonwillison.net/2026/Jan/18/flux2-klein-4b/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-18-simon-willison-flux2-klein-4b
---

# FLUX.2-klein-4B Pure C Implementation

On 15th January Black Forest Labs, a lab formed by the creators of the original Stable Diffusion, released [black-forest-labs/FLUX.2-klein-4B](https://huggingface.co/black-forest-labs/FLUX.2-klein-4B) - an Apache 2.0 licensed 4 billion parameter version of their FLUX.2 family.

Salvatore Sanfilippo (antirez) decided to build a [pure C and dependency-free implementation](https://github.com/antirez/flux2.c) to run the model, with assistance from Claude Code and Claude Opus 4.5.

Salvatore shared [this note](https://news.ycombinator.com/item?id=46670279#46671233) on Hacker News:

> Something that may be interesting for the reader of this thread: this project was possible only once I started to tell Opus that it _needed_ to take a file with all the implementation notes, and also accumulating all the things we discovered during the development process. And also, the file had clear instructions to be taken updated, and to be processed ASAP after context compaction. This kinda enabled Opus to do such a big coding task in a reasonable amount of time without loosing track. Check the file IMPLEMENTATION_NOTES.md in the GitHub repo for more info.

See: [IMPLEMENTATION_NOTES.md](https://github.com/antirez/flux2.c/blob/main/IMPLEMENTATION_NOTES.md)

Posted 18th January 2026 at 11:58 pm

Tags: c, salvatore-sanfilippo, ai, stable-diffusion, generative-ai, llms, ai-assisted-programming, text-to-image, coding-agents, claude-code
