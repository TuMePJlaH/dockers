ARG BASE_IMAGE=pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
FROM ${BASE_IMAGE} as dev-base

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

run apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        ccache \
        cmake \
        sudo \
        curl \
        git \
        wget \
        vim-gtk \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends \
        libjpeg-dev \
        libpng-dev \
        ffmpeg \
        libsm6 \
        libxext6 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
        python3-dev \
        python3-distutils \
        python3-pip \
        python3-tk \
        python3.8-dev \
    && rm -rf /var/lib/apt/lists/*

RUN ln -f -s /usr/bin/python3.8 /usr/bin/python3 && \
    curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 -

# create user
ENV USERNAME=user
RUN useradd -m ${USERNAME} && echo "${USERNAME}:${USERNAME}" | chpasswd && adduser ${USERNAME} sudo
USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

RUN git clone https://github.com/Stability-AI/stablediffusion.git &&\
    cd stablediffusion &&\
    pip3 install -r requirements.txt &&\
    pip3 install -e . &&\
    cd ..

RUN git clone https://github.com/facebookresearch/xformers.git &&\
    cd xformers &&\
    git submodule update --init --recursive &&\
    pip3 install -r requirements.txt &&\
    pip3 install -e . &&\
    cd ..

RUN pip3 install -U --no-cache-dir \
        transformers==4.19.2 \
        diffusers \
        invisible-watermark \
        omegaconf \
        pytorch_lightning \
        open_clip_torch

COPY --chown=${USERNAME} install.sh install.sh
RUN chmod +x install.sh

#RUN git clone https://github.com/Stability-AI/stablediffusion.git &&\
    #cd stablediffusion &&\
    #pip install -e .

# install xformers
#RUN git clone https://github.com/facebookresearch/xformers.git &&\
    #cd xformers &&\
    #git submodule update --init --recursive &&\
    #pip install -r requirements.txt &&\
    #pip install -e . &&\
    #cd ..

