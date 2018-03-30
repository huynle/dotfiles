
# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# editors
export EDITOR='vim'
export GIT_EDITOR='vim'

# Virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virutalenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# GoLang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/GoProjects

export PATH=$PATH:$(go env GOPATH)/bin

# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info'

# hizzle blog
export HUGO_BIN="/home/hle/GoProjects/bin/hugo"
export JOURNAL_DIR="$HOME/Documents/hizzle/content/private/journal"
export BLOG_DIR="$HOME/Documents/hizzle"

# Custom Paths
# add /usr/local/sbin
if [[ -d /usr/local/sbin ]]; then
    export PATH=/usr/local/sbin:$PATH
fi

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

light(){
    export THEME="one"
    export BACKGROUND="light"
}

dark(){
    export THEME="one"
    export BACKGROUND="dark"
}

bg(){
    # init vim and run to make sure that the tmuxline is set
    [ -f ~/.vim/init.vim ] && vim +so ~/.vim/init.vim +qall
}

dark
