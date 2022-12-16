#!/bin/bash
git clone https://github.com/facebookresearch/xformers.git
cd xformers
git submodule update --init --recursive
pip install -r requirements.txt
pip install -e .
cd ..

git clone https://github.com/Stability-AI/stablediffusion.git
cd stablediffusion
pip install -r requirements.txt
pip install -e .
cd ..
