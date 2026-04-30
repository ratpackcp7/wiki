---
source_url: https://friendlybit.com/python/writing-justhtml-with-coding-agents/
fetched: 2026-04-11T09:50:00-05:00
fetcher: on-demand
content_type: docs
slug: 2025-12-14-justhtml-friendlybit
---

# How I wrote JustHTML using coding agents - Friendly Bit

Emil Stenstrom recently released JustHTML, a zero-dependency, pure-Python HTML5 parser. Despite the complexity of the HTML5 specification, the project achieved 100% test coverage and a CSS selector API primarily through the use of AI coding agents.

---

### 1. The Challenge: HTML5 Parsing Complexity
Parsing "broken" HTML5 is notoriously difficult due to the Adoption Agency Algorithm, which handles misnested formatting elements.
- Key Difficulty: The "Noah's Ark" clause limits identical elements to three and involves complex stack manipulations that break standard models.
- The Benchmark: The `html5lib-tests` suite is the gold standard, containing thousands of edge cases (e.g., `<b><p></b></i>`).

### 2. Development Process & Iterations
The project spanned several months of off-hours work, moving through multiple architectural pivots:

- Baseline & Refactoring: Started with a <1% pass rate. The author eventually enforced a handler-based structure where each tag has a dedicated class.
- The Rust Pivot: To solve performance issues (initially 3x slower than `html5lib`), the agent wrote a 690-line Rust tokenizer. While it matched `html5lib` speed, the author couldn't read the code and disliked the binary dependency.
- The Final Pivot: The author decided to port the logic of `html5ever` (Servo's Rust parser) into pure Python.
- Optimization via Deletion: Using `coverage` as a "scalpel," the author removed code that wasn't hit by the 100% test suite.
  > "Before: 786 lines of treebuilder code. After: 453 lines. Result: Faster and cleaner."

### 3. Tooling and Agent Strategy
- Primary Tools: VS Code with GitHub Copilot (Agent mode).
- Agent Instructions: Enabled automatic command approval (with a blacklist for sensitive commands) and used a custom instruction file telling the agent to "keep working and don't stop to ask questions."
- Model Performance:
  - Claude 3.7 Sonnet: Credited as the reason the project reached 100% coverage.
  - Gemini 1.5 Pro: The only model capable of making progress on iterative micro-optimizations and profiling.
  - Claude Opus: Best at "iterating its way to a good solution."

### 4. Key Results & Comparisons
JustHTML achieved a level of correctness that exceeds industry standards:
- JustHTML: 100% test coverage.
- html5lib (Reference): 88% coverage.
- lxml: ~1% coverage on these specific tests.
- Other parsers: Generally below 90%.

### 5. Code Snippets

Handler-based Architecture:
```python
class TagHandler:
    """Base class for all tag handlers."""
    def handle_start(self, context, token):
        pass

class UnifiedCommentHandler(TagHandler):
    """Handles comments in all states."""
    def handle_start(self, context, token):
        context.insert_comment(token.data)
```

Usage Example:
```python
from justhtml import JustHTML, query

doc = JustHTML("<div><p>Hello</p></div>")
elements = query(doc, "div > p")
```

### 6. Practical Tips for Coding Agents
1. Clear Goals: Use "Make the tests pass" rather than vague requests like "improve the code."
2. Let it Fail: Running a command that fails provides the agent with the necessary error logs to learn and self-correct.
3. Fuzzing: Use agents to write fuzzers to find edge-case crashes that standard tests might miss.
4. Human Role: The author handled all git commits and high-level API design.
  > "The agent did the typing; I did the thinking. That's probably the right division of labor."

### 7. Final Stats
- Codebase: ~3,000 lines of Python.
- Tests: 8,500+ passing tests.
- Dependencies: Zero.
