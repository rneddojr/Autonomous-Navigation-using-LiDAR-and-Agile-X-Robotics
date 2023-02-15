# Senior-Design
Autonomous Navigation using LiDAR and Agile X Robotics

https://www.livoxtech.com/hap
https://global.agilex.ai/products/scout-mini
https://www.intel.com/content/www/us/en/products/sku/205073/intel-nuc-11-performance-kit-nuc11pahi7/specifications.html

https://github.com/hku-mars/loam_livox

sudo gedit /etc/default/grub
sudo update-grub2
sudo apt install nvidia-driver-515 nvidia-dkms-515

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-melodic.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
sudo apt update
sudo apt install ros-melodic-desktop-full

sudo apt update && sudo apt upgrade
sudo apt install curl
curl --version

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
