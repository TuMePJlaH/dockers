ARG BASE_IMAGE=ubuntu:20.04
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

RUN pip3 install -U --no-cache-dir \
        numpy \
        opencv-python \
        ipython \
        open3d
