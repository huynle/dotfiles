# setup locale
locale-gen us_EN.UFT-8

# dev source building tools
apt install -y build-essential
apt install -y libssl-dev
apt install -y autotools-dev automake libncurses-dev libevent-dev

# getting system setup
apt install -y python-software-properties
apt install -y software-properties-common

# getting zsh up
apt install -y zsh

# adding repo
add-apt-repository -y ppa:neovim-ppa/stable

apt update
apt upgrade

# python
apt install -y python-pip python-dev python3-dev python3-pip
pip install --upgrade pip
pip install --upgrade virtualenv
pip install --upgrade virtualenvwrapper

# node install nvm
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | sh -
nvm install 8.9.4

# neovim
apt install -y neovim python-neovim python3-neovim

# tmux

# golang
apt install -y golang-go

# install ruby gem
apt install -y ruby-dev

# install common ubuntu common commands
apt install locate
apt install usbutils


# install universal tags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
make install
