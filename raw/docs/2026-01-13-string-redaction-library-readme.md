---
source_url: https://github.com/simonw/research/tree/main/string-redaction-library
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-13-string-redaction-library-readme
---

# String Redaction Library: Research Summary

This repository contains a Python-based research project by [Simon Willison](https://github.com/simonw) focused on detecting potential secrets (API keys, tokens, hashes) through statistical analysis of character patterns rather than fixed regex patterns.

## Core Overview
The library identifies strings that deviate from "normal" English word patterns. It is designed to be language-agnostic in its testing approach, using YAML-based test cases to ensure portability across different programming languages.

*   **Primary Goal:** Detect secrets like Base64 data, MD5/SHA hashes, and random alphanumeric tokens.
*   **Methodology:** Statistical scoring based on vowel/consonant ratios, digit distribution, and character clusters.
*   **AI-Generated:** This is an AI-generated research report; all text and code were created by an LLM.

---

## Technical Implementation

### Installation & Usage
The library requires `pyyaml` for testing and configuration.

```python
from redactor import detect_secrets

text = "The API key is xK9mNpQrStVwXyZb and the password is hunter2"
secrets = detect_secrets(text)

for secret in secrets:
    print(f"Found: {secret['value']} at positions {secret['start']}-{secret['end']}")
```

### Detection Algorithm
A token is flagged as a secret if its cumulative score reaches a **threshold of 2**.

#### Positive Indicators (Increase Score)
*   **Vowel Ratio:**
    *   `< 15%`: Very suspicious (+3 score)
    *   `15-25%`: Suspicious (+2)
    *   `25-30%`: Slightly suspicious (+1)
    *   `55-70%`: Unusual (+1)
    *   `> 70%`: Very unusual (+3)
*   **Digit Mixing:** Letters mixed with 10-90% digits (+2).
*   **Consonant Clusters:** Sequences > 6 consonants (+2) or > 5 (+1).

#### Negative Indicators (Decrease Score)
*   **CamelCase/Snake_case:** Likely programming identifiers.
*   **English Affixes:** Common prefixes (un-, re-, dis-) or suffixes (-tion, -ment, -able).
*   **Simple Patterns:** All lowercase/uppercase with no digits.

---

## Test-Driven Development (TDD)
The project emphasizes **cross-language portability** by defining 29 test cases in a YAML format.

**Example `tests.yaml` snippet:**
```yaml
test_cases:
  - name: "test_name"
    input: "text to scan"
    expected:
      - value: "detected_secret"
        start: 0
        end: 15
    description: "What this test verifies"
```

### Detection Examples
| Category | Examples |
| :--- | :--- |
| **Detected (Secrets)** | `xK9mNpQrStVwXyZb`, `d41d8cd98f00b204e9800998ecf8427e`, `zxcvbnmqwrtyp` |
| **Ignored (Normal)** | `extraordinary`, `strengths`, `getUserInformation`, `calculate_total` |

---

## Limitations
1.  **Length Constraint:** Only detects strings **longer than 8 characters**.
2.  **Context Blindness:** Does not look for "key=" or "password=" prefixes; relies solely on the string's internal structure.
3.  **Language Bias:** Parameters are tuned for English; may produce false positives/negatives in other natural languages.
4.  **Sophisticated Secrets:** Secrets specifically crafted to mimic English vowel ratios (~40%) may bypass detection.

---

## File Structure
*   `redactor.py`: The core logic and scoring engine.
*   `test_runner.py`: Executes the YAML-based tests against the Python implementation.
*   `tests.yaml`: 29 language-agnostic test cases.
*   `notes.md`: Development logs and TDD process details.
