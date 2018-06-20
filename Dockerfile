FROM ubuntu:zesty

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu zesty main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
apt-get update
apt-get install ros-lunar-desktop-full
rosdep init
rosdep update
echo "source /opt/ros/lunar/setup.bash" >> ~/.bashrc
source ~/.bashrc
apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential