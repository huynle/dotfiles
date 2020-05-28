# reload zsh config
alias reload='export RELOAD=1 && source $SHELLRC'

# use neovim as editor
alias vim="vi"
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

