---
source_url: https://simonwillison.net/2026/Feb/19/swe-bench/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2026-02-19-simon-willison-swe-bench
---

# SWE-bench February 2026 leaderboard update

The latest independent run of the SWE-bench leaderboard (February 2026) provides benchmark results that are not self-reported by AI labs, using a standardized "Bash Only" agent harness.

## Top 10 Model Performance (SWE-bench Verified, 500 samples)

| Rank | Model | % Resolved |
| :--- | :--- | :--- |
| 1 | Claude 4.5 Opus (high reasoning) | 76.8% |
| 2 | Gemini 3 Flash (high reasoning) | 75.8% |
| 3 | MiniMax M2.5 (high reasoning) | 75.8% |
| 4 | Claude Opus 4.6 | 75.6% |
| 5 | GLM-5 (high reasoning) | 72.8% |
| 6 | GPT-5.2 (high reasoning) | 72.8% |
| 7 | Claude 4.5 Sonnet (high reasoning) | 72.8% |
| 8 | Kimi K2.5 (high reasoning) | 71.4% |
| 9 | DeepSeek V3.2 (high reasoning) | 70.8% |
| 10 | Claude 4.5 Haiku (high reasoning) | 70.0% |

Key observations:
- Claude 4.5 Opus holds the top spot, outperforming the newer Claude 4.6 Opus by ~1%.
- Four Chinese models (MiniMax M2.5, GLM-5, Kimi K2.5, DeepSeek V3.2) are now in the top ten.
- GPT-5.2 is OpenAI's highest entry at #6. Their specialized coding model GPT-5.3-Codex was not included in this run.
- Every model used the same system prompt and the mini-swe-bench agent (~9,000 lines of Python), ensuring fair comparison.

## Dataset Composition (SWE-bench Verified)
- django/django: 231 samples
- sympy/sympy: 75 samples
- sphinx-doc/sphinx: 44 samples
- matplotlib/matplotlib: 34 samples
- scikit-learn/scikit-learn: 32 samples
- Others: astropy (22), xarray (22), pytest (19), pylint (10), requests (8), seaborn (2), flask (1)

## Claude for Chrome Automation
Willison used Claude for Chrome to modify the live leaderboard website to display percentage values on the bar charts. Claude injected custom JavaScript into the page's Chart.js instance:

```javascript
meta.data.forEach((bar, index) => {
  const value = dataset.data[index];
  if (value !== undefined && value !== null) {
    ctx.save();
    ctx.textAlign = 'center';
    ctx.textBaseline = 'bottom';
    ctx.fillStyle = '#333';
    ctx.font = 'bold 12px sans-serif';
    ctx.fillText(value.toFixed(1) + '%', bar.x, bar.y - 5);
  }
});
```

Resources:
- Official Leaderboard: https://www.swebench.com/
- Dataset Browser: https://lite.datasette.io/?parquet=https%3A%2F%2Fhuggingface.co%2Fdatasets%2Fprinceton-nlp%2FSWE-bench_Verified%2Fresolve%2Fmain%2Fdata%2Ftest-00000-of-00001.parquet#/data/test-00000-of-00001?_facet=repo
- Agent Prompts: https://github.com/SWE-agent/mini-swe-agent/blob/v2.2.1/src/minisweagent/config/benchmarks/swebench.yaml
