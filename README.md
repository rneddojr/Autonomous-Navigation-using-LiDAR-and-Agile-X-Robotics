# Agilex Scout Mini Navigation and Mapping

This repository provides the necessary workspaces and scripts to enable manual navigation, 2D mapping, and autonomous navigation for the Agilex Scout Mini. It utilizes the Livox HAP LiDAR and Intel NUC to achieve these functionalities. Additionally, this repository includes a comprehensive step-by-step guide to help you set up and get started with the project.

## Key Features
- Manual Navigation: Control the Agilex Scout Mini manually using provided scripts and configurations.
- 2D Mapping: Create 2D maps of the environment using the Livox HAP LiDAR.
- Autonomous Navigation: Implement autonomous navigation capabilities to explore and navigate environments while avoiding obstacles.

## Components
- Agilex Scout Mini: A versatile robotic platform for various navigation tasks.
- Livox HAP LiDAR: Provides accurate environmental perception for mapping and navigation.
- Intel NUC: A compact and powerful computing unit to run the necessary software.


# User Guide

## Prerequisites

Before you begin, ensure you have met the following requirements:
- **Colcon**: Make sure Colcon is installed for building the workspaces. You can install it using:
  <br>
  `sudo apt install python3-colcon-common-extensions`
- **ROS2**: Ensure you have ROS2 Humble installed. Follow the [official ROS 2 installation guide]([https://docs.ros.org/en/rolling/Installation.html](https://docs.ros.org/en/humble/Installation.html)) if needed.

## Installation

1. **Clone the Repository**:
   <br>
   Clone the main repository to your local machine:
   <br>
   `git clone <this.repo>`

3. **Unzip Workspaces**:
   <br>
   Unzip the two workspaces to your desired location. Ensure they are placed in separate directories.

## Building the Workspaces

1. **Navigate to Each Workspace**:
   <br>
   Open a terminal for each workspace and navigate to their respective directories.
   
3. **Build with Colcon**:
   <br>
   Run the following command in each terminal to build the workspaces:
   <br>
   `colcon build`
   <br>
   If build fails.... good luck soldier :>)

5. **Source both work spaces**:
   Run the following command to source both work spaces after they build with no errors:
   <br>
   `source /path/to/lidar_ws/install/setup.sh`
   <br>
   `source /path/to/colcon_ws/install/setup.sh`

## Running Scripts

1. **Move scripts**:
   <br>
   Move each of the scripts `autonav.sh`, `robot_startup.sh`, and `nav2_manual.bash` to your home directory.
3. **Ensure pathing is correcrt**:
   <br> 
   In `robot_startup.sh` ensure that the pathing for the source commands is correct for your environmnet.
4. **Running scripts**:
   <br>
   Now that everything is setup, you should be able to open a terminal and run the scripts
   <br>
   `robot_startup.sh` is the the first command to run. This script will source everything and launch the `nav2_manual.bash`.
   This will allow you to manually navigate and map an area.
   `autonav.sh` is the script that can be used to launch autonomous navigation. REMEMBER to name the map `lab` otherwise the
   script won't work.
