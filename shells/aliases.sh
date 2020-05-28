# reload zsh config
alias reload='export RELOAD=1 && source $SHELLRC'

# use neovim as editor
alias vim="nvim"

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

# File size
alias fs="stat -f \"%z bytes\""

# fiind large files
alias largefiles='sudo find / -type f -exec du -Sh {} + | sort -rh | head -n 5'
