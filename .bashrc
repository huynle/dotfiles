# quick location for profile
export DOTFILES=$HOME/.dotfiles
export SHELLRC=$HOME/.bashrc

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# editors
export EDITOR='nvim'
export GIT_EDITOR='nvim'

set -o vi
bind '"jk":vi-movement-mode'



# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## Bash settings
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# export NVM_DIR="/home/hle/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


get_crtime() {
    for target in "${@}"; do
        inode=$(stat -c '%i' "${target}")
        fs=$(df  --output=source "${target}"  | tail -1)
        crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | 
        grep -oP 'crtime.*--\s*\K.*')
        printf "%s\t%s\n" "${target}" "${crtime}"
    done
}

# # Start loading all other configsk
# [ -f $BASH/fzf.bash ] && source $BASH/fzf.bash



# export GIT_SSL_NO_VERIFY=1
# export PYTHONWARNINGS="ignore:Unverified HTTPS request"
# export PIP_REQUIRE_VIRTUALENV=false
alias mux='tmux attach -d || tmux new'

# # Load generalrc first 
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# emac GUI
function em()
{
	# -c creates a new frame
	# -a= fires a new emacs server if none is running
	emacsclient -c -a= $*
}
# emac terminal
function emt()
{
	# -c creates a new frame
	# -a= fires a new emacs server if none is running
	emacsclient -t -a= $*
}


# reload zsh config
alias reload='export RELOAD=1 && source $SHELLRC'

# use neovim as editor
alias vi="nvim"
# alias tmux="env TERM=xterm-256color tmux"

##### for cygwin?
# alias tmux="TERM=xterm-256color tmux"
# or can get it to work with this
# alias tmux="tmux -2"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# File size
alias fs="stat -f \"%z bytes\""

# Start OpenVPNO
alias vpn="sudo service openvpn start"

# Change Directory to executable
function whichcd() {
    cd "$(dirname "$(which "$1")")"
}


# quickaccess to journal
alias journal=~/.dotfiles/journal.sh

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done



[ -f $HOME/.cargo.env ] && source "$HOME/.cargo/env"
[ -f $HOME/.localrc ] && source $HOME/.localrc
[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
[ -f $HOME/dotfiles/bin/z.sh ] && source $HOME/.dotfiles/bin/z.sh
