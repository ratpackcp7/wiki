---
source_url: https://docs.pytest.org/en/stable/how-to/subtests.html
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: pytest-9-subtests
---

# How to Use Subtests in pytest

**Added in version 9.0** (Experimental)
*Note: While the core functionality is stable, reporting behavior may evolve in future releases.*

Pytest subtests allow you to group multiple assertions within a single test function. They serve as a dynamic alternative to parametrization, especially when test values are not known until the test is actually running.

---

## Core Usage
Subtests are implemented via the `subtests` fixture and a context manager. Each failure within a `subtests.test()` block is caught and reported individually without stopping the execution of the rest of the test.

### Basic Example
```python
# content of test_subtest.py

def test(subtests):
    for i in range(5):
        with subtests.test(msg="custom message", i=i):
            assert i % 2 == 0
```

### Reporting Output
Subtest failures are identified by the `SUBFAILED` status. The "top-level" test will report a final failure status if any subtests failed.
* **Successes:** Marked as `u` in quiet mode.
* **Failures:** Reported with specific context (e.g., `[custom message] (i=1)`).

```text
SUBFAILED[custom message] (i=1) test_subtest.py::test - assert (1 % 2) == 0
SUBFAILED[custom message] (i=3) test_subtest.py::test - assert (3 % 2) == 0
FAILED test_subtest.py::test - contains 2 failed subtests
```

---

## Advanced Implementation Details

### Mixing Assertions
You can use multiple subtest blocks and mix them with standard assertions. If a standard assertion (outside a subtest block) fails, the test stops immediately.
```python
def test(subtests):
    for i in range(5):
        with subtests.test("stage 1", i=i):
            assert i % 2 == 0

    assert func() == 10  # Standard assertion: stops test if it fails

    for i in range(10, 20):
        with subtests.test("stage 2", i=i):
            assert i % 2 == 0
```

### Verbosity and Configuration
* **Default:** Only subtest **failures** are shown.
* **Increased Verbosity (`-v`):** Shows progress output for **passed** subtests.
* **Configuration:** Use `verbosity_subtests` in your configuration file to control output levels.

### Type Hinting
For better IDE support and static analysis, use `pytest.Subtests`:
```python
def test(subtests: pytest.Subtests) -> None:
    ...
```

---

## Parametrization vs. Subtests

| Feature | Parametrization | Subtests |
| :--- | :--- | :--- |
| **Timing** | Happens at **collection time**. | Happens during **execution**. |
| **Visibility** | Generates individual, distinct tests. | Dynamic; not known until run. |
| **CLI Access** | Can be referenced/run individually. | Cannot be referenced individually. |
| **Plugins** | Works with `--last-failed`. | Plugins cannot target individual subtests. |
| **Failure Impact** | One failure doesn't stop other params. | One failure doesn't stop other subtests. |
| **Best Use Case** | Decision tables, static data sets. | Dynamic data, values generated at runtime. |

---

## History and Compatibility
Previously available as the `pytest-subtests` plugin, this feature was merged into **pytest core in version 9.0**.
* **Compatibility:** The core version is compatible with the original plugin.
* **Difference:** The core version does not currently include the custom command-line options found in the original plugin for controlling output.
