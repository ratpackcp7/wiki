---
source_url: https://simonwillison.net/2025/Dec/30/software-heritage/
fetched: 2026-04-11T10:43:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-30-simon-willison-software-heritage
---

# TIL: Downloading archived Git repositories from archive.softwareheritage.org

Back in February I [blogged about](https://simonwillison.net/2025/Feb/7/sqlite-s3vfs/) a neat Python library called `sqlite-s3vfs` for accessing SQLite databases hosted in an S3 bucket, released as MIT licensed open source by the UK government's Department for Business and Trade.

I went looking for it today and found that the [github.com/uktrade/sqlite-s3vfs](https://github.com/uktrade/sqlite-s3vfs) repository is now a 404.

Since this is taxpayer-funded open source software I saw it as my moral duty to try and restore access! It turns out [a full copy](https://archive.softwareheritage.org/browse/origin/directory/?origin_url=https://github.com/uktrade/sqlite-s3vfs) had been captured by [the Software Heritage archive](https://archive.softwareheritage.org/), so I was able to restore the repository from there. My copy is now archived at [simonw/sqlite-s3vfs](https://github.com/simonw/sqlite-s3vfs).

The process for retrieving an archive was non-obvious, so I've written up a TIL and also published a new [Software Heritage Repository Retriever](https://tools.simonwillison.net/software-heritage-repo#https%3A%2F%2Fgithub.com%2Fuktrade%2Fsqlite-s3vfs) tool which takes advantage of the CORS-enabled APIs provided by Software Heritage. Here's [the Claude Code transcript](https://gistpreview.github.io/?3a76a868095c989d159c226b7622b092/index.html) from building that.

Posted 30th December 2025 at 11:51 pm

Tags: archives, git, github, open-source, tools, ai, til, generative-ai, llms, ai-assisted-programming, claude-code
