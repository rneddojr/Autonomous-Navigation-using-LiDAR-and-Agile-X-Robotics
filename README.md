# Senior-Design
Autonomous Navigation using LiDAR and Agile X Robotics

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

#### Assisting Links
[[1] Install ROS Noetic](https://wiki.ros.org/noetic/Installation/Ubuntu)  
[[2] Install CMake](http://ceres-solver.org/installation.html)  
[[3] Install PCL](https://pointclouds.org/downloads/)  
[[4] Setting up Catkin](https://wiki.nps.edu/display/RC/Setting+up+a+ROS+package+from+Git)  
[[5] Livox 2 Driver Install](https://github.com/Livox-SDK/livox_ros_driver2)
https://wiki.ros.org/ROS/Tutorials # Testing Ros Install  
http://wiki.ros.org/ROS/Installation/TwoLineInstall/ #Use if not installing  
https://help.ubuntu.com/community/Repositories/Ubuntu  
https://github.com/Livox-SDK/Livox-SDK2/wiki/Livox-SDK-Communication-Protocol-HAP(English)  

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

## Replace and Make Files
```
in ~/scout_ws/
Create a file "create_timestamp.py"
Copy from [create_timestamp.py]()
```

```
Replace camel-aax as needed with your username
in ~/scout_ws/src/scout_ros/scout_bringup/launch/
Create a "file scout_mini_SLAM.launch"
Copy from [scout_mini_SLAM.launch]()
```

```
in ~/scout_ws/src/livox_ros_driver2/config/
Replace "HAP_config.json"
Replace with [HAP_config.json]()
in ~/scout_ws/src/livox_ros_driver2/launch_ROS1/
Replace "rviz_HAP.launch"
Replace Broadcast code in "<arg name="bd_list" default="5CWD227EA1001F1"/>" as needed with your code "5CWD227EA1001F1"
Replace with [rviz_HAP.launch]()
```

```
in ~/scout_ws/src/loam_livox/source/
Replace "livox_feature_extractor.hpp"
Replace with [livox_feature_extractor.hpp]()
in ~/scout_ws/src/loam_livox/source/
Replace "laser_mapping.hpp"
Replace with [laser_mapping.hpp]()
in ~/scout_ws/src/loam_livox/lauch/
Replace "livox.launch"
Replace with [livox.launch]()
```

## Prep for Building
```
cd
cd Desktop
mkdir RosBags
sudo ifconfig enp89s0 192.168.1.50 #Sets IP Address of LiDAR to Ethernet
can ifconfig #Sets CAN IP
cansend #Enables CAN communication
cd ~/scout_ws/
catkin_make
source devel/setup.bash
```

## Running ROS and Launch File
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
