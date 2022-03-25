#! /bin/bash

sudo docker pull ros:foxy-ros-core-focal
cd ~/unicam_project/base_image
sudo docker build -t base_image .
cd ..
cd simulation
sudo docker build -t simulation .
cd ..
cd controller
sudo docker build -t controller .
