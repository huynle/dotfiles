#!/bin/bash

## ALTERNATIVELY
# sudo apt-get install -y libevent-dev libncurses-dev build-essential


# exit on error
set -e

# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files for tmux, libevent, and ncurses
wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
git clone https://github.com/tmux/tmux.git



############
# libevent #
############
tar xvzf libevent-2.0.19-stable.tar.gz
cd libevent-2.0.19-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux  #
############
export CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"
export LDFLAGS="-L$HOME/local/lib"

cd tmux
# sh autogen.sh
./configure --prefix="$HOME/local"
make
make install
# sudo cp tmux /usr/local/bin

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
