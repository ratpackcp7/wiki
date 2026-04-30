---
title: FastAPI
created: 2026-04-11
updated: 2026-04-11
type: stack
tags: [python, fastapi, backend, api, streaming]
sources:
  - url: https://github.com/fastapi/fastapi/releases/tag/0.134.0
    fetched: 2026-04-11
  - url: https://fastapi.tiangolo.com/tutorial/stream-json-lines/
    fetched: 2026-04-11
  - url: https://fastapi.tiangolo.com/advanced/stream-data/
    fetched: 2026-04-11
  - url: https://simonwillison.net/2026/Feb/27/claude-max-oss-six-months/
    fetched: 2026-04-11
last_verified: 2026-04-11
churn_rate: high
confidence: unverified
version_pinned: "0.134.0"
---

# FastAPI

## Version in use

0.134.0 (as of 2026-02-27 release). Starlette dependency bumped to `>=0.46.0`.

## Key concepts

1. **Streaming with `yield`** — 0.134.0 added native support for streaming JSON Lines and binary data via `yield` in path operations. No need for manual `StreamingResponse` wrapping for structured data.
2. **JSON Lines format** — Content-Type `application/jsonl`. Each line is a valid JSON object. Ideal for LLM responses, real-time logs, telemetry.
3. **Binary streaming** — `StreamingResponse` for raw bytes/strings. FastAPI sends chunks as-is, no serialization.
4. **Pydantic v2 Rust serialization** — JSON Lines streaming uses Pydantic's Rust-side serialization, significantly faster than `jsonable_encoder`.

## Conventions

- Use `AsyncIterable[Model]` for async path ops, `Iterable[Model]` for sync
- Sync generators run in threadpool automatically (no event loop blocking)
- `StreamingResponse` type annotations are optional — FastAPI doesn't validate them

## Gotchas

- **Range requests + compression** — HTTP Range requests are incompatible with compression because byte offsets shift. Use `'Accept-Encoding': 'identity'` (relevant for binary streaming over HTTP).
- **Exception groups** — 0.134.0 requires Starlette ≥0.46.0 to properly unwrap/re-raise exceptions from exception groups during streaming.
- **Blocking I/O in async** — File-like objects are blocking. Use `def` (not `async def`) for file streaming; FastAPI handles threadpool dispatch.

## Recent changes

- **2026-02-27 — FastAPI 0.134.0**: Streaming JSON Lines + binary data with `yield`. Starlette ≥0.46.0. New docs for Stream JSON Lines and Stream Data. ([release](https://github.com/fastapi/fastapi/releases/tag/0.134.0))

## Chris's preferences

- See `chris-preferences.md#fastapi` for Chris's stance.
- Delta from best practice: [TBD — no FastAPI section in chris-preferences yet]
- Last sync with chris-preferences: 2026-04-11
