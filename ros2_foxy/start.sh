#!/bin/bash

docker run -it \
           -d \
           --rm \
           --env="DISPLAY" \
           -e "TERM=xterm-256color" \
           -v  /tmp/.X11-unix:/tmp/.X11-unix:rw \
           --name ros2_foxy \
           --hostname ros2_foxy \
           ros:ros2-foxy-base
