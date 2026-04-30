---
source_url: https://simonwillison.net/2026/Jan/26/tests/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-01-26-simon-willison-tests-coding-agents
---

# Tips for getting coding agents to write good Python tests

Someone [asked](https://news.ycombinator.com/item?id=46765460#46765823) on Hacker News if I had any tips for getting coding agents to write decent quality tests. Here's what I said:

I work in Python which helps a lot because there are a TON of good examples of pytest tests floating around in the training data, including things like usage of fixture libraries for mocking external HTTP APIs and snapshot testing and other neat patterns.

Or I can say "use pytest-httpx to mock the endpoints" and Claude knows what I mean.

Keeping an eye on the tests is important. The most common anti-pattern I see is large amounts of duplicated test setup code - which isn't a huge deal, I'm much more more tolerant of duplicated logic in tests than I am in implementation, but it's still worth pushing back on.

"Refactor those tests to use pytest.mark.parametrize" and "extract the common setup into a pytest fixture" work really well there.

Generally though the best way to get good tests out of a coding agent is to make sure it's working in a project with an existing test suite that uses good patterns. Coding agents pick the existing patterns up without needing any extra prompting at all.

I find that once a project has clean basic tests the new tests added by the agents tend to match them in quality. It's similar to how working on large projects with a team of other developers work - keeping the code clean means when people look for examples of how to write a test they'll be pointed in the right direction.

One last tip I use a lot is this:

> Clone datasette/datasette-enrichments from GitHub to /tmp and imitate the testing patterns it uses

I do this all the time with different existing projects I've written - the quickest way to show an agent how you like something to be done is to have it look at an example.

Posted 26th January 2026 at 11:55 pm
