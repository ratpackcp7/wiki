---
source_url: https://huggingface.co/black-forest-labs/FLUX.2-klein-4B
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: flux2-klein-4b-huggingface
---

# FLUX.2 [klein] 4B

The **FLUX.2 [klein] 4B** is a 4-billion parameter rectified flow transformer developed by Black Forest Labs. It is designed to be the fastest model in the FLUX family, unifying image generation and editing into a single compact architecture optimized for real-time performance on consumer hardware.

## Key Features & Performance
*   **Sub-second Inference:** Capable of end-to-end inference in under one second.
*   **Unified Architecture:** Supports text-to-image, image-to-image, and multi-reference editing in one model.
*   **Hardware Efficiency:** Runs on consumer GPUs (e.g., RTX 3090/4070) with as little as **13GB VRAM**.
*   **License:** Fully open under **Apache 2.0**, allowing for commercial use.
*   **Target Use Cases:** Interactive workflows, latency-critical applications, and edge deployment.

## API and Ecosystem Support
*   **Official API:** Available via [bfl.ai](https://bfl.ai/).
*   **Platforms:** Integrated into **ComfyUI** and **Diffusers**.
*   **Reference Code:** Available at the [official GitHub repository](https://github.com/black-forest-labs/flux2).

## Using with Diffusers
```python
import torch
from diffusers import Flux2KleinPipeline

device = "cuda"
dtype = torch.bfloat16

pipe = Flux2KleinPipeline.from_pretrained("black-forest-labs/FLUX.2-klein-4B", torch_dtype=dtype)
pipe.enable_model_cpu_offload()

prompt = "A cat holding a sign that says hello world"
image = pipe(
    prompt=prompt,
    height=1024,
    width=1024,
    guidance_scale=1.0,
    num_inference_steps=4,
    generator=torch.Generator(device=device).manual_seed(0)
).images[0]
image.save("flux-klein.png")
```

## Responsible AI & Mitigations
1.  **Data Filtering:** Partnered with the **IWF** to remove CSAM and NSFW content from pre-training data.
2.  **Safety Fine-tuning:** Targeted rounds of fine-tuning to inhibit the generation of NCII.
3.  **Content Provenance:** Implements **pixel-layer watermarking** and supports **C2PA metadata** standards.
4.  **Inference Filters:** Includes built-in filters for NSFW and protected content.

## Model Details
- **Parameters:** 4 Billion
- **License:** Apache 2.0
- **VRAM Req:** ~13GB
- **Primary Task:** Text-to-Image / Multi-reference Editing
