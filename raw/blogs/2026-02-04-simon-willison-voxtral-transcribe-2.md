---
source_url: https://simonwillison.net/2026/Feb/4/voxtral-2/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2026-02-04-simon-willison-voxtral-transcribe-2
---

# Voxtral Transcribe 2: Mistral's New Speech-to-Text Models

Mistral has released **Voxtral Transcribe 2**, a sequel to their July 2025 Whisper-like model family. The release includes two primary models: an open-weights version for local deployment and a closed-weights version available via API.

## 1. Model Variants & Access

### Open Weights: Voxtral Realtime
*   **Official Name:** `Voxtral-Mini-4B-Realtime-2602`
*   **License:** Apache-2.0
*   **Size:** 8.87GB download.
*   **Availability:** [Hugging Face](https://huggingface.co/mistralai/Voxtral-Mini-4B-Realtime-2602).
*   **Performance:** Highly capable of handling fast speech and technical jargon (e.g., "Django", "WebAssembly") with near-instant latency.

### Closed Weights: API Model
*   **Official Name:** `voxtral-mini-latest`
*   **Pricing:** $0.003/minute ($0.18/hour).
*   **Features:** Supports diarization, context biasing, and granular timestamps.

## 2. Implementation & Usage

### API Example
```shell
curl -X POST "https://api.mistral.ai/v1/audio/transcriptions" \
  -H "Authorization: Bearer $MISTRAL_API_KEY" \
  -F model="voxtral-mini-latest" \
  -F file=@"Pelican talk at the library.m4a" \
  -F diarize=true \
  -F context_bias="Datasette" \
  -F timestamp_granularities="segment"
```

### Mistral API Console Playground
Mistral has introduced a dedicated [speech-to-text playground](https://console.mistral.ai/build/audio/speech-to-text) which provides:
*   **Diarized Transcripts:** Clear speaker separation in a user-friendly interface.
*   **Export Options:** Results can be downloaded in **Text, SRT, or JSON** formats.
*   **Interactive UI:** Includes an audio waveform with synchronized playheads and highlighted text segments.

## 3. Key Insights
*   **Speed:** The "Realtime" model is designed to transcribe almost as quickly as the user speaks.
*   **Accuracy:** Demonstrates high proficiency with niche technical terms.
*   **Context Bias:** The API allows for `context_bias` (e.g., "Datasette"), helping the model correctly identify specific proper nouns or technical terms that might otherwise be misinterpreted.