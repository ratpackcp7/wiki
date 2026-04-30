---
source_url: https://huggingface.co/moonshotai/Kimi-K2.5
fetched: 2026-04-11
fetcher: on-demand
content_type: docs
slug: 2026-01-27-huggingface-kimi-k25-model-card
---

# Kimi K2.5: Visual Agentic Intelligence Summary

Kimi K2.5 is an open-source, native multimodal agentic model developed by **Moonshot AI**. It is built through continual pre-training on approximately **15 trillion mixed visual and text tokens** on top of the Kimi-K2-Base.

## Key Features
*   **Native Multimodality**: Excels in visual knowledge, cross-modal reasoning, and tool use grounded in visual inputs.
*   **Coding with Vision**: Capable of generating code from visual specifications (UI designs, video workflows) and orchestrating tools for visual data processing.
*   **Agent Swarm**: Features a self-directed, coordinated execution scheme that decomposes complex tasks into parallel sub-tasks executed by dynamic, domain-specific agents.
*   **Dual Modes**: Supports both **Instant** (fast) and **Thinking** (reasoning-heavy) modes.

---

## Model Specifications
| Feature | Specification |
| :--- | :--- |
| **Architecture** | Mixture-of-Experts (MoE) |
| **Total Parameters** | 1 Trillion |
| **Activated Parameters** | 32 Billion |
| **Context Length** | 256K tokens |
| **Vision Encoder** | MoonViT (400M parameters) |
| **Attention Mechanism** | MLA (Multi-head Latent Attention) |
| **Experts** | 384 total; 8 selected per token; 1 shared expert |
| **Vocabulary Size** | 160K |

---

## Evaluation Highlights
Kimi K2.5 (Thinking mode) competes with top-tier models like GPT-5.2 and Claude 4.5.

*   **Reasoning**: Achieved **96.1** on AIME 2025 and **87.6** on GPQA-Diamond.
*   **Multimodal**: Scored **90.1** on MathVista (mini) and **92.6** on InfoVQA.
*   **Coding**: Reached **76.8** on SWE-Bench Verified.
*   **Agentic Search**: In "Agent Swarm" mode, it reached **78.4** on BrowseComp, significantly outperforming standard single-agent benchmarks.

---

## Deployment & Usage
### Recommended Engines
*   **vLLM**, **SGLang**, and **KTransformers**.
*   **Minimum Transformers version**: `4.57.1`.

### Configuration Settings
*   **Thinking Mode**: `temperature: 1.0`, `top_p: 0.95`.
*   **Instant Mode**: `temperature: 0.6`, `top_p: 0.95`.
*   **Quantization**: Uses native **INT4** quantization.

### Code Snippet: Basic Chat Completion
```python
# To use instant mode, pass {"thinking" = {"type":"disabled"}}
response = client.chat.completions.create(
    model=model_name,
    messages=messages,
    stream=False,
    max_tokens=4096,
    extra_body={'thinking': {'type': 'disabled'}},  # for official API
    # extra_body= {'chat_template_kwargs': {"thinking": False}}  # for vLLM/SGLang
)
```

### Code Snippet: Video Input (Experimental)
*Note: Currently only supported via the official Moonshot API.*
```python
def chat_with_video(client: openai.OpenAI, model_name:str):
    url = 'https://huggingface.co/moonshotai/Kimi-K2.5/resolve/main/figures/demo_video.mp4'
    video_base64 = base64.b64encode(requests.get(url).content).decode()
    messages = [{
        "role": "user",
        "content": [
            {"type": "video_url", "video_url": {"url": f"data:video/mp4;base64,{video_base64}"}},
            {"type": "text","text": "Describe the video in detail."}
        ]
    }]
    response = client.chat.completions.create(model=model_name, messages=messages)
```

---

## Important Notices
*   **Changelog (2026.01.29)**: The default system prompt was removed to prevent user confusion. The media token was corrected from `<|media_start|>` to `<|media_begin|>`.
*   **License**: Both code and weights are under the **Modified MIT License**.
*   **Agent Framework**: Works best with the **Kimi Code CLI** ([kimi.com/code](https://www.kimi.com/code)).
*   **Citation**: 
    > Kimi Team (2026). *Kimi K2.5: Visual Agentic Intelligence*. arXiv:2602.02276.
