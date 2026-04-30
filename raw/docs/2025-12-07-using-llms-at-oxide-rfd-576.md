---
source_url: https://rfd.shared.oxide.computer/rfd/0576
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2025-12-07-using-llms-at-oxide-rfd-576
---

# RFD 576: Using LLMs at Oxide

**Author:** Bryan Cantrill  
**Status:** Discussion / Public  
**Core Philosophy:** LLMs are powerful tools, but human judgment must remain "firmly in the loop." Oxide employees bear full responsibility for any artifacts created, regardless of the automation used.

---

## 1. Values in LLM Usage
Oxide evaluates LLM integration through five primary values:

*   **Responsibility (The Lodestar):** Humans are responsible for the output. LLMs act at the behest of humans; their output is the user's responsibility.
*   **Rigor:** LLMs should sharpen thinking by identifying holes in reasoning, not replace "crisp thinking with generated flotsam."
*   **Empathy:** Consider the human on the other end of the language (reader or writer).
*   **Teamwork:** Usage must not undermine trust. Disclosure is complex; sometimes admitting LLM use can erode trust by signaling a distance from responsibility.
*   **Urgency:** Pace must not come at the expense of the other four values.

---

## 2. Functional Roles for LLMs

### LLMs as Readers & Researchers
*   **Strengths:** Superlative at summarization and answering specific questions from large documents (e.g., datasheets).
*   **Privacy Warning:** Ensure **data privacy** when uploading documents. Models must not use Oxide data for training. 
    > "OpenAI shamelessly calls this checked-by-default setting 'Improve the model for everyone', making anyone who doesn't wish the model to train on their data feel as if they suffer from a kind of reactionary avarice."
*   **Research Caution:** Treat LLM research as a "jumping off point." Verify citations, as LLMs may cite other LLM-generated hallucinations.

### LLMs as Editors & Writers
*   **Editing:** Excellent for feedback on structure and phrasing late in the process. Beware of "sycophancy" (breathless praise instead of analysis).
*   **Writing (Discouraged):** LLM-generated prose is often "hackneyed and cliché-ridden."
    *   **The Social Contract:** Writing is an intellectual exertion. If a writer hasn't labored to write, why should a reader labor to read?
    *   **Oxide Standard:** Because Oxide hires specifically for writing ability, employees are expected to use their own voices.
    > "To those who can recognize an LLM's reveals... it's as if the writer is walking around with their intellectual fly open."

### LLMs as Programmers & Debuggers
*   **Programming:** Highly effective for experimental, auxiliary, or throwaway code.
*   **Self-Review Requirement:** LLM-generated code **must** be reviewed by the responsible engineer before being submitted for peer review.
*   **Peer Review Integrity:** Do not address review comments by wholesale re-generation; this makes iterative review impossible.
*   **Debugging:** Useful as an "animatronic rubber duck" to inspire new questions.

---

## 3. LLM Anti-Patterns to Avoid

### LLM Mandates
Oxide rejects executive decrees forcing LLM use. 
> "Executive fiats with respect to LLM usage will not be forthcoming... we trust ourselves to choose the best tool for the job."

### LLM Shaming
Opposition to LLMs should not result in shaming others. LLM use is compared to a "dietary choice"—one may choose to be "vegetarian" (no LLMs), but it is anti-social to register disapproval of another's "entrée."

### LLM Anthropomorphization
Oxide will not engage in giving LLMs personas or treating them as people. 
> "An LLM is (emphatically!) not a person, and in particular cannot be held accountable; to anthropomorphize an LLM is to imply a responsibility that they cannot take."

---

## 4. Determinations
*   **Encouragement:** LLM use is generally encouraged.
*   **Constraint:** Use must be consistent with responsibility to the product, customers, and colleagues.
*   **Internal Resources:** Specific mechanical tips and links are maintained in the internal `LLMs at Oxide` document.
