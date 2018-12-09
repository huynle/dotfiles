# setup locale
locale-gen us_EN.UFT-8

# dev source building tools
apt-get install -y build-essential
apt-get install -y libssl-dev
apt-get install -y autotools-dev automake libncurses-dev libevent-dev

# getting system setup
apt-get install -y python-software-properties
apt-get install -y software-properties-common

# getting zsh up
apt-get install -y zsh

# adding repo
add-apt-repository -y ppa:neovim-ppa/stable

apt-get update
apt-get upgrade

# python
apt-get install -y python-pip python-dev python3-dev python3-pip
pip install --upgrade pip
pip install --upgrade virtualenv
pip install --upgrade virtualenvwrapper

# node install nvm
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | sh -
nvm install 8.9.4

# neovim
apt-get install -y neovim python-neovim python3-neovim

# tmux

# golang
apt-get install -y golang-go

# install ruby gem
apt-get install -y ruby-dev

# install common ubuntu common commands
apt-get install locate
apt-get install usbutils


# install universal tags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
make install
