#!/bin/bash
cd /home/robomaker/project_ccc
source /opt/ros/foxy/setup.bash
source /usr/share/gazebo-11/setup.sh
source ./install/setup.sh
export SVGA_VGPU10=0
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=~/ros2_install
export GAZEBO_RESOURCE_PATH=/usr/share/gazebo-11


#these commands are to record ros2 topics, where /dolly/cmd_vel is the name of the topic in this instance
cd /home/robomaker/my_logs
ros2 bag record -o subset /dolly_1/cmd_vel &

exec "${@:1}"
