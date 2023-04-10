# Senior-Design
Autonomous Navigation using LiDAR and Agile X Robotics

#### Product Links
[Livox HAP LiDAR](https://www.livoxtech.com/hap)  
[Agile X Scout Mini](https://global.agilex.ai/products/scout-mini)  
[Intel NUC](https://www.intel.com/content/www/us/en/products/sku/205073/intel-nuc-11-performance-kit-nuc11pahi7/specifications.html)  

#### Following these GitHubs and modifing as needed
https://github.com/hku-mars/loam_livox  

#### Assisting Links
[[1] Configure Repositories](https://help.ubuntu.com/community/Repositories/Ubuntu)  
[[2] Install ROS Noetic](https://wiki.ros.org/noetic/Installation/Ubuntu)  
[[3] Testing Ros Noetic](https://wiki.ros.org/ROS/Tutorials)  
[[4] Debugging Ros Noetic Installation](http://wiki.ros.org/ROS/Installation/TwoLineInstall/)  
[[5] Livox 2 Driver Install](https://github.com/Livox-SDK/livox_ros_driver2)  
[[6] Ros Driver 2 Install](https://github.com/Livox-SDK/livox_ros_driver2)  

#### Additional Rescources
[Livox SDK Communication Protocol for HAP](https://github.com/Livox-SDK/Livox-SDK2/wiki/Livox-SDK-Communication-Protocol-HAP(English))  
[Livox HAP Manual](https://terra-1-g.djicdn.com/65c028cd298f4669a7f0e40e50ba1131/Livox%20HAP%20(TX)%20User%20Manual.pdf)  

## From Fresh Install of Ubuntu 20.04

#### Install Nvidia drivers for Ubuntu
```
sudo gedit /etc/default/grub
sudo update-grub2
sudo apt install nvidia-driver-515 nvidia-dkms-515
```

## Installation Process

### Configure ROS List <sub>[1]</sub>
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
cd
```

## All work should be done in agilex@agilex-NUC....:/ Directory
```
To enter directory run
cd
cd /
```

### Install Curl
```
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
```

### Install ROS Noetic <sub>[2]</sub><sub>[3]</sub><sub>[4]</sub>
```
sudo apt install ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash #Run When Using ROS
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
```

### Install CMake
```
sudo apt-get install cmake
```

### Install Net Tools
```
sudo apt install net-tools
```

### Install Livox2 SDK <sub>[5]</sub>
```
sudo git clone https://github.com/Livox-SDK/Livox-SDK2.git
cd Livox-SDK2/
sudo mkdir build
cd build/
sudo cmake .. && sudo make -j
# Run after modifying configure_HAP.json
sudo make install
```

### Configure HAP IP
```
cd ..
cd samples/livox_lidar_quick_start
sudo nano config_HAP.json
# Edit IPs to 192.168.1.50 and save
cd ../..
cd build
sudo cmake install
```

### Install ROS2 Drivers <sub>[6]</sub>
```

```

## Run Livox2 
```
cd
cd /Livox-SDK2/
sudo ifconfig enp89s0 192.168.1.50
cd samples/livox_lidar_quick_start && ./livox_lidar_quick_start ../../../samples/livox_lidar_quick_start/hap_config.json
```
