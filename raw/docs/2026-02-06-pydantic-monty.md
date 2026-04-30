---
source_url: https://github.com/pydantic/monty
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-02-06-pydantic-monty
---

# Monty: A Minimal, Secure Python Interpreter for AI

**Source:** [GitHub — pydantic/monty](https://github.com/pydantic/monty)  
**Fetched:** 2026-04-11  
**Latest Release:** v0.0.11 (April 2026)  
**Status:** Experimental, active development

**Monty** is an experimental, high-performance Python interpreter written in Rust by the Pydantic team. It is specifically designed to run LLM-generated code safely and efficiently without the overhead of traditional sandboxing (like Docker).

## Key Features & Performance
*   **Ultra-Fast Startup:** Starts in **<1μs** (measured at 0.06ms in benchmarks), compared to ~195ms for Docker or ~2800ms for Pyodide.
*   **Strict Security:** Completely blocks access to the host filesystem, environment variables, and network. All external interactions are controlled via developer-defined function calls.
*   **Snapshotting:** The interpreter state can be serialized to bytes (`dump()`) and resumed later (`load()`), allowing for "pause and resume" execution across process boundaries.
*   **Resource Control:** Tracks memory usage, allocations, stack depth, and execution time; cancels execution if limits are exceeded.
*   **Cross-Platform:** No dependencies on CPython; can be called from **Rust, Python, or JavaScript**.
*   **Type Checking:** Includes [ty](https://docs.astral.sh/ty/) for modern Python type hint support.

## Capabilities vs. Limitations

| **What Monty CAN do** | **What Monty CANNOT do (yet)** |
| :--- | :--- |
| Run a subset of Python (logic, loops, functions) | Use the full standard library |
| Call specific host functions provided by the dev | Use third-party libraries (e.g., Pydantic, NumPy) |
| Run async or sync code | Define classes (support coming soon) |
| Collect `stdout` and `stderr` | Use `match` statements (support coming soon) |
| Use `sys`, `os`, `typing`, `asyncio`, `re`, `json` | |

## Usage Examples

### Python: Basic Execution
```python
import pydantic_monty

m = pydantic_monty.Monty('x + 1', inputs=['x'])
# Run synchronously
result = m.run(inputs={'x': 41})
print(result) #> 42
```

### Python: Iterative Execution (Pause & Resume)
Monty allows you to intercept external function calls, perform the work in your host environment, and then feed the result back.
```python
# Start execution - pauses when fetch() is called
result = m.start(inputs={'url': 'https://example.com'})

print(result.function_name)  # fetch
print(result.args)           # ('https://example.com',)

# Resume with the result from the host
final_result = result.resume(return_value='hello world')
print(final_result.output)   # 11
```

### Rust: Basic Execution
```rust
use monty::{MontyRun, MontyObject, NoLimitTracker, PrintWriter};

let runner = MontyRun::new(code.to_owned(), "fib.py", vec!["x".to_owned()]).unwrap();
let result = runner.run(vec![MontyObject::Int(10)], NoLimitTracker, PrintWriter::Stdout).unwrap();
assert_eq!(result, MontyObject::Int(55));
```

## Comparison with Alternatives

| Tech | Security | Start Latency | Snapshotting | Setup Complexity |
| :--- | :--- | :--- | :--- | :--- |
| **Monty** | **Strict** | **0.06ms** | **Easy** | **Easy** |
| Docker | Good | 195ms | Intermediate | Intermediate |
| Pyodide | Poor | 2800ms | Hard | Intermediate |
| WASI | Strict | 66ms | Intermediate | Intermediate |
| YOLO (exec) | None | 0.1ms | Hard | None |

## Ecosystem & Integration
*   **Pydantic AI:** Monty will power "code-mode" in Pydantic AI, allowing LLMs to write Python code that calls tools directly rather than making sequential tool calls.
*   **Go Bindings:** Community-maintained [gomonty](https://github.com/ewhauser/gomonty/).
*   **Installation:** 
    *   Python: `uv add pydantic-monty` or `pip install pydantic-monty`
    *   JS/TS: `npm install @pydantic/monty`
