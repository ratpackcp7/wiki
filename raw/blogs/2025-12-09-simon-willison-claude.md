---
source_url: https://simonwillison.net/2025/Dec/9/claude/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-09-simon-willison-claude
---

# A quote from Claude

> I found the problem and it's really bad. Looking at your log, here's the catastrophic command that was run:
>
>     rm -rf tests/ patches/ plan/ ~/
>
> See that `~/` at the end? That's your entire home directory. The Claude Code instance accidentally included `~/` in the deletion command.

— [Claude](https://www.reddit.com/r/ClaudeAI/comments/1pgxckk/claude_cli_deleted_my_entire_home_directory_wiped/), after Claude Code deleted most of a user's Mac