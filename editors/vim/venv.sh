#!/usr/bin/zsh

# Declare a base path for both virtual environments
venv="${XDG_CACHE_HOME:-$HOME/.cache}/vim/venv"

# Try to detect virtualenv's executable names
vrenv=virtualenv

# Ensure python 2/3 virtual environments
[ -d "$venv" ] || mkdir -p "$venv"
[ -d "$venv/neovim2" ] || $vrenv -p python2 "$venv/neovim2"
[ -d "$venv/neovim3" ] || $vrenv -p python3 "$venv/neovim3"

# Install or upgrade dependencies
echo 'PYTHON 2'
"$venv/neovim2/bin/pip" install -U neovim PyYAML
echo 'PYTHON 3'
"$venv/neovim3/bin/pip" install -U neovim PyYAML
