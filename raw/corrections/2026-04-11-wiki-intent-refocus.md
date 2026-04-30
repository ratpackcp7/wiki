---
correction_date: 2026-04-11
topic: wiki-intent
content_type: correction
---

# Wiki Intent Refocus — Chris directive

## The wiki's purpose (restated)
Make Bob smarter about Chris's projects. Not a general knowledge base. Not a docs mirror.

## The Context7 filter
Before compiling anything into an engineering page, ask: "Can Context7 answer this?"
- If YES → don't compile. Context7 has it fresher and more complete.
- If NO → this is wiki-worthy.

## What Context7 CAN answer (don't compile):
- Library docs, API signatures, CLI flags
- Release notes, changelogs, version diffs
- PEP specifications, language features
- Framework concepts (how App Router works, how FastAPI Depends() works)

## What Context7 CANNOT answer (DO compile):
- How Chris's projects use the stack (Empower's database.py rule, lifespan pattern)
- Project-specific gotchas learned from real failures (asgi-gzip SSE, Enphase midnight reset, Expo DOMException)
- Cross-stack integration patterns (Empower → dashboard → mobile, HA → dashboard solar)
- Chris's preferences and corrections
- Incident knowledge — things learned from breaking something

## Raw layer unchanged
Still capture blogs verbatim to raw/. The filter applies only to compilation — what gets promoted to engineering/.

## Focus discipline
Chris has stated he needs help staying focused. When scope creep appears (Django pages when Chris uses FastAPI, LLM model releases, general Python ecosystem news), push back. The wiki serves one user and one agent.
