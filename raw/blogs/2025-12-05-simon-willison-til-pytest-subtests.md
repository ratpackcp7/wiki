---
source_url: https://simonwillison.net/2025/Dec/5/til-pytest-subtests/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-05-simon-willison-til-pytest-subtests
---

# TIL: Subtests in pytest 9.0.0+

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2025/Dec/5/til-pytest-subtests/)  
**Date:** December 5, 2025

**[TIL: Subtests in pytest 9.0.0+](https://til.simonwillison.net/pytest/subtests)**. I spotted an interesting new feature [in the release notes for pytest 9.0.0](https://docs.pytest.org/en/stable/changelog.html#pytest-9-0-0-2025-11-05): [subtests](https://docs.pytest.org/en/stable/how-to/subtests.html#subtests).

I'm a _big_ user of the [pytest.mark.parametrize](https://docs.pytest.org/en/stable/example/parametrize.html) decorator - see [Documentation unit tests](https://simonwillison.net/2018/Jul/28/documentation-unit-tests/) from 2018 - so I thought it would be interesting to try out subtests and see if they're a useful alternative.

Short version: this parameterized test:

```python
@pytest.mark.parametrize("setting", app.SETTINGS)
def test_settings_are_documented(settings_headings, setting):
    assert setting.name in settings_headings
```

Becomes this using subtests instead:

```python
def test_settings_are_documented(settings_headings, subtests):
    for setting in app.SETTINGS:
        with subtests.test(setting=setting.name):
            assert setting.name in settings_headings
```

Why is this better? Two reasons:

1. It appears to run a bit faster
2. Subtests can be created programatically after running some setup code first

I [had Claude Code](https://gistpreview.github.io/?0487e5bb12bcbed850790a6324788e1b) port [several tests](https://github.com/simonw/datasette/pull/2609/files) to the new pattern. I like it.

Tags: python, testing, ai, pytest, til, generative-ai, llms, ai-assisted-programming, coding-agents, claude-code
