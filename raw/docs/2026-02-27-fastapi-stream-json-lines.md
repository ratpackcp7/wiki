---
source_url: https://fastapi.tiangolo.com/tutorial/stream-json-lines/
fetched: 2026-04-11T00:00:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-02-27-fastapi-stream-json-lines
---

# Stream JSON Lines - FastAPI

FastAPI (version 0.134.0+) provides built-in support for streaming data using the JSON Lines format. This allows applications to send data items to a client incrementally without waiting for the entire sequence to be ready.

## Understanding JSON Lines
JSON Lines (`.jsonl`) is a format where each line in the response body is a valid JSON object, separated by a newline character (`\n`).
- **Content-Type:** `application/jsonl`
- **Structure:** Unlike a standard JSON array `[...]`, JSON Lines does not use wrapping brackets or commas between items.
- **Technical Constraint:** Individual JSON objects cannot contain literal newlines (they must be escaped as `\n`), though FastAPI handles this automatically during serialization.

## Implementation with `yield`
Use `yield` instead of `return` within your path operation function.

### Async Implementation
```python
from collections.abc import AsyncIterable
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class Item(BaseModel):
    name: str
    description: str | None

@app.get("/items/stream")
async def stream_items() -> AsyncIterable[Item]:
    for item in items:
        yield item
```

### Synchronous Implementation
```python
from collections.abc import Iterable

@app.get("/items/stream-no-async")
def stream_items_no_async() -> Iterable[Item]:
    for item in items:
        yield item
```

## Key Benefits of Type Annotations
- **Validation:** FastAPI validates each yielded item against the Pydantic model.
- **Documentation:** The stream structure is automatically included in the OpenAPI/Swagger UI.
- **Performance:** Pydantic serializes data on the Rust side, offering significantly higher performance than standard `jsonable_encoder`.
- **Filtering:** Automatic data filtering based on the model definition.

## Use Cases
- AI LLM responses, real-time logs, telemetry, and large datasets structured as JSON objects.
- For binary data streaming (video/audio), see Stream Data docs.
- For complex streaming with metadata, see SSE documentation.
