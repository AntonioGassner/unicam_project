#!/bin/bash
cd /home/robomaker/project_ccc
source /opt/ros/foxy/setup.bash
source /usr/share/gazebo-11/setup.sh
source ./install/setup.sh
export SVGA_VGPU10=0
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=~/ros2_install
export GAZEBO_RESOURCE_PATH=/usr/share/gazebo-11
export ROS_LOG_DIR=/home/robomaker/my_logs
gzserver -r --record path /home/robomaker/my_logs /home/robomaker/project_ccc/src/ccc_pkg/worlds/empty.world --record_encoding txt

exec "${@:1}"
