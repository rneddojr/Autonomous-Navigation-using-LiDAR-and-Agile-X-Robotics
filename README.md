# Senior-Design
Autonomous Navigation using LiDAR and Agile X Robotics

#### Product Links
[Livox HAP LiDAR](https://www.livoxtech.com/hap)  
[Agile X Scout Mini](https://global.agilex.ai/products/scout-mini)  
[Intel NUC](https://www.intel.com/content/www/us/en/products/sku/205073/intel-nuc-11-performance-kit-nuc11pahi7/specifications.html)  

#### Following these GitHubs and modifing as needed
https://github.com/hku-mars/loam_livox  
https://github.com/Livox-SDK/livox_ros_driver  
https://github.com/Livox-SDK/Livox-SDK  
  Use 4.3+ to Connect Lidar  

#### Assisting Links
[[1] Install ROS Noetic](https://wiki.ros.org/noetic/Installation/Ubuntu)  
[[2] Install CMake](http://ceres-solver.org/installation.html)  
[[3] Install PCL](https://pointclouds.org/downloads/)  
[[4] Setting up Catkin](https://wiki.nps.edu/display/RC/Setting+up+a+ROS+package+from+Git)  
[[5] Livox 2 Driver Install](https://github.com/Livox-SDK/livox_ros_driver2)

#### Installed Nvidia drivers for Ubuntu
```
sudo gedit /etc/default/grub
sudo update-grub2
sudo apt install nvidia-driver-515 nvidia-dkms-515
```

# From Here skip to bottom

## Prerequisite Set Up

### Install ROS Melodic <sub>[1]</sub>
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-melodic.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo apt update && sudo apt upgrade
source /opt/ros/melodic/setup.bash
```

### Install Curl
```
sudo apt install curl
curl --version
```

### Install CMake <sub>[2]</sub>
```
sudo apt-get install cmake
sudo apt-get install libgoogle-glog-dev libgflags-dev
sudo apt-get install libatlas-base-dev
sudo apt-get install libeigen3-dev
sudo apt-get install libsuitesparse-dev
wget http://ceres-solver.org/ceres-solver-2.1.0.tar.gz
tar zxf ceres-solver-2.1.0.tar.gz
mkdir ceres-bin
cd ceres-bin/
cmake ../ceres-solver-2.1.0
make -j3
make test
sudo make install
```

### Install PCL <sub>[3]</sub>
```
sudo apt install libpcl-dev
```

### Install Git
```
sudo apt install git
```

### Clone Repository and Setup Catkin <sub>[4]</sub>
```
mkdir catkin_ws
mkdir catkin_ws/src
cd catkin_ws/src
sudo git clone https://github.com/hku-mars/loam_livox.git
cd ../
source /opt/ros/melodic/setup.bash
sudo apt-get install python-catkin-tools
catkin_make
source ~/catkin_ws/devel/setup.bash
sudo apt update
sudo apt autoremove
```

### Install C++11 Compilier
```
sudo apt install build-essential
```

### Install Livox SDK 
```
git clone https://github.com/Livox-SDK/Livox-SDK.git
cd Livox-SDK
cd build && cmake ..
make
sudo make install
```

### Install Lidar Drivers
```
git clone https://github.com/Livox-SDK/livox_ros_driver.git ws_livox/src
cd ws_livox
catkin_make
source ./devel/setup.sh
```

### Running LivoxDriver
see config file in **ws_livox/src/livox_ros_driver/config**
param is brodcast code concatnated with launch code
```
roslaunch livox_ros_driver [launch file] [param]
```
EX, For more commands and usage see [Livox_SDK Github](https://github.com/Livox-SDK/Livox-SDK)
```
roslaunch livox_ros_driver livox_lidar_rviz.launch bd_list:="5CWD227EA1001F"
```
serial 5CWD227EA1001F
https://github.com/Livox-SDK/Livox-SDK2
https://github.com/Livox-SDK/Livox-SDK2/wiki/Livox-SDK-Communication-Protocol-HAP(English)
https://github.com/Livox-SDK/livox_ros_driver2
https://terra-1-g.djicdn.com/65c028cd298f4669a7f0e40e50ba1131/Livox%20HAP%20(TX)%20User%20Manual.pdf

## Install Ubuntu 20.04
### Install ROS Noetic <sub>[1]</sub>
```
#### Configure Repositiories
https://help.ubuntu.com/community/Repositories/Ubuntu
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash #Run When Using ROS
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
https://wiki.ros.org/ROS/Tutorials # Testing Ros Install
http://wiki.ros.org/ROS/Installation/TwoLineInstall/ #Use if not installing 
```

### Download Livox ROS Driver 2
```
Be sure to clone the source code in a '[work_space]/src/' folder (as shown above), otherwise compilation errors will occur due to the compilation tool restriction.
git clone https://github.com/Livox-SDK/livox_ros_driver2.git ws_livox/src/livox_ros_driver2
source /opt/ros/noetic/setup.sh
./build.sh ROS1
#### Running Software, More info below
roslaunch livox_ros_driver2 rviz_HAP.launch <sub>[5]</sub>
or 
ros2 launch livox_ros_driver2 rviz_HAP_launch.py
```
sudo ifconfig xxxxxx 192.168.1.50
