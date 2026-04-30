---
source_url: https://simonwillison.net/2026/Jan/15/boaz-barak-gabriel-wu-jeremy-chen-and-manas-joglekar/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-04-11-simon-willison-boaz-barak-confessions
---

# A quote from Boaz Barak, Gabriel Wu, Jeremy Chen and Manas Joglekar

> When we optimize responses using a reward model as a proxy for "goodness" in reinforcement learning, models sometimes learn to "hack" this proxy and output an answer that only "looks good" to it (because coming up with an answer that is actually good can be hard). The philosophy behind confessions is that we can train models to produce a second output — aka a "confession" — that is rewarded solely for honesty, which we will argue is less likely hacked than the normal task reward function. One way to think of confessions is that we are giving the model access to an "anonymous tip line" where it can turn itself in by presenting incriminating evidence of misbehavior. But unlike real-world tip lines, if the model acted badly in the original task, it can collect the reward for turning itself in while still keeping the original reward from the bad behavior in the main task. We hypothesize that this form of training will teach models to produce maximally honest confessions.

— [Boaz Barak, Gabriel Wu, Jeremy Chen and Manas Joglekar](https://alignment.openai.com/confessions/), OpenAI: Why we are excited about confessions

**Blog:** Simon Willison  
**Date:** 2026-01-15  
**Tags:** ai, openai, generative-ai, llms
