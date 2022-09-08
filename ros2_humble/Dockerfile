# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:humble-ros-core-jammy

RUN apt-get update && apt-get install -y \
        sudo \
        vim-gtk \
        xterm \
        iputils-ping \
        tcpdump \
        wget \
        cmake \
        g++ \
    && rm -rf /var/lib/apt/lists/*

# install bootstrap tools
RUN apt-get update && apt-get install -y \
        build-essential \
        git \
        python3-colcon-common-extensions \
        python3-colcon-mixin \
        python3-rosdep \
        python3-vcstool \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*


# setup colcon mixin and metadata
RUN colcon mixin add default \
      https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
    colcon mixin update && \
    colcon metadata add default \
      https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
    colcon metadata update

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        ros-humble-ros-base \
        ros-humble-turtlesim \
        ros-humble-demo-nodes-cpp \
        ros-humble-rviz2 \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache \
        opencv-python

# create user
ENV USERNAME=user
RUN useradd -m ${USERNAME} && echo "${USERNAME}:${USERNAME}" | chpasswd && adduser ${USERNAME} sudo
USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/${USERNAME}/.bashrc
