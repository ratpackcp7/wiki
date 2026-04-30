---
source_url: https://github.com/simonw/justjshtml
fetched: 2026-04-11T10:03:00-05:00
fetcher: on-demand
content_type: docs
slug: simonw-justjshtml-readme
---

# justjshtml: Dependency-free JS HTML5 Parser

**justjshtml** is a high-performance, dependency-free JavaScript port of the Python project [JustHTML](https://github.com/EmilStenstrom/justhtml). Created by Simon Willison, it is designed to work seamlessly in both modern browsers (ES modules) and Node.js.

## Key Features & Status
*   **Zero Dependencies:** No `npm` dependencies; runs as plain JavaScript.
*   **Compatibility:** Works in modern browsers and Node.js (ESM).
*   **Compliance:** Aiming to pass the full `html5lib-tests` suite.
    *   **Tokenizer:** Passing.
    *   **Tree Construction:** Passing (skips `#script-on` fixtures).
    *   **Encoding:** Passing.
    *   **Serializer:** Passing.
*   **Origin Story:** Ported from Python to JS in 4.5 hours using Codex CLI and GPT-5.2.

## Quickstart Guides

### Node.js (ESM)
```js
import { JustHTML, stream } from "./src/index.js";

const doc = new JustHTML("<p class='intro'>Hello <b>world</b></p>");

console.log(doc.toText()); // "Hello world"
console.log(doc.query("p.intro")[0].to_html()); // pretty-printed HTML

for (const [event, data] of stream("<div>Hi</div>")) {
  console.log(event, data);
}
```

### Browser
Import directly from the `./src/` directory. Note: Must be served via HTTP (not `file://`).
```html
<script type="module">
  import { JustHTML } from "./src/index.js";
  const doc = new JustHTML("<p>Hello <b>browser</b></p>");
  console.log(doc.toText()); 
</script>
```

## API Overview

### `new JustHTML(input, options?)`
The `input` can be a `string`, `Uint8Array`, or `ArrayBuffer`.
*   **Options:**
    *   `strict`: Throws `StrictModeError` on parse errors.
    *   `collectErrors`: Populates `doc.errors`.
    *   `encoding`: Manual override for byte input.
    *   `fragmentContext`: For parsing HTML fragments.

### Node Objects & Methods
Nodes are plain objects with a DOM-like API:
*   **Properties:** `name`, `attrs`, `children`, `parent`, `data`, `namespace`.
*   **Methods:**
    *   `.query(selector)`: CSS selector support (e.g., `doc.query("li:first-child")`).
    *   `.toText()`: Extracts text content.
    *   `.toHTML({ pretty: true })`: Serializes to HTML.
    *   `.toMarkdown()`: Renders HTML as Markdown.

### Tokenizer Streaming
The `stream(html)` function yields a simplified event stream:
```js
// Events returned:
["start", [tagName, attrs]]
["end", tagName]
["text", text]
["comment", text]
["doctype", [name, publicId, systemId]]
```

## Development & Testing

### Interactive Playground
An interactive browser UI is available at: [simonw.github.io/justjshtml/playground.html](https://simonw.github.io/justjshtml/playground.html)

### Running Tests Locally
Requires cloning the `html5lib-tests` fixtures:
```shell
git clone https://github.com/html5lib/html5lib-tests tests/html5lib-tests

# Run via Just
just

# Or run specific scripts manually
node scripts/run-tokenizer-tests.js
node scripts/run-tree-construction-tests.js
```

## Attribution
*   **Original Author:** Emil Stenström (JustHTML Python).
*   **Architecture Influence:** `html5ever` (Servo project).
*   **License:** MIT.
