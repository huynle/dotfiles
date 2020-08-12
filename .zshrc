# quick location for profile
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh
export SHELLRC=$HOME/.zshrc


# # initialize autocomplete
# autoload -U compinit add-zsh-hook
# compinit -D

# display how long all tasks over 10 seconds take
export REPORTTIME=10

# this sets the color for zsh default and will change to screen-256color if in tmux session
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=xterm-256color

# getting characters to show up properly
export LANG=en_US.UTF-8


# turn off legacy ctrl-s issue with buffer
stty -ixon

command_exists() {
    type "$1" > /dev/null 2>&1
}
# alias git to hub
if command_exists hub; then
    eval "$(hub alias -s)"
fi

##################################################
# Start loading all other configs
##################################################
[ -f $ZSH/fzf.zsh ] && source $ZSH/fzf.zsh

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config
# source all .zsh files for completions
for config ($ZSH/**/*completion.zsh) source $config

# source localrc
[ -e ~/.localrc ] && source ~/.localrc

### pyenv setup
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# # Virtualenv
# eval "$(pyenv virtualenv-init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
