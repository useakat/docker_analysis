#!/bin/bash

apt-get -y update
apt-get -y upgrade

# install Chef
apt-get -y install curl
curl -L http://www.opscode.com/chef/install.sh | bash
cd ${CHEFHOME} && chef-solo -c ${CHEFHOME}/solo.rb -j ${CHEFHOME}/nodes/docker.json

# install developper tools
apt-get -y install wget
apt-get -y install git
apt-get -y install build-essential
apt-get -y install zlib1g-dev
apt-get -y install cython
apt-get -y install tclsh
#RUN apt-get -y install python

mkdir /root/packages
cd /root/packages

# # install python 
# wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
# tar zxvf Python-2.7.10.tgz
# Python-2.7.10/configure --enable-shared --with-zlib=/usr/include
# make
# make install
# echo "include /usr/local/bin >> /etc/ld.so.conf"
# ldconfig
# echo "# Python ENV" >> /root/.bashrc
# echo "export LD_LIBRARY_PATH=/usr/local/lib/python2.7/:$LD_LIBRARY_PATH" >> /root/.bashrc
# rm -rf Python-2.7.10 Python-2.7.10.tgz

# install numpy
git clone https://github.com/numpy/numpy
python numpy/setup.py build
python numpy/setup.py install
rm -rf numpy

# install ROOT
wget https://root.cern.ch/download/root_v5.34.34.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
tar zxvf root_v5.34.34.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
echo "# ROOT ENV" >> /root/.bashrc
echo "export ROOTSYS=$PACKAGES/root" >> /root/.bashrc
echo "export PATH=$ROOTSYS/bin:$PATH" >> /root/.bashrc
echo "export LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH" >> /root/.bashrc
source /root/.bashrc
rm -rf root_v5.34.34.Linux-ubuntu14-x86_64-gcc4.8.tar.gz

## install CheckMATE
wget http://www.hepforge.org/archive/checkmate/CheckMATE-1.2.2.tar.gz
tar zxvf CheckMATE-1.2.2.tar.gz
cd CheckMATE-1.2.2
./configure --with-rootsys=/root/packages/root
make
cd bin
./CheckMATE testparam.dat
cd ..
rm -rf CheckMATE-1.2.2.tar.gz
