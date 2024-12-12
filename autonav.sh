gnome-terminal --tab -- bash -c 'ros2 launch nav2_bringup bringup_launch.py use_sim_time:=False autostart:=False map:=~/lab.yaml'
gnome-terminal --tab -- bash -c 'ros2 run rviz2 rviz2 -d /opt/ros/humble/share/nav2_bringup/rviz/nav2_default_view.rviz'
