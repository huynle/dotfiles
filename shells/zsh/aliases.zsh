# reload zsh config
alias reload!='RELOAD=1 source ~/.zshrc'
## Another way of reloading
function _accept-line() {
    if [[ $BUFFER == "." ]]; then
        BUFFER="source ~/.zshrc"
    fi
    zle .accept-line
}
zle -N accept-line _accept-line

# use neovim as editor
alias vim="nvim"
# alias tmux="env TERM=xterm-256color tmux"


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

# USB info
function devinfo() {
    df -h
    echo "Enter device name..."
    read dev_name
    udevadm info -a -p $(udevadm info -q path -n "$dev_name")
}

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# File size
alias fs="stat -f \"%z bytes\""

# Tmuxinator
alias mux="tmuxinator"

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

