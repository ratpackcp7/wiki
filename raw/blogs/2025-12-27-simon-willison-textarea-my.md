---
source_url: https://simonwillison.net/2025/Dec/27/textarea-my/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-27-simon-willison-textarea-my
---

# textarea.my on GitHub

[textarea.my on GitHub](https://github.com/antonmedv/textarea) ([via](https://lobste.rs/s/st1mpl/lightest_notes_app_implementation_111)) Anton Medvedev built [textarea.my](https://textarea.my/), which he describes as:

> A *minimalist* text editor that lives entirely in your browser and stores everything in the URL hash.

It's ~160 lines of HTML, CSS and JavaScript and it's worth reading the whole thing. I picked up a bunch of neat tricks from this!

* `<article contenteditable="plaintext-only">` - I did not know about the `plaintext-only` value, supported across [all the modern browsers](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/contentEditable).
* It uses `new CompressionStream('deflate-raw')` to compress the editor state so it can fit in a shorter fragment URL.
* It has a neat custom save option which triggers if you hit `((e.metaKey || e.ctrlKey) && e.key === 's')` - on [browsers that support it](https://developer.mozilla.org/en-US/docs/Web/API/Window/showSaveFilePicker) (mainly Chrome variants) this uses `window.showSaveFilePicker()`, other browsers get a straight download - in both cases generated using `URL.createObjectURL(new Blob([html], {type: 'text/html'}))`

The `debounce()` function it uses deserves a special note:

```javascript
function debounce(ms, fn) {
  let timer
  return (...args) => {
    clearTimeout(timer)
    timer = setTimeout(() => fn(...args), ms)
  }
}
```

That's really elegant. The goal of `debounce(ms, fn)` is to take a function and a timeout (e.g. 100ms) and ensure that the function runs at most once every 100ms.

This one works using a closure variable `timer` to capture the `setTimeout` time ID. On subsequent calls that timer is cancelled and a new one is created - so if you call the function five times in quick succession it will execute just once, 100ms after the last of that sequence of calls.

Posted 27th December 2025 at 3:23 am
