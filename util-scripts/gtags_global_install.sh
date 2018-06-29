#!/bin/bash

# this is the website you want to be at
# https://ftp.gnu.org/pub/gnu/global/
## working on geting a listing of the FTP site and installing
# curl 'ftp://ftp.gnu.org/pub/gnu/global/' | awk '{print $(NF)}'
# learn how to use AWK

echo "Installing Global Gtags ...."

echo "install package for GNU global..."
sudo apt-get update
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install ncurses-dev
sudo apt-get -y install exuberant-ctags

sudo apt-get -y install python

CUR=`pwd`
echo "Install GNU global..."
wget http://tamacom.com/global/global-6.5.6.tar.gz
tar zxvf global-6.5.6.tar.gz
cd global-6.5.6
./configure
make
sudo make install
cd $CUR

echo "install pip..."
curl -kL https://bootstrap.pypa.io/get-pip.py | sudo python


echo "install pygments... for other languages"
sudo pip install pygments

echo "$0 done."
exit 0

