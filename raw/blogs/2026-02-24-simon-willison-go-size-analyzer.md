---
source_url: https://simonwillison.net/2026/Feb/24/go-size-analyzer/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-24-simon-willison-go-size-analyzer
---

# go-size-analyzer

The Go ecosystem is _really_ good at tooling. I just learned about this tool for analyzing the size of Go binaries using a pleasing treemap view of their bundled dependencies.

You can install and run the tool locally, but it's also compiled to WebAssembly and hosted at [gsa.zxilly.dev](https://gsa.zxilly.dev/) - which means you can open compiled Go binaries and analyze them directly in your browser.

I tried it with a 8.1MB macOS compiled copy of my Go [Showboat](https://github.com/simonw/showboat) tool and got this:

![Treemap visualization of a Go binary named "showboat" showing size breakdown](https://static.simonwillison.net/static/2026/showboat-treemap.jpg)

Posted 24th February 2026 at 4:10 pm

Tags: go, webassembly, showboat
