---
source_url: https://github.com/antirez/flux2.c
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: iris-c-flux2-readme
---

# Iris (iris.c): Pure C Inference for Flux 2

**Iris** is a high-performance inference pipeline for open-weights diffusion transformer models, implemented entirely in **C** with zero external dependencies. Developed by [antirez](https://github.com/antirez), it aims to provide a lightweight, portable alternative to the heavy Python/CUDA ML stack.

## Key Features
*   **Zero Dependencies:** Pure C implementation; works standalone.
*   **Hardware Acceleration:** 
    *   **Metal (MPS):** Native GPU acceleration for Apple Silicon (matches PyTorch performance).
    *   **BLAS:** Optional acceleration via Apple Accelerate (macOS) or OpenBLAS (Linux) for ~30x speedup over generic C.
*   **Memory Efficiency:** Uses **Memory-mapped weights (mmap)** by default.
    *   Reduces peak RAM from ~16GB to **~4-5GB** for 4B models.
    *   Enables inference on 8GB RAM systems where Python stacks fail.
    *   Automatically releases the text encoder after use to free up to 16GB.
*   **Advanced Capabilities:** 
    *   Text-to-Image, Image-to-Image (in-context conditioning), and Multi-reference generation (up to 16 images).
    *   **Terminal Image Display:** Supports Kitty, Ghostty, iTerm2, WezTerm, and Konsole protocols for inline image viewing and step-by-step denoising.
    *   **Size-independent seeds:** Same seed produces similar compositions across different resolutions.

## Quick Start

### 1. Build
```shell
make mps       # Apple Silicon (fastest)
# or: make blas    # Intel Mac / Linux with OpenBLAS
# or: make generic # Pure C, no dependencies
```

### 2. Download Model
```shell
# Download 4B distilled model (~16GB)
./download_model.sh 4b
```

### 3. Generate
```shell
./iris -d flux-klein-4b -p "A woman wearing sunglasses" -o output.png --show
```

## Supported Models

| Model Family | Variant | Steps | License |
| :--- | :--- | :--- | :--- |
| **FLUX.2 Klein** | 4B Distilled | 4 | Commercial-friendly |
| **FLUX.2 Klein** | 4B Base | 50 | Commercial-friendly |
| **FLUX.2 Klein** | 9B Distilled | 4 | Non-commercial |
| **FLUX.2 Klein** | 9B Base | 50 | Non-commercial |
| **Z-Image-Turbo**| 6B | 8-9 | Open |

## Interactive CLI Mode
Start without the `-p` flag to enter the REPL:
*   `prompt`: Standard text-to-image.
*   `$ prompt`: Image-to-image using the last generated result.
*   `$0 $1 combine them`: Multi-reference generation using previous results.
*   **Bang Commands:** `!seed`, `!size`, `!steps`, `!show`, `!save`, `!explore`.

## Performance Benchmarks (Apple M3 Max)

| Resolution | Iris (C + MPS) | PyTorch (MPS) |
| :--- | :--- | :--- |
| 256x256 | **5.2s** | 11s |
| 512x512 | **7.6s** | 13s |
| 1024x1024 | **19s** | 25s |

## C Library API
```c
#include "iris.h"

iris_ctx *ctx = iris_load_dir("flux-klein-4b");
iris_params params = IRIS_PARAMS_DEFAULT;
params.width = 512;
params.height = 512;

iris_image *img = iris_generate(ctx, "A fluffy orange cat", &params);
iris_image_save(img, "cat.png");

iris_image_free(img);
iris_free(ctx);
```

## Advanced Options
*   **Schedules:** Supports `--linear`, `--power` (with `--power-alpha`), and `--sigmoid` (default for Flux).
*   **Metadata:** Generated PNGs include `iris:seed` and `iris:model` in EXIF/Properties for easy reproduction.
*   **Debugging:** Use `--debug-py` to run the C implementation with exact tensors saved from a Python reference script to isolate implementation discrepancies.
*   **Resolution:** Supports 64x64 up to 1792x1792 (multiples of 16 required).
