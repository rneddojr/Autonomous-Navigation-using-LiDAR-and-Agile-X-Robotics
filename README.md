# Autonomous Navigation using LiDAR and Agile X Robotics

### Project Overview
The purpose of this project is to develop an autonomous navigation robot that utilizes a LiDAR (Light Detection and Ranging) sensor for environmental perception. The robot will be capable of exploring and navigating its surroundings while avoiding obstacles and reaching its designated target locations.

<p align="center">
<img src="https://github.com/hovliu7/Autonomous-Navigation-using-LiDAR-and-Agile-X-Robotics/assets/113165390/99fd96ef-8f15-4ae4-8352-bb2b6d710298" width="300" height=auto>
</p>

### Main Objectives
- Build a robot platform capable of autonomous movement
- Integrate a Livox HAP LiDAR sensor for accurate environmental perception
- Implement algorithms for obstacle detection, localization, mapping, and path planning

#### Components Used
- Agile X Scout Mini
- Livox HAP LiDAR
- Intel NUC

#### Product Links
[Livox HAP LiDAR](https://www.livoxtech.com/hap)  
[Livox HAP Manual](https://terra-1-g.djicdn.com/65c028cd298f4669a7f0e40e50ba1131/Livox%20HAP%20(TX)%20User%20Manual.pdf)  
[Agile X Scout Mini](https://global.agilex.ai/products/scout-mini)  
[Intel NUC](https://www.intel.com/content/www/us/en/products/sku/205073/intel-nuc-11-performance-kit-nuc11pahi7/specifications.html)  

#### Sourcing and modifying these GitHubs
https://github.com/hku-mars/loam_livox  
https://github.com/Livox-SDK/livox_ros_driver2  
https://github.com/Livox-SDK/Livox-SDK2  
https://github.com/agilexrobotics/scout_ros  
https://github.com/agilexrobotics/ugv_sdk  
https://github.com/Livox-SDK/LIO-Livox

#### Assisting Links
[[1] Install ROS Noetic](https://wiki.ros.org/noetic/Installation/Ubuntu)  
[[1.5]Testing ROS Install](https://wiki.ros.org/ROS/Tutorials)  
[[2] Install CMake](http://ceres-solver.org/installation.html)  
[[3] Install PCL](https://pointclouds.org/downloads/)  
[[4] Setting up Catkin](https://wiki.nps.edu/display/RC/Setting+up+a+ROS+package+from+Git)  
[[5] Livox HAP Communication Protocol](https://github.com/Livox-SDK/Livox-SDK2/wiki/Livox-SDK-Communication-Protocol-HAP(English))  
[[6] Agile X Scout Mini Manual](https://agilexrobotics.gitbook.io/scout-mini/)  

#### Installed Nvidia drivers for Ubuntu 20.04 LTS
```
sudo gedit /etc/default/grub
sudo update-grub2
sudo apt install nvidia-driver-515 nvidia-dkms-515
```

## Install Dependencies
```
sudo apt-get update
sudo apt-get install build-essential git cmake libasio-dev
sudo apt install curl
sudo apt update
```

## Install ROS Noetic
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc #Automatically set up your ROS environment every time you open a new terminal
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
```

## Download Repositories
Be sure to clone the source code in a '[work_space]/src/' folder (as shown above), otherwise compilation errors will occur due to the compilation tool restriction.  
```
cd
mkdir scout_ws
cd scout_ws
mkdir src
```

### Download Scout ROS and UGV SDK
```
cd ~/scout_ws/src
git clone https://github.com/westonrobot/scout_mini_ros.git
git clone https://github.com/westonrobot/ugv_sdk.git
cd ~/scout_ws
catkin_make #Build workspace
sudo apt-get install ros-noetic-teleop-twist-keyboard ros-noetic-gmapping ros-noetic-navigation ros-noetic-robot-localization ros-noetic-robot-state-publisher ros-noetic-tf2-ros ros-noetic-joint-state-publisher-gui
echo "source ~/scout_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

### Download Livox ROS Driver 2
```
cd ~/scout_ws/src
git clone https://github.com/Livox-SDK/livox_ros_driver2.git scout_ws/src/livox_ros_driver2
source /opt/ros/noetic/setup.sh
./build.sh ROS1
```

### Download Livox SDK2
```
cd ~/scout_ws/src
git clone https://github.com/Livox-SDK/Livox-SDK2.git
cd ./Livox-SDK2/
mkdir build
cd build
cmake .. && make -j
sudo make install
```

### Download Loam Livox
```
cd ~/scout_ws/src
git clone https://github.com/hku-mars/loam_livox.git
cd ..
catkin_make
source ~/scout_ws/devel/setup.bash
```

### Download LIO-Livox
```
cd ~/scout_ws/src
git clone https://github.com/Livox-SDK/LIO-Livox
cd ..
catkin_make
source ~/scout_ws/devel/setup.bash
```

### Download Livox Viewer 2
https://www.livoxtech.com/downloads

**Note:** Livox Viewer 2 should be used for sensor calibration, not recording or playback.

## Replace and Make Files

### Make Timestamp Script
```
in ~/scout_ws/
```
Copy and paste "create_timestamp.py" from [create_timestamp.py](https://github.com/rneddojr/Senior-Design/blob/e2a79f152e29b8d243bf4a20a389bbf67025c939/Modified%20Files/scout_ws/generate_timestamp.py)  

### Make Launch File
```
Replace camel-aax as needed with your username in [scout_mini_SLAM.launch]()
in ~/scout_ws/src/scout_ros/scout_bringup/launch/
```
Copy and paste "scout_mini_SLAM.launch" from [scout_mini_SLAM.launch](https://github.com/rneddojr/Senior-Design/blob/e2a79f152e29b8d243bf4a20a389bbf67025c939/Modified%20Files/scout_ros/scout_mini_SLAM.launch)  

### Replace HAP Config Files in livox_ros_driver2
```
in ~/scout_ws/src/livox_ros_driver2/config/
```
Replace "HAP_config.json" with [HAP_config.json](https://github.com/rneddojr/Senior-Design/blob/e2a79f152e29b8d243bf4a20a389bbf67025c939/Modified%20Files/livox_ros_driver2/HAP_config.json)  

```
in ~/scout_ws/src/livox_ros_driver2/launch_ROS1/
Replace Broadcast Code on line 4 -> "<arg name="bd_list" default="5CWD227EA1001F1"/>" as needed with your Broadcast Code"
```
Replace "rviz_HAP.launch" with [rviz_HAP.launch](https://github.com/rneddojr/Senior-Design/blob/e2a79f152e29b8d243bf4a20a389bbf67025c939/Modified%20Files/livox_ros_driver2/rviz_HAP.launch)  

### Replace Loam Livox Files
```
in ~/scout_ws/src/loam_livox/source/
```
Replace "livox_feature_extractor.hpp" with [livox_feature_extractor.hpp](https://github.com/rneddojr/Senior-Design/blob/7aa66395e12f355f1e93b3b16e21ab42f7f850e7/Modified%20Files/loam_livox/livox_feature_extractor.hpp)  
Replace "laser_mapping.hpp" with [laser_mapping.hpp](https://github.com/rneddojr/Senior-Design/blob/7aa66395e12f355f1e93b3b16e21ab42f7f850e7/Modified%20Files/loam_livox/laser_mapping.hpp)  
```
in ~/scout_ws/src/loam_livox/lauch/
```
Replace "livox.launch" with [livox.launch](https://github.com/rneddojr/Senior-Design/blob/7aa66395e12f355f1e93b3b16e21ab42f7f850e7/Modified%20Files/loam_livox/livox.launch)

## Prep for Building and Running
```
cd
cd Desktop
mkdir RosBags
sudo ifconfig enp89s0 192.168.1.50 #Sets IP Address of LiDAR to Ethernet
cd ~/scout_ws/
catkin_make
source devel/setup.bash
```
## Debugging LiDAR Sensor Ethernet Connection
- Ensure you've ran ```sudo ifconfig enp89s0 192.168.1.50```
- Ensure Scout Mini is turned on
- Disconnect and reconnect Ethernet cable
- Reinstall network drivers ```sudo apt-get install --reinstall network-manager```

## CAN Communication Protocol
### Sending CAN Commands
```
In terminal 1
sudo modprobe gs_usb #Enable gs_usb kernel module
rosrun scout_bringup bringup_can2usb.bash
candump can0 #Receive feedback from scout
```

```
In terminal 2
roslaunch scout_bringup scout_mini_robot_base.launch #Start base node for scout
```

```
In terminal 3
cansend can0 XXX#XXXXXXXXXXXXXXXX #Send CAN command
sudo ip link set can0 down #Terminate CAN communication
```
**Note:** Follow the CAN protocol specified in the Scout Mini Manual. There is a typo in the manual for the Lighting Control Frame. For byte[1], 0x00 turns the light off, 0x01 turns the light on.

### CAN Command Examples
```
cansend can0 121#0101000000000000 #Turn front light on
cansend can0 111#0253000000000000 #Move forward at speed 0x0253, or 595
```
### CAN Command Demos
- [Command Line Demo](https://drive.google.com/file/d/1JWojCHcbzEAMnAI4b12Tmhp2bgChU7Zl/view?usp=sharing)
- [Light Control Demo](https://drive.google.com/file/d/1s4NVZNYDPPRmtYOqYJhTozvBBnVOqBCM/view?usp=drive_link)
- [Motion Control Demo](https://drive.google.com/file/d/11IXTkided4yueLuCGPYPKCNaQgbwu8Y1/view?usp=sharing)


## Running ROS and Launch File for Recording with RViz
```
In terminal 1
in ~/scout_ws/
roscore
```

```
In terminal 2
in ~/scout_ws/
roslaunch scout_bringup scout_mini_SLAM.launch timestamp:=$(python3 generate_timestamp.py)
```

```
In terminal 3
killall roscore #Stops ROS
```

```
In terminal 4
cansend
```

## Running ROS and Playing Rosbags with RViz
```
In terminal 1
in ~/scout_ws/
roscore
```

```
In terminal 2
in ~/scout_ws/
rosrun rviz rviz
```

select config with file --> open 
```
config/recent/display_point_cloud
```

```
In terminal 3
rosbag play "/path to file/rosbag.bag"
```

## Next Steps
- Experiment with Livox Viewer 2 for sensor calibration. We want to ensure that the sensor is calibrated before recording and processing data.
- Implement SLAM (Simultaneous Localization and Mapping) using LOAM Livox or LIO Livox. LIO Livox is inherently supports the HAP Sensor.
- Implement real-time navigation using a combination of SLAM and CAN commands.
