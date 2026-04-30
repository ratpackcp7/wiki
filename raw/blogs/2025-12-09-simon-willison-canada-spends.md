---
source_url: https://simonwillison.net/2025/Dec/9/canada-spends/
fetched: 2026-04-11
fetcher: blogwatcher
content_type: blog
slug: 2025-12-09-simon-willison-canada-spends
---

# Under the hood of Canada Spends with Brendan Samek

**Source:** [Simon Willison's Weblog](https://simonwillison.net/2025/Dec/9/canada-spends/)
**Date:** December 9, 2025
**Project Link:** [Canada Spends](https://canadaspends.com/)

## Overview
Simon Willison interviewed Brendan Samek regarding **Canada Spends**, a project by the volunteer-driven non-profit **Build Canada**. The initiative aims to make Canadian government financial data transparent and searchable through a combination of modern data tools and LLM-powered extraction.

## The Tech Stack
The project utilizes a robust open-source stack to handle millions of rows of financial data:
*   **[Datasette](https://datasette.io/):** Used for data exploration, search, and faceting.
*   **[sqlite-utils](https://sqlite-utils.datasette.io/):** For manipulating and managing SQLite databases.
*   **Ruby:** Used for the primary ingestion scripts.
*   **Gemini (LLM):** Employed for extracting structured data from complex PDF documents.
*   **SQLite:** Chosen as the primary distribution format for its portability.

## Key Data Insights
The project maintains a public Datasette instance at [api.canadasbuilding.com](https://api.canadasbuilding.com/) containing over **2 million rows** of data. Key datasets include:

| Dataset | Row Count | Description |
| :--- | :--- | :--- |
| `contracts-over-10k` | 1,172,575 | Detailed procurement and vendor information. |
| `nserc_grants` | 701,310 | Natural Sciences and Engineering Research Council grants. |
| `transfers` | 357,797 | Government transfer payments and expenditures. |
| `sshrc_grants` | 213,085 | Social Sciences and Humanities Research Council data. |
| `cihr_grants` | 53,420 | Canadian Institutes of Health Research data. |

## The "PDF Problem" and LLM Extraction
A significant portion of high-quality financial data is locked in audited financial statements published as PDFs.

> "Brendan has been using Gemini to help extract data from those PDFs. Since this is accounting data the numbers can be summed and cross-checked to help validate the LLM didn't make any obvious mistakes."

### Validation Strategy
Because the data is financial, the team uses a built-in verification method:
1. Extract data using Gemini.
2. Sum the extracted figures.
3. Cross-check against the "Total" lines in the original document to ensure accuracy and catch LLM hallucinations.

## Video Breakdown
The [YouTube interview](https://www.youtube.com/watch?v=T8xiMgmb8po) covers the following specific areas:
*   **02:57:** Data sources and the challenges of PDF formats.
*   **05:51:** Crowdsourcing financial data across Canada.
*   **07:27:** Datasette demo (Search and facets).
*   **12:33:** Deep dive into ingestion code.
*   **17:24:** Data quality "horror stories."
*   **20:46:** Using Gemini for PDF data extraction.
*   **25:24:** Why SQLite is the ideal medium for data distribution.

## Resources
*   **GitHub Repository:** [BuildCanada/CanadaSpends](https://github.com/BuildCanada/CanadaSpends)
*   **Organization Info:** [Build Canada](https://www.buildcanada.com/) (Launched Feb 2025)
*   **Context:** [Inside the civic movement to jolt Canada out of stagnation](https://www.canadianaffairs.news/2025/09/26/builders-at-the-gate-inside-the-civic-movement-to-jolt-canada-out-of-stagnation/)