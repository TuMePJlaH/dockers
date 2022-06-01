FROM carlasim/carla:0.9.13

USER root

RUN apt-key del 7fa2af80 2>&1 1>/dev/null && \
    . /etc/os-release && \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${ID}`echo $VERSION_ID | tr -d '.'`/`uname --machine`/3bf863cc.pub 2>&1 1>/dev/null  \
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/${ID}`echo $VERSION_ID | tr -d '.'`/`uname --machine`/7fa2af80.pub 2>&1 1>/dev/null

RUN apt-get update && apt-get install -y \
        xdg-user-dirs \
        xdg-utils \
        libomp5 \
        sudo \
        vim \
        libjpeg-dev \
        libtiff-dev \
        software-properties-common \
        python3.7-dev \
        fontconfig \
    && rm -rf /var/lib/apt/lists/*

RUN rm /usr/bin/python3 && \
    ln -s python3.7 /usr/bin/python3

RUN apt-get update && apt-get install -y \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

# create user
ENV USERNAME=carla
RUN echo "${USERNAME}:${USERNAME}" | chpasswd && adduser ${USERNAME} sudo
USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENV PATH="/home/carla/.local/bin:${PATH}"
RUN echo 'export PATH=/home/carla/.local/bin:$PATH' >> /home/carla/.bashrc

RUN echo $PATH
RUN pip3 install --no-cache-dir pygame==2.0.1 \
                                carla==0.9.13 \
                                Pillow==8.3.2 \
                                numpy==1.21.2 \
                                networkx

RUN python3 -m pip install -r /home/carla/PythonAPI/examples/requirements.txt


