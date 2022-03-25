#! /bin/bash

#commands to build all images relative to our project, change directories accordingly if your file structure is different for some reason
sudo docker pull ros:foxy-ros-core-focal
cd ~/unicam_project/base_image
# -t is used to tag the image, the base_image after it is the name. change at your own risk, since the subsequent images use the base_image
sudo docker build -t base_image .
cd ..
cd simulation
sudo docker build -t simulation .
cd ..
cd controller
sudo docker build -t controller .
