---
source_url: https://simonwillison.net/2026/Feb/20/beats/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-20-simon-willison-beats
---

# Adding TILs, releases, museums, tools and research to my blog

Simon Willison has introduced a new feature called **"beats"** to his blog. These are small, inline links with badges that aggregate his activity from across the web into his main site's timeline (homepage, search, and archives).

## The Five Content "Beats"

The system integrates five distinct types of external activity:

- **[Releases](https://simonwillison.net/elsewhere/release/):** GitHub releases of open-source projects, imported via a [JSON file](https://github.com/simonw/simonw/blob/main/releases_cache.json) updated by GitHub Actions.
- **[TILs](https://simonwillison.net/elsewhere/til/):** Posts from his [Today I Learned blog](https://til.simonwillison.net/), pulled via SQL queries against a Datasette instance.
- **[Museums](https://simonwillison.net/elsewhere/museum/):** New entries from [niche-museums.com](https://www.niche-museums.com/), using a custom JSON feed.
- **[Tools](https://simonwillison.net/elsewhere/tool/):** HTML/JS tools "vibe-coded" on [tools.simonwillison.net](https://tools.simonwillison.net/).
- **[Research](https://simonwillison.net/elsewhere/research/):** AI-generated research projects from the [simonw/research](https://github.com/simonw/research) repository.

## AI-Assisted Development Workflow

Willison utilized **Claude Code** and **Claude Artifacts** to build these integrations in a single morning.

### Prototyping with Claude Artifacts
Before writing production code, Willison used Claude's ability to clone public repos to brainstorm the UI:
- **Initial Prompt:** `Clone simonw/simonwillisonblog and tell me about the models and views`
- **UI Mockup Prompt:** `use the templates and CSS in this repo to create a new artifact with all HTML and CSS inline that shows me my homepage with some of those inline content types mixed in`

### Implementation with Claude Code
Once the artifact mockup proved the concept, he used **Claude Code for web** to:
- **Parse unstructured data:** Claude generated a regex parser for a raw Markdown README to import Research projects.
- **UI Integration:** Handled the "tedious" work of ensuring beats appeared correctly across all page types and within the site's faceted search engine.

> "Since I'm responsible for both the source and the destination I'm fine with a brittle solution that would be too risky against a source that I don't control myself."

## Key Technical Resources
- **Core Feature PR:** [Beats #592](https://github.com/simonw/simonwillisonblog/pull/592) (implements the underlying architecture).
- **Example Importer PR:** [Add Museums Beat importer #595](https://github.com/simonw/simonwillisonblog/pull/595/changes).
- **Tools Pattern:** [Useful patterns for building HTML tools](https://simonwillison.net/2025/Dec/10/html-tools/).
- **Research Pattern:** [Async coding agents for research](https://simonwillison.net/2025/Nov/6/async-code-research/).
