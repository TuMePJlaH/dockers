#!/bin/bash
python3 scripts/txt2img.py --prompt "a professional photograph of an astronaut riding a horse" --ckpt /models/v2-1_768-ema-pruned.ckpt --config configs/stable-diffusion/v2-inference-v.yaml --H 768 --W 768  
