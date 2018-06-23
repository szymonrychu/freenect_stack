#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/melodic/setup.bash"

[ -e /build/README.md ] || exit 1

export CXXFLAGS=-I\ /usr/include/

sudo mkdir -p /artifacts
sudo chown -R ros /artifacts
sudo chown -R ros /build

rm -Rf /build/freenect_camera/build
rm -Rf /build/freenect_launch/build
rm -Rf /build/freenect_stack/build

mkdir -p /build/freenect_camera/build
mkdir -p /build/freenect_launch/build
mkdir -p /build/freenect_stack/build

cd /build/freenect_camera/build
cmake -DCMAKE_INSTALL_PREFIX=/artifacts ..
make 
sudo make install

cd /build/freenect_launch/build
cmake -DCMAKE_INSTALL_PREFIX=/artifacts ..
make 
sudo make install

cd /build/freenect_stack/build
cmake -DCMAKE_INSTALL_PREFIX=/artifacts ..
make 
sudo make install

cd /artifacts
mkdir -p opt/ros/melodic/
sudo mv share opt/ros/melodic/
sudo chown -R root .
tar -cvzf /build/freenect_stack.tgz ./