# Senior-Design
Autonomous Navigation using LiDAR and Agile X Robotics

#### Product Links
[Livox HAP LiDAR](https://www.livoxtech.com/hap)  
[Agile X Scout Mini](https://global.agilex.ai/products/scout-mini)  
[Intel NUC](https://www.intel.com/content/www/us/en/products/sku/205073/intel-nuc-11-performance-kit-nuc11pahi7/specifications.html)

#### Following these GitHubs and modifing as needed
https://github.com/hku-mars/loam_livox
https://github.com/Livox-SDK/livox_ros_driver

#### Assisting Links
[[1] Install ROS Melodic](https://varhowto.com/install-ros-melodic-ubuntu-18-04/)  
[[2] Install CMake](http://ceres-solver.org/installation.html)  
[[3] Install PCL](https://pointclouds.org/downloads/)  
[[4] Setting up Catkin](https://wiki.nps.edu/display/RC/Setting+up+a+ROS+package+from+Git)  

#### Installed Nvidia drivers for Ubuntu
```
sudo gedit /etc/default/grub
sudo update-grub2
sudo apt install nvidia-driver-515 nvidia-dkms-515
```

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
```

### Install Lidar Drivers

## Building and Run
