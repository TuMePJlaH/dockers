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


RUN curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - && sudo apt-get install -y nodejs

# create user
ENV USERNAME=user
RUN useradd -m ${USERNAME} && echo "${USERNAME}:${USERNAME}" | chpasswd && adduser ${USERNAME} sudo
USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"

RUN echo "alias make_website='f(){ npx create-docusaurus@latest \$1 classic; }; f'" >> /home/${USERNAME}/.bashrc

#WORKDIR /websites/test_web
#ENTRYPOINT ["npx", "docusaurus", "start"]
