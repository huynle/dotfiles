# ALL CUSTOM ENVIRONMENT PATH SETTINGS GOES HERE
# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
export PATH=$DOTFILES/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
[[ -d ~/bin ]] && export PATH=~/bin:$PATH
[[ -d ~/.dotfiles/scripts ]] && export PATH=~/.dotfiles/scripts:$PATH
[[ -d /usr/local/sbin ]] && export PATH=/usr/local/sbin:$PATH

# ## Local Development Libraries
# # Notes that these path should be symlinked
# export LIBS=$HOME/.local/lib

# ## Local Development Includes
# # These too should be symlinked
# export INC=$HOME/.local/inc

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# ---------- General -----------------------------------------------------------
# ---- Default Editors ----
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# ---- FZF - Fuzzy Search ----
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info'

# ---- PYENV stuff -----
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
