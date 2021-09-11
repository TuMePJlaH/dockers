FROM carlasim/carla:0.9.12

USER root
RUN apt-get update && apt-get install -y \
        xdg-user-dirs \
        xdg-utils \
        libomp5 \
        sudo \
        vim \
        libjpeg-dev \
        libtiff-dev \
        software-properties-common \
        python3.7 \
        python3.7-dev \
    && rm -rf /var/lib/apt/lists/*

#RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 && \
    #update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 && \
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

RUN pip3 install --no-cache-dir pygame==2.0.1 \
                                carla==0.9.12 \
                                Pillow==8.3.2 \
                                numpy==1.21.2

RUN python3 -m pip install -r /home/carla/PythonAPI/examples/requirements.txt
