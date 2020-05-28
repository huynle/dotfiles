# quick location for profile
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh
# export GENERAL=$HOME/shells/general
export SHELLRC=$HOME/.zshrc

command_exists() {
    type "$1" > /dev/null 2>&1
}

# display how long all tasks over 10 seconds take
export REPORTTIME=10

# this sets the color for zsh default and will change to screen-256color if in tmux session
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=xterm-256color

# getting characters to show up properly
export LANG=en_US.UTF-8


# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit -D

for config ($ZSH/**/*completion.zsh) source $config

# turn off legacy ctrl-s issue with buffer
stty -ixon

# Setting DISPLAY for X application to work when calling in terminal with ZSH
# export DISPLAY=:0

# alias git to hub
if command_exists hub; then
    eval "$(hub alias -s)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/nash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##################################################
# Start loading all other configs
##################################################
[ -f $ZSH/fzf.zsh ] && source $ZSH/fzf.zsh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# Load generalrc first 
[ -f $GENERAL/generalrc ] && source $GENERAL/generalrc

# source localrc
[ -e ~/.localrc ] && source ~/.localrc

###### Gcloud Settings ######
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hle/.local/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/home/hle/.local/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hle/.local/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/hle/.local/opt/google-cloud-sdk/completion.zsh.inc'; fi

## Just for chromeos
# export DISPLAY=:0
