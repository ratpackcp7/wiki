---
title: Testing with Coding Agents
created: 2026-04-11
updated: 2026-04-11
type: practice
tags: [testing, pytest, coding-agents, ai, python, claude-code, cc-loop]
sources:
  - url: https://simonwillison.net/2026/Jan/26/tests/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: low
confidence: unverified
---

# Testing with Coding Agents

## The principle
Coding agents (Claude Code, cc-loop, etc.) produce better tests when they have existing high-quality test patterns to imitate. The test suite itself is the best prompt.

## Why
- Training data contains vast pytest examples, so Python agents already know patterns like fixtures, parametrize, and mocking
- Agents match existing test quality — clean tests beget clean tests
- Explicit instruction ("use pytest.mark.parametrize") works but is slower than showing an example

## How to apply
1. **Seed with good patterns** — ensure the project has at least one clean test file using fixtures, parametrize, and proper mocking before asking the agent to write tests
2. **Clone reference repos** — point the agent at a well-tested project you control (e.g., `datasette/datasette-enrichments`) to show your preferred patterns
3. **Push back on duplication** — common anti-pattern is copy-pasted setup code. Tell the agent: "extract common setup into a pytest fixture" or "use pytest.mark.parametrize"
4. **Prefer pytest-httpx for API mocking** — agents understand this library well from training data
5. **Review test output** — agents are good at matching patterns but can miss edge cases; check coverage of failure paths

## Anti-patterns
- Letting the agent write tests without any existing test examples in the project
- Accepting large blocks of duplicated setup code
- Using `unittest.mock.patch` everywhere instead of proper fixture injection
- Not reviewing agent-written tests for correctness (they match patterns, not necessarily logic)

## Chris's preferences
- See `chris-preferences.md` for Chris's stance on testing.
- Chris uses cc-loop with trycycle for feature builds — testing is part of the build cycle.
- Last sync with chris-preferences: 2026-04-11

## Examples from this codebase
- `~/projects/cp7-dashboard/` — has existing test suite
- cc-loop dispatches to Claude Code which follows project test patterns

## Sources
- Simon Willison HN comment: https://simonwillison.net/2026/Jan/26/tests/
