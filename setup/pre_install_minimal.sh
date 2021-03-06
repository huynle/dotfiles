# setup locales


## DEBIAN
# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

if [ "$DISTRO"  == *"Debian"* ]; then
    apt-get install debconf
fi

# locale-gen us_EN.UFT-8

## First thing first. Install git
apt-get install -y git

# # dev source building tools
# apt-get install -y build-essential
# apt-get install -y libssl-dev
# apt-get install -y autotools-dev automake libncurses5-dev libevent-dev
# apt-get install -y python-neovim python3-neovim
# apt-get install -t ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# # getting system setup
# apt-get install -y python-software-properties
# apt-get install -y software-properties-common

# # getting zsh up
# apt-get install -y zsh

# # build and install neovim
# git clone https://github.com/neovim/neovim.git /tmp/
# cd /tmp/neovim
# make
# make install


# # python
# apt-get install -y python-pip python-dev python3-dev python3-pip
# pip install --upgrade pip
# pip install --upgrade virtualenv
# pip install --upgrade virtualenvwrapper

# # node install nvm
# curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | sh -
# nvm install 8.9.4

# # tmux
# # removing /tmp/tmux if exists
# rm -rf /tmp/tmux
# # cloning from official repo
# git clone https://github.com/tmux/tmux.git /tmp/tmux
# # simple cd
# cd /tmp/tmux
# # execute autogen
# sh autogen.sh
# # configure and compile binaries
# ./configure && make
# # install binaries into sys
# sudo make install
# # previous dir
# cd -
# # remove downloaded files
# rm -rf /tmp/tmux






# # golang
# apt-get install -y golang-go

# # install ruby gem
# apt-get install -y ruby-dev

# # install common ubuntu common commands
# apt-get install locate
# apt-get install usbutils


# # install universal tags
# git clone https://github.com/universal-ctags/ctags.git
# cd ctags
# ./autogen.sh 
# ./configure
# make
# make install
