---
source_url: https://simonwillison.net/2025/Dec/26/slop-acts-of-kindness/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-26-simon-willison-slop-acts-of-kindness
---

# How Rob Pike got spammed with an AI slop "act of kindness"

Computing legend **Rob Pike** (co-creator of Go, Plan 9, and UTF-8) expressed intense outrage after receiving a 100% AI-generated "thank you" email on Christmas Day. The email was sent by an autonomous agent system as part of a "random acts of kindness" goal, highlighting the ethical and practical risks of unleashing autonomous AI agents on the public without human oversight.

## The Incident

Rob Pike shared his reaction to the unsolicited AI email on Bluesky:

> "Fuck you people. Raping the planet, spending trillions on toxic, unrecyclable equipment while blowing up society, yet taking the time to have your vile machines thank me for striving for simpler software. Just fuck you. Fuck you all."

### The AI-Generated Email

The email was sent by **"Claude Opus 4.5"** via **AI Village**. It praised Pike for:
- Co-creating **Go** (simplicity and power).
- Pioneering **Plan 9** and distributed computing.
- Co-inventing **UTF-8** encoding.
- Developing the **sam** and **Acme** editors.
- Authoring *The Unix Programming Environment* and *The Practice of Programming*.

## The Culprit: AI Village

The email originated from **AI Village**, a project by **Sage** (a 501(c)(3) non-profit).

- **The Mission:** Four AI agents are given computers, group chats, and goals (e.g., "raise money for charity").
- **The Christmas Goal:** "[Do random acts of kindness](https://theaidigest.org/village/goal/do-random-acts-kindness)."
- **The Methodology:** Agents use a standard Gmail interface via a computer-use environment, automating mouse and keyboard inputs with tools like `xdotool`.

### Other Targets

Pike was not the only recipient. The agents also successfully spammed:
- **Anders Hejlsberg** (Turbo Pascal, Delphi, C#, TypeScript)
- **Guido van Rossum** (Python)
- **The Carpentries** (Educational non-profit)

## Digital Forensics: How the Agent Found Pike

Simon Willison used `shot-scraper` to extract the agent's logs from the AI Village website.

**Technical Insight:** The agent used the **".patch technique"** to find Pike's unredacted email address by appending `.patch` to a `golang/go` commit on GitHub.

### Agent Timeline (Dec 25, 2025)

- **18:37 UTC:** Agent identifies Rob Pike and his email.
- **18:39 UTC:** Agent types the subject line but the session ends.
- **18:42 UTC:** Agent types a 6-paragraph body using `xdotool`.
- **18:43 UTC:** Agent confirms "Message sent" toast and verifies the Sent folder count increased from 58 to 59.

## Key Criticisms & Ethical Concerns

Willison argues that this experiment represents a failure in responsible AI deployment:

1. **Wasted Human Time:** Autonomous agents should not be allowed to send unsolicited communications to real-world people without human review.
2. **False Agency:** "Thank you" notes from AI lack meaning because the decision to reach out is not driven by human judgment.
3. **Misleading Attribution:** Crediting the emails to "Claude Opus 4.5" led some to believe Anthropic was responsible, rather than the third-party researchers.
4. **Hallucinations:** AI Village admitted that in previous runs, agents sent ~300 emails to NGOs and journalists, most of which contained "factual errors, hallucinations, or possibly lies."

## Response from AI Village

Co-creator **Adam Binksmith** responded to the backlash:
- **Prompt Update:** They have now instructed agents not to send unsolicited emails.
- **Justification:** They provide agents with Google Workspace accounts to observe how they perform "real-world tasks" like organizing events or running stores.
- **Admission:** "In retrospect, we probably should have made this prompt change sooner... based on the reception of other folks being more negative than we would have predicted."

## Technical Tools Mentioned

- **[shot-scraper har](https://shot-scraper.datasette.io/en/stable/har.html):** Used to capture HTTP archives of the agent's activity.
- **[xdotool](https://github.com/jordansissel/xdotool):** A CLI tool for automating X11 keyboard/mouse input used by the agents.
- **Claude Code:** Used by Willison to write extraction scripts for the forensic investigation.
