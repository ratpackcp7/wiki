---
source_url: https://simonwillison.net/2026/Apr/27/vibevoice/#atom-everything
fetched: 2026-04-28T07:30:00+00:00
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-27
title: "microsoft/VibeVoice"
---

# Microsoft VibeVoice: Summary of Simon Willison’s 2026-04-27 Post
*Source: [Simon Willison’s Weblog](https://simonwillison.net/2026/Apr/27/vibevoice/#atom-everything)*

---

## Core Model Overview
> VibeVoice is Microsoft's Whisper-style audio model for speech-to-text, MIT licensed and with speaker diarization built into the model.

| Detail | Value |
|--------|-------|
| Developer | Microsoft |
| License | MIT |
| Release Date | 21 January 2026 |
| Key Feature | Built-in speaker diarization (no external tool required) |
| Official Repo | [microsoft/VibeVoice](https://github.com/microsoft/VibeVoice) |
| First Tested By Simon | 27 April 2026 (day of post) |

---

## Prerequisites & Test Setup
### Hardware & Dependencies
- **Test device**: 128GB M5 Max MacBook Pro (Apple Silicon)
- **Required tools**:
  - `uv`: Python package manager
  - `mlx-audio`: MLX-optimized audio toolkit by Prince Canuma ([GitHub](https://github.com/Blaizzy/mlx-audio))
  - MLX: Apple Silicon machine learning framework
- **Supported audio formats**: `.wav`, `.mp3` (both tested successfully)

### Models
| Model | Size | Source | Use Case |
|-------|------|--------|----------|
| Full VibeVoice-ASR | 17.3GB | [microsoft/VibeVoice-ASR](https://huggingface.co/microsoft/VibeVoice-ASR/tree/main) | Base model |
| 4-bit MLX Quantized | 5.71GB | [mlx-community/VibeVoice-ASR-4bit](https://huggingface.co/mlx-community/VibeVoice-ASR-4bit) | Optimized for Apple Silicon, used in Simon’s test |

### Test Audio
99.8 minute `.mp3` of Simon’s podcast appearance with Lenny Rachitsky ([source](https://simonwillison.net/2026/Apr/2/lennys-podcast/))

---

## Usage & Actionable Commands
### One-Liner Transcription Command
Exact command to run STT on Mac with `uv` + `mlx-audio`:
```bash
uv run --with mlx-audio mlx_audio.stt.generate \\
  --model mlx-community/VibeVoice-ASR-4bit \\
  --audio lenny.mp3 --output-path lenny \\
  --format json --verbose --max-tokens 32768
```

### Key Flags Explained
- `--max-tokens`: Defaults to `8192` (covers ~25 minutes of audio). Simon quadrupled this to `32768` to transcribe a full hour of audio.
- `--format json`: Outputs transcription as a JSON array of segment objects.
- `--output-path`: Base path for output files.

### Audio Length Limits
> VibeVoice can only handle up to an hour of audio [~59 minutes enforced], so running the above command transcribed just the first hour of the podcast. To transcribe more than that you'd need to split the audio, ideally with a minute or so of overlap so you can avoid errors from partially transcribed words at the split point. You'd also need to then line up the identified speaker IDs across the multiple segments.

The model automatically trims audio longer than 59 minutes (noted in terminal output for the 99.8 minute test file).

---

## Performance & Output
### Processing Stats (Tool Reported)
Exact output from the 99.8 minute (trimmed to 59 min) test run:
```
Processing time: 524.79 seconds
Prompt: 26615 tokens, 50.718 tokens-per-sec
Generation: 20248 tokens, 38.585 tokens-per-sec
Peak memory: 30.44 GB
```

*Note: Activity Monitor showed higher actual RAM usage: 61.5GB during prefill stage, 18GB during generation phase.*

- **Real-world speed**: ~8 minutes 45 seconds to process 59 minutes of audio on M5 Max hardware.

### Output Format
Transcription outputs a JSON array of segment objects with the following structure (example snippet):
```json
{
  "text": "And an open question for me is how many other knowledge work fields are actually prone to these agent loops?",
  "start": 13.85,
  "end": 19.5,
  "duration": 5.65,
  "speaker_id": 0
},
{
  "text": "Now that we have this power, people almost underestimate what they can do with it.",
  "start": 19.5,
  "end": 22.78,
  "duration": 3.280000000000001,
  "speaker_id": 1
},
{
  "text": "Today, probably 95% of the code that I produce, I didn't type it myself. I write so much of my code on my phone. It's wild.",
  "start": 22.78,
  "end": 30.0,
  "duration": 7.219999999999999,
  "speaker_id": 0
}
```

- **Full output**: Available as a [GitHub Gist](https://gist.github.com/simonw/d2c716c008b3ba395785f865c6387b6f)
- **Datasette Lite integration**: The JSON array can be browsed interactively via [Datasette Lite](https://lite.datasette.io/?json=https://gist.github.com/simonw/d2c716c008b3ba395785f865c6387b6f#/data/raw?_facet=speaker_id) (facet by `speaker_id` to filter by speaker).

---

## Speaker Diarization Behavior
- Assigns unique `speaker_id` values to distinct voices.
- **Quirk noted in test**: For a 2-person podcast, the model returned 3 speaker IDs: one for Simon, one for Lenny’s conversation voice, and a separate one for Lenny’s intro/sponsor read voice (which used a different tone).
> Amusingly that Datasette Lite view shows three speakers - it identified Lenny and me for the conversation, and then a separate Lenny for the voice he used for the additional intro and the sponsor reads!

---

## Additional Notes
- **Post sponsor**: Sonar, offe

[... summary truncated for context management ...]
