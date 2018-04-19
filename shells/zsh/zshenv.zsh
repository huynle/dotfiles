## ALL PATH goes here
# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
export PATH=$DOTFILES/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
[[ -d ~/bin ]] && export PATH=~/bin:$PATH
[[ -d /usr/local/sbin ]] && export PATH=/usr/local/sbin:$PATH

# GoLang paths
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/GoProjects
export PATH=$PATH:$(go env GOPATH)/bin

# Default Editors
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# Virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virutalenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# Clion
export PATH=$PATH:$HOME/.local/clion/bin

# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info'

# hizzle blog
export HUGO_BIN="/home/hle/GoProjects/bin/hugo"
export JOURNAL_DIR="$HOME/Documents/hizzle/content/private/journal"
export BLOG_DIR="$HOME/Documents/hizzle"
export HUGO_CONTENT_DIR="$HOME/Documents/hizzle/content"


# Standard libraries for CTAGS to be generated!
# Any environment variable that starts with LIB, tags will generate
export LIB_ESP="/home/hle/src/esp-open-sdk/xtensa-lx106-elf"




BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
