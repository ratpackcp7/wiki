---
source_url: https://simonwillison.net/2026/Feb/4/distributing-go-binaries/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-04-simon-willison-distributing-go-binaries
---

# Distributing Go Binaries via PyPI with go-to-wheel

Simon Willison explores a method for distributing Go-compiled binaries through the Python Package Index (PyPI), allowing users to install and run Go tools using standard Python tools like `pip` and `uv`.

## The Core Concept: Go Binaries as Python Wheels
By packaging Go binaries into Python wheels, developers can leverage PyPI's ability to serve the correct architecture-specific binary (e.g., macOS arm64, Linux x86_64, Windows amd64) automatically.

### Key Benefits
*   **Ease of Installation:** Users can run tools instantly via `uvx package-name` or `pip install`.
*   **Dependency Management:** Go binaries can be listed as dependencies in a Python project's `pyproject.toml`.
*   **Cross-Platform:** Python's packaging ecosystem handles the logic of matching the OS/architecture to the correct pre-compiled binary.

---

## Featured Tool: `sqlite-scanner`
A CLI tool built in Go to demonstrate this distribution pattern. It scans filesystems for SQLite databases by checking for the magic number `SQLite format 3\x00`.

**Usage Examples:**
```bash
# Run without installing using uv
uvx sqlite-scanner ~ /tmp --jsonl --size

# Install permanently
uv tool install sqlite-scanner
```

---

## How the Python Wrapper Works
The wheel contains the compiled binary and a small Python wrapper (`__init__.py`) that locates and executes the binary using `os.execvp` (Unix) or `subprocess.call` (Windows).

### Implementation Snippet:
```python
def get_binary_path():
    binary = os.path.join(os.path.dirname(__file__), "bin", "sqlite-scanner")
    # Ensure binary is executable on Unix
    if sys.platform != "win32":
        current_mode = os.stat(binary).st_mode
        if not (current_mode & stat.S_IXUSR):
            os.chmod(binary, current_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
    return binary

def main():
    binary = get_binary_path()
    if sys.platform == "win32":
        sys.exit(subprocess.call([binary] + sys.argv[1:]))
    else:
        os.execvp(binary, [binary] + sys.argv[1:])
```

---

## Automation with `go-to-wheel`
To simplify this process, Willison created [go-to-wheel](https://github.com/simonw/go-to-wheel), a tool that automates building these Python wheels from Go source.

### Building a Package:
```bash
uvx go-to-wheel ~/dev/sqlite-scanner \
  --set-version-var main.version \
  --version 0.1.1 \
  --readme README.md \
  --author 'Simon Willison' \
  --url https://github.com/simonw/sqlite-scanner \
  --description 'Scan directories for SQLite databases'
```

### Testing and Uploading:
```bash
# Test a specific local wheel
uv run --with dist/sqlite_scanner-0.1.1-py3-none-macosx_11_0_arm64.whl \
  sqlite-scanner --version

# Upload to PyPI
uvx twine upload dist/*
```

---

## Practical Application: `datasette-scan`
As a proof of concept for using Go binaries as Python dependencies, Willison built `datasette-scan`. This Datasette plugin:
1.  Lists `sqlite-scanner` in its `pyproject.toml`.
2.  Calls `sqlite_scanner.get_binary_path()` via `subprocess.run()`.
3.  Allows users to scan and attach databases to Datasette in one command:
    ```bash
    uv run --with datasette-scan datasette scan ~/Downloads
    ```

## Conclusion
While Python can perform many of these tasks natively, Go offers superior speed, concurrency, and a robust standard library for specific tasks (like HTTP tooling or WebAssembly runtimes via `wazero`). This pattern allows Python developers to "subsume" high-performance Go functionality into the Python ecosystem seamlessly.