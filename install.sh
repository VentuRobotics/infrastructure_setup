#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update && sudo apt upgrade
sudo apt install -y apt-transport-https ca-certificates gnupg gnupg2 gnupg-agent libssl-dev git curl file wget zip unzip pkg-config openssh-client openssh-server xterm tmux gdb valgrind htop net-tools nmap lynx libx11-dev vim iputils-ping

sudo apt install -y bash-completion
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc

sudo apt install -y build-essential clang cmake ccache ninja-build
sudo apt install -y libboost-all-dev libeigen3-dev
sudo apt install -y python3 python3-dev python3-pip python3-future
pip3 install --upgrade wheel setuptools argcomplete pandas pyyaml jsonschema jinja2 toml numpy scipy

echo "export CC=/usr/lib/ccache/gcc" >> ~/.bashrc
echo "export CXX=/usr/lib/ccache/g++" >> ~/.bashrc

# ROS2
sudo apt install -y ros-humble-ros-base
sudo apt install ros-dev-tools

echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
echo "export ROS_LOCALHOST_ONLY=0" >> ~/.bashrc
echo "export ROS_DOMAIN_ID=0" >> ~/.bashrc

wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master && make && sudo make install
rm -r master.zip
rm -r pigpio-master

