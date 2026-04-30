---
source_url: https://simonwillison.net/2026/Feb/17/release-notes-webcomic/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-17-simon-willison-release-notes-webcomic
---

# Nano Banana Pro diff to webcomic

Simon Willison explores a novel method for mitigating **"cognitive debt"**—the loss of deep understanding that occurs when AI-accelerated development leads to a high volume of projects. The core idea is to use LLMs to translate technical artifacts (like code diffs) into intuitive, visual explanations.

## The Concept: Dual-Version Planning
Inspired by Nathan Baschez, Willison highlights a strategy for managing complex AI-generated projects by asking the LLM for two distinct outputs:
1. **Technical Version:** Highly detailed and technical for the LLM to execute.
2. **Intuitive Version:** An entertaining essay or narrative designed to build the human developer's intuition.

> "My current favorite trick for reducing 'cognitive debt' is to ask the LLM to write two versions of the plan... Works great." — Nathan Baschez

## Experiment: Code Diff to Webcomic
Willison tested this by feeding a raw GitHub diff (v0.5.0 to v0.6.0) of his **Showboat** project into **Nano Banana Pro** (a Gemini-based tool).

The AI generated a six-panel comic strip explaining the "remote publishing" feature. Key technical details captured include:
- **Environment Variables:** Setting `SHOWBOAT_REMOTE_URL`.
- **CLI Commands:** Using `$ showboat init 'Live Demo'`.
- **Technical Mechanics:** Establishing an uplink, generating a unique UUID beacon, and real-time "beaming" of notes, executions, and image files to a remote viewer.

## Key Takeaways
- While output wasn't "polished enough to publish with release notes," it was highly valuable as a **personal tool for thinking**.
- Using AI to generate visual assets from code changes helps developers find new ways to explain complex features.
