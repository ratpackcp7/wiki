---
source_url: https://fastapi.tiangolo.com/advanced/stream-data/
fetched: 2026-04-11T00:00:00-05:00
fetcher: blogwatcher
content_type: blog
slug: 2026-02-27-fastapi-stream-data
---

# Stream Data - FastAPI

FastAPI provides built-in support for streaming pure binary data or strings using `StreamingResponse`. Added in FastAPI 0.134.0.

## Use Cases
- AI LLM Services: streaming text output character-by-character or line-by-line.
- Large Binary Files: sending chunks as they are read to avoid high memory consumption.
- Media Streaming: sending video or audio data generated or processed on the fly.

## Implementation with `StreamingResponse`
Declare `response_class=StreamingResponse` in your path operation and use `yield` to send data chunks.

```python
from collections.abc import AsyncIterable
from fastapi import FastAPI
from fastapi.responses import StreamingResponse

app = FastAPI()

@app.get("/story/stream", response_class=StreamingResponse)
async def stream_story() -> AsyncIterable[str]:
    for line in ["Part 1", "Part 2", "Part 3"]:
        yield line
```

## Key Technical Details
- **No Automatic Conversion:** FastAPI sends each chunk "as is." It does not attempt to convert data to JSON or serialize via Pydantic.
- **Freedom & Responsibility:** You are responsible for encoding data (e.g., `.encode("utf-8")`).
- **Type Annotations:** Optional for `StreamingResponse`. FastAPI does not use these annotations for validation in streaming responses.

## Handling Files and Blocking Operations
If streaming logic involves blocking I/O, use regular `def` instead of `async def`. FastAPI will automatically run it in a separate threadpool.

```python
from collections.abc import Iterable

@app.get("/image/stream-no-async", response_class=StreamingResponse)
def stream_image_no_async() -> Iterable[bytes]:
    with open("large_image.png", "rb") as image_file:
        for chunk in image_file:
            yield chunk
```

## Custom Streaming Responses
```python
class PNGStreamingResponse(StreamingResponse):
    media_type = "image/png"
```

## Important Considerations
- **Resource Management:** Always use `with` blocks when opening files.
- **Memory Efficiency:** Streaming allows processing files larger than available RAM.
- **Async Helper:** Use [Asyncer](https://asyncer.tiangolo.com/) to mix blocking and async code.
