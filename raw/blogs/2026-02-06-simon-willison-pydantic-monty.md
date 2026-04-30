---
source_url: https://simonwillison.net/2026/Feb/6/pydantic-monty/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-06-simon-willison-pydantic-monty
---

# Running Pydantic's Monty Rust sandboxed Python subset in WebAssembly

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2026/Feb/6/pydantic-monty/)  
**Date:** February 6, 2026  
**Topic:** Sandboxing, WebAssembly, Python, Rust, LLM Security

---

## Overview of Monty
[Monty](https://github.com/pydantic/monty) is a custom Python-like language (a subset of Python) implemented in Rust by the Pydantic team. It is designed specifically for safely running LLM-generated code without the overhead of full container-based sandboxes.

### Key Features & Capabilities
*   **Performance:** Startup times measured in **single-digit microseconds**.
*   **Security:** Completely blocks access to the host environment (filesystem, environment variables, network).
*   **Control:** Host access is only possible via explicit external function calls defined by the developer.
*   **LLM Compatibility:** While it supports a very small subset of Python (e.g., no class declarations yet), LLMs can effectively iterate against its error messages to find compatible code patterns.

---

## Quick Start (Local)
You can test Monty locally using `uv`:

```bash
uv run --with pydantic-monty python -m asyncio
```

**Example Usage (Python Prompt):**
```python
import pydantic_monty
code = pydantic_monty.Monty('print("hello " + str(4 * 5))')
await pydantic_monty.run_monty_async(code)
```

---

## WebAssembly Implementation
Simon Willison used **Claude Code** to research and compile Monty into WebAssembly, creating a "sandbox-in-a-sandbox" (running a sandboxed Python subset inside a browser's WASM sandbox).

### Two Deployment Methods
1.  **Direct WASM Bundle:** A `.wasm` file that can be loaded and called directly from JavaScript.
2.  **Pyodide Wheel:** A `.whl` file (`pydantic_monty-0.0.3-cp313-cp313-emscripten_4_0_9_wasm32.whl`) that can be installed into [Pyodide](https://pyodide.org/) to run Monty within a full CPython-in-WASM environment.

### Live Demos
*   [Monty WASM Demo](https://simonw.github.io/research/monty-wasm-pyodide/demo.html): UI over JS loading the Rust WASM module directly.
*   [Monty Pyodide Demo](https://simonw.github.io/research/monty-wasm-pyodide/pyodide-demo.html): Loads Pyodide first, then installs the Monty wheel.

---

## Key Insights for Developers
*   **Sandboxing Strategy:** Monty is ideal for applications where you need to execute untrusted logic (like LLM output) with strict limits on memory, CPU, and I/O without the latency of Docker or Firecracker.
*   **AI-Assisted Porting:** The project demonstrates the power of "coding agents" (like Claude Code) to handle complex cross-compilation tasks, such as turning a Rust library into a Pyodide-compatible WebAssembly wheel.
*   **Tooling:** The research produced a [final report and build scripts](https://github.com/simonw/research/tree/main/monty-wasm-pyodide) that serve as a template for converting other Rust/Python projects to WASM.

> "Monty avoids the cost, latency, complexity and general faff of using full container based sandbox for running LLM generated code." — *Pydantic Monty Documentation*
