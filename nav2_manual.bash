#!/bin/bash

# Nav2 Setup Script
# gnome-terminal --tab -- bash -c 'sudo ip link set up can0 type can bitrate 500000; exec bash'
# sleep 2
sudo ip link set up can0 type can bitrate 500000;
gnome-terminal --tab -- bash -c 'ros2 launch scout_mini_base base_launch.py; exec bash'
sleep 2
gnome-terminal --tab -- bash -c 'ros2 launch scout_mini_description description_launch.py; exec bash'
sleep 2
gnome-terminal --tab -- bash -c 'ros2 launch livox_ros_driver2 rviz_HAP_launch.py; exec bash'
sleep 2
gnome-terminal --tab -- bash -c 'ros2 launch pointcloud_to_laserscan sample_pointcloud_to_laserscan_launch.py; exec bash'
sleep 2
gnome-terminal --tab -- bash -c 'ros2 launch nav2_bringup navigation_launch.py; exec bash'
sleep 3
gnome-terminal --tab -- bash -c 'ros2 launch slam_toolbox online_async_launch.py; exec bash'
sleep 3
gnome-terminal --tab -- bash -c 'rviz2; exec bash'
sleep 2
gnome-terminal --tab -- bash -c 'ros2 run teleop_twist_keyboard teleop_twist_keyboard; exec bash'
