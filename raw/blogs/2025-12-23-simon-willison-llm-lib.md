---
source_url: https://simonwillison.net/2025/Dec/23/llm-lib/
fetched: 2026-04-11T00:00:00-05:00
fetcher: on-demand
content_type: blog
slug: 2025-12-23-simon-willison-llm-lib
---

# llm-lib demo

A unified JavaScript library for OpenAI, Anthropic, and Gemini.

Live demo: https://tools.simonwillison.net/llm-lib

## Usage

```javascript
// Include the library
import { LLM } from './llm-lib.js';

// Create an instance
const llm = new LLM({
  provider: 'openai', // 'openai' | 'anthropic' | 'gemini'
  apiKey: 'your-api-key',
  model: 'gpt-4.1',
  systemPrompt: 'You are helpful.'
});

// Non-streaming
const response = await llm.prompt('Hello!');

// Streaming
for await (const chunk of llm.stream('Tell me a story')) {
  process.stdout.write(chunk);
}
```

Posted 23rd December 2025 at 6:18 am.

This is a **beat** by Simon Willison.