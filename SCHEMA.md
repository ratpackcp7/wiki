# Wiki Schema

## Domain
CP7 operations — homelab infrastructure, smart home, personal finance tooling, AI/ML ops, GitHub projects, and Chris Pack's personal/project info.

## Three Categories (Chris's organization)
1. **CP7 Things** — homelab, services, infrastructure → `entities/`, `concepts/`
2. **GitHub Things** — repos, projects → `projects/`
3. **Chris & Projects** — Chris Pack, family, personal projects → `entities/chris.md`, `projects/`

## Conventions
- File names: lowercase, hyphens, no spaces (e.g., `tuya-10x-scaling-bug.md`)
- Every wiki page starts with YAML frontmatter
- Use `[[wikilinks]]` to link between pages (minimum 2 outbound links per page)
- When updating a page, always bump the `updated` date
- Every new page must be added to `index.md` under the correct section
- Every action must be appended to `log.md`
- Bob manages this wiki autonomously — filing topics when they have enough depth
- No page for passing mentions. Create only when 2+ sources or central to a discussion.

## Frontmatter
```yaml
---
title: Page Title
created: YYYY-MM-DD
updated: YYYY-MM-DD
type: entity | concept | comparison | query | summary
tags: [from taxonomy below]
sources: [raw/articles/source-name.md, session:YYYY-MM-DD]
---
```

## Tag Taxonomy
### Infrastructure
- server, docker, networking, tailscale, cloudflare, backup, monitoring

### Smart Home
- homeassistant, tuya, zigbee, bluetooth, sensor, automation, energy

### Finance
- empower, banking, budget, insurance, simplefin

### AI/ML
- training, inference, fine-tuning, rl, agents, models, mlops

### Research
- comparison, deep-dive, evaluation, benchmark

### Meta
- troubleshooting, configuration, migration, deprecated, postmortem, lessons-learned

### Agents & AI Ops
- cc-loop, cc-chain, trycycle, claude-code, delegation, orchestration, subagents, cron-jobs, skills, build-journal

### Development
- mobile, react-native, expo, typescript, testing, tdd, code-review, git-hygiene, ci-cd

Rule: every tag must appear in this taxonomy. Add new tags here BEFORE using them.

## Page Thresholds
- **Create a page** when a topic spans 2+ sessions OR takes 5+ tool calls to resolve
- **Add to existing page** when new info relates to something already covered
- **Don't create a page** for one-off fixes, trivial lookups, or things fully covered by a skill
- **Split a page** when it exceeds ~200 lines
- **Skills vs Wiki**: If it's a *procedure* (step-by-step how-to), it's a skill. If it's *knowledge* (what, why, relationships), it's a wiki page. Both can coexist for the same topic.

## Update Policy
When new information conflicts with existing content:
1. Check dates — newer generally supersedes older
2. If genuinely contradictory, note both positions with dates
3. Mark in frontmatter: `contradictions: [page-name]`
4. Flag for Chris in the log
