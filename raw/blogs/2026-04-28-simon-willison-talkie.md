---
source_url: https://simonwillison.net/2026/Apr/28/talkie/#atom-everything
fetched: 2026-04-28T07:30:00+00:00
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-28
title: "Introducing talkie: a 13B vintage language model from 1930"
---

# Summary: Introducing talkie –13B Vintage 1930 Language Model

---

## Post Details
- **Author**: Simon Willison ([simonwillison.net](https://simonwillison.net/))
- **Published**: 28 April 2026
- **Original Link**: [Introducing talkie: a 13B vintage language model from 1930](https://simonwillison.net/2026/Apr/28/talkie/#atom-everything)
- **Hacker News Discussion**: [47927903](https://news.ycombinator.com/item?id=47927903)
- **Tags**: #ai #generative-ai #local-llms #llms #training-data #ai-ethics #llm-release
- **Sponsor**: Sonar (SAST + SCA for secure, dependency-aware Agentic Engineering; [SonarQube Advanced Security](https://fandf.co/4bzyODl))

---

## Core Project Overview
talkie is a new LLM project created by:
- Nick Levine ([nlevine.org](https://nlevine.org/))
- David Duvenaud ([University of Toronto](http://www.cs.toronto.edu/~duvenaud/))
- Alec Radford (noted for GPT, GPT-2, and Whisper)

Official project announcement: [talkie-lm.com/introducing-talkie](https://talkie-lm.com/introducing-talkie)

---

## Released Models (Apache 2.0 Licensed)
All training data for the base model is out-of-copyright (U.S. copyright cutoff: January1, 1931). Simon Willison notes he hopes the full training dataset is released publicly in future.

### 1. `talkie-1930-13b-base`
- **Size**: 53.1 GB
- **Specs**: 13B parameters, trained on 260B tokens of pre-1931 English text
- **Hugging Face**: [talkie-lm/talkie-1930-13b-base](https://huggingface.co/talkie-lm/talkie-1930-13b-base)

### 2. `talkie-1930-13b-it` (Chat Model)
- **Size**: 26.6 GB
- **Finetuning**: Optimized for chat via instruction-response pairs extracted from pre-1931 reference works
- **Try Live**: [talkie-lm.com/chat](https://talkie-lm.com/chat)
- **Hugging Face**: [talkie-lm/talkie-1930-13b-it](https://huggingface.co/talkie-lm/talkie-1930-13b-it)

---

## Key Research Objectives
Per the talkie report, the project explores three core questions for vintage LLMs:
1. **Future prediction accuracy**: *"we calculated the surprisingness of short descriptions of historical events to a 13B model trained on pre-1931 text"*
2. **Post-cutoff invention**: *"As Demis Hassabis has asked, could a model trained up to 1911 independently discover General Relativity, as Einstein did in 1915?"*
3. **Programming ability**: *"Figure 3 (left-hand side) shows an early example of such a test, measuring how well models trained on pre-1931 text can, when given a few demonstration examples of [Python programs](https://github.com/openai/human-eval), write new correct programs."*

---

## "Vegan Models" & Fine-Tuning Limitations
Simon Willison defines **vegan models** as LLMs trained exclusively on licensed or out-of-copyright data:
- The base talkie model qualifies as vegan.
- The chat (`it`) model does *not*, as its post-training relies on modern LLMs:

> First, we generated instruction-response pairs from historical texts with regular structure, such as etiquette manuals, letter-writing manuals, cookbooks, dictionaries, encyclopedias, poetry and fable collections (see Figure7), and fine-tuned our base model on them using a simple chat format.
> 
> Next, to improve instruction-following abilities, we generated synthetic prompts covering different types of tasks, such as summarizing documents, responding to direct information requests, and continuing multi-turn conversations coherently. We then ran online direct preference optimization on rollouts generated from these prompts, **using Claude Sonnet 4.6 as a judge**. [..]
> 
> Finally, we did another round of supervised fine-tuning, this time on rejection-sampled **multi-turn synthetic chats between Claude Opus 4.6 and talkie**, to smooth out persistent rough edges in its conversational abilities.

---

## Contamination Challenges
The team faced two major anachronistic contamination risks:
1. Post-1931 text accidentally included in the training corpus
2. Modern LLM fine-tuning assistance introducing post-1930 knowledge to the chat model

This mirrors issues faced by *Mr. Chatterbox*, another vintage LLM project that also used modern LLMs to generate synthetic training conversations (covered by Simon on [30 March 2026](https://simonwillison.net/2026/Mar/30/mr-chatterbox/)).

---

## Future Roadmap
The talkie team aims to eliminate modern LLM influence in post-training:

> While we have tried to post-train talkie free from modern influence, reinforcement learning with AI feedback inevitably shapes talkie’s behavior anachronistically. (The 7B version of talkie emerged from RL speaking in listicles.) As we scale up, we hope to be able to use our vintage base models themselves as judges to enable a fully bootstrapped era-appropriate post-training pipeline.

---

## Live Demo Test
Simon tested the talkie chat demo with his standard prompt:
```plaintext
Generate an SVG of a pelican riding a bicycle
```

talkie's response:
> An SVG of a pelican riding a bicycle was generated in 1860. The pelican was represented as perched on the saddle, wi

[... summary truncated for context management ...]
