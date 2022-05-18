# install:
# - download tensorrt from https://developer.nvidia.com/tensorrt
# - change TENSORRT_PATH


#ARG BASE_IMAGE=ubuntu:20.04
#ARG BASE_IMAGE=nvidia/cuda:11.3.1-base-ubuntu20.04
ARG BASE_IMAGE=nvcr.io/nvidia/pytorch:22.01-py3

FROM ${BASE_IMAGE} as dev-base

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN apt-get update && apt-get install -y --no-install-recommends \
        #build-essential \
        #ca-certificates \
        #ccache \
        #cmake \
        #curl \
        #git \
        #libjpeg-dev \
        #python3.8-dev \
        #python3-pip \
        #libpng-dev && \
    #rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
        ffmpeg \
        libsm6 \
        libxext6 && \
    rm -rf /var/lib/apt/lists/*

#RUN pip3 install -U --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cu113 \
#RUN pip3 install -U --extra-index-url https://download.pytorch.org/whl/cu113 \
        #torch \
        #torchvision

#RUN pip3 install -U \
        #opencv-python \
        #imgaug \
        #albumentations \
        #onnx
RUN pip3 install -U \
        imgaug \
        albumentations

#RUN pip3 install -U \
        #pycuda \
        #nvidia-pyindex \
        #nvidia-tensorrt

RUN pip3 install -U \
        pycuda

# create user
ENV USERNAME=user
RUN useradd -m ${USERNAME} && echo "${USERNAME}:${USERNAME}" | chpasswd && adduser ${USERNAME} sudo
USER ${USERNAME}
WORKDIR /home/${USERNAME}

