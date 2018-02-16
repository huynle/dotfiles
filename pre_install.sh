# setup locale
sudo locale-gen us_EN.UFT-8

# getting system setup
apt install -y python-software-properties
apt install -y software-properties-common

# getting zsh up
apt install -y zsh

# adding repo
add-apt-repository -y ppa:neovim-ppa/stable
apt update

# system update
apt update
apt upgrade

# python
apt install -y python-pip python-dev python3-dev python3-pip
pip install --upgrade pip
pip install --upgrade virtualenv
pip install --upgrade virtualenvwrapper

# neovim
apt install -y neovim python-neovim python3-neovim

# dev work
apt install -y build-essential

# tmux
apt install -y autotools-dev automake libncurses-dev libevent-dev

# golang
apt install -y golang-go
