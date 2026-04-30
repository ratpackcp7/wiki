# Wiki Ingest — 2026-04-11
**Articles to evaluate:** 18

```json
[
  {
    "id": "1757",
    "title": "[AINews] AI Engineer Europe 2026",
    "blog": "Latent Space",
    "url": "https://www.latent.space/p/ainews-ai-engineer-europe-2026",
    "published": "2026-04-10T23:30:58Z"
  },
  {
    "id": "1758",
    "title": "K\u0101k\u0101p\u014d parrots",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/10/kakapo/#atom-everything",
    "published": "2026-04-10T19:07:02Z"
  },
  {
    "id": "1759",
    "title": "ChatGPT voice mode is a weaker model",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/10/voice-mode-is-weaker/#atom-everything",
    "published": "2026-04-10T15:56:02Z"
  },
  {
    "id": "1760",
    "title": "Self-Host Weekly (10 April 2026)",
    "blog": "selfh.st",
    "url": "https://selfh.st/weekly/2026-04-10/",
    "published": "2026-04-10T12:05:12Z"
  },
  {
    "id": "1755",
    "title": "not much happened today",
    "blog": "AI News smol.ai",
    "url": "https://news.smol.ai/issues/26-04-10-not-much/",
    "published": "2026-04-10T05:44:39Z"
  },
  {
    "id": "1752",
    "title": "GitHub Repo Size",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/9/github-repo-size/#atom-everything",
    "published": "2026-04-09T21:31:50Z"
  },
  {
    "id": "1756",
    "title": "not much happened today",
    "blog": "AI News smol.ai",
    "url": "https://news.smol.ai/issues/26-04-09-not-much/",
    "published": "2026-04-09T05:44:39Z"
  },
  {
    "id": "1753",
    "title": "asgi-gzip 0.3",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/9/asgi-gzip/#atom-everything",
    "published": "2026-04-09T03:54:40Z"
  },
  {
    "id": "1751",
    "title": "[AINews] Meta Superintelligence Labs announces Muse Spark, first frontier model on their completely new stack",
    "blog": "Latent Space",
    "url": "https://www.latent.space/p/ainews-meta-superintelligence-labs",
    "published": "2026-04-08T23:23:36Z"
  },
  {
    "id": "1754",
    "title": "Meta's new model is Muse Spark, and meta.ai chat has some interesting tools",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/8/muse-spark/#atom-everything",
    "published": "2026-04-08T23:07:44Z"
  },
  {
    "id": "1748",
    "title": "DHH\u2019s new way of writing code",
    "blog": "The Pragmatic Engineer",
    "url": "https://newsletter.pragmaticengineer.com/p/dhhs-new-way-of-writing-code",
    "published": "2026-04-08T17:16:28Z"
  },
  {
    "id": "1008",
    "title": "Quoting Giles Turnbull",
    "blog": "Simon Willison",
    "url": "https://simonwillison.net/2026/Apr/8/giles-turnbull/#atom-everything",
    "published": "2026-04-08T15:18:49Z"
  },
  {
    "id": "1749",
    "title": "not much happened today",
    "blog": "AI News smol.ai",
    "url": "https://news.smol.ai/issues/26-04-08-not-much/",
    "published": "2026-04-08T05:44:39Z"
  },
  {
    "id": "1133",
    "title": "Putting AI on the Therapy Couch",
    "blog": "Dan Shapiro",
    "url": "https://www.danshapiro.com/blog/2026/04/putting-ai-on-the-therapy-couch/",
    "published": "2026-04-08T01:59:42Z"
  },
  {
    "id": "988",
    "title": "[AINews] Anthropic @ $30B ARR, Project GlassWing and Claude Mythos Preview \u2014 first model too dangerous to release since GPT-2",
    "blog": "Latent Space",
    "url": "https://www.latent.space/p/ainews-anthropic-30b-arr-project",
    "published": "2026-04-08T00:26:53Z"
  },
  {
    "id": "1",
    "title": "Mario and Earendil",
    "blog": "Armin Ronacher",
    "url": "https://lucumr.pocoo.org/2026/4/8/mario-and-earendil/",
    "published": "2026-04-08T00:00:00Z"
  },
  {
    "id": "1083",
    "title": "Open source security at Astral",
    "blog": "Astral Blog",
    "url": "https://astral.sh/blog/open-source-security-at-astral",
    "published": "2026-04-08T00:00:00Z"
  },
  {
    "id": "1129",
    "title": "ClickHouse's new benchmark for Postgres services",
    "blog": "Postgres Weekly",
    "url": "https://postgresweekly.com/issues/643",
    "published": "2026-04-08T00:00:00Z"
  }
]
```

_Source: /home/chris/wiki/raw/blogs/posts/2026-04-11.json_

---

You are Bob performing the daily wiki ingest. The articles above are from today's blogwatcher scan.

Follow the AGENTS.md P2 pipeline:

1. Evaluate relevance. Filter to articles relevant to Chris's stacks: Python/FastAPI, TypeScript/Next.js, React Native/Expo, SQLite, Docker, systemd, Home Assistant, LLM tooling, AI agents, self-hosting. Skip general news, opinion, off-topic. Aim for 1-5 articles max.

2. For each relevant article, run the full P2 pipeline:
   a. Fetch the blog post content → save to ~/wiki/raw/blogs/YYYY-MM-DD-author-slug.md with frontmatter
   b. Identify the PRIMARY SOURCE the blog discusses (official docs, changelog, GitHub release)
   c. Fetch primary source → save to ~/wiki/raw/docs/ or ~/wiki/raw/changelogs/
   d. Check if compiled page exists in ~/wiki/engineering/ — update or create
   e. Follow stack/principle template from ~/wiki/engineering/AGENTS.md
   f. Cross-reference ~/wiki/engineering/chris-preferences.md
   g. Update ~/wiki/engineering/index.md and ~/wiki/log.md

3. Report what you did — each article processed, primary source found, wiki pages created/updated.

Rules: Read ~/wiki/AGENTS.md first. Never create engineering page from blog alone (P2). Verify versions from primary sources (P4). Use Context7 for docs when available.
