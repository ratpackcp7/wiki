---
source_url: https://simonwillison.net/2026/Feb/8/libkrun-go-cli-tool/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-08-simon-willison-libkrun-go-cli-tool
---

# Research: krunsh

Krunsh is a minimal Go CLI tool that executes newline-delimited shell commands inside an ephemeral KVM-based microVM, leveraging the libkrun library for lightweight virtualization. By piping commands from stdin, krunsh spins up a microVM, runs the specified commands using `/bin/sh -c`, captures the output, and discards the VM afterward, ensuring zero persistent state and strong process isolation.

Source: https://github.com/simonw/research/tree/main/libkrun-go-cli-tool
