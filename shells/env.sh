
# ALL CUSTOM ENVIRONMENT PATH SETTINGS GOES HERE
# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
export PATH=$DOTFILES/scripts:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
[[ -d ~/bin ]] && export PATH=~/bin:$PATH
[[ -d /usr/local/sbin ]] && export PATH=/usr/local/sbin:$PATH

# ---------- General -----------------------------------------------------------
# ---- Default Editors ----
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# ---- Hizzle blog ----
export HUGO_BIN="/home/hle/GoProjects/bin/hugo"
export JOURNAL_DIR="$HOME/Documents/hizzle/content/private/journal"
export BLOG_DIR="$HOME/Documents/hizzle"
export HUGO_CONTENT_DIR="$HOME/Documents/hizzle/content"

# ---- FZF - Fuzzy Search ----
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info'

# ---------- Tools -------------------------------------------------------------
# ---- GoLang paths ----
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/GoProjects
export PATH=$PATH:$(go env GOPATH)/bin

# ---- Virtualenvs ----
export WORKON_HOME=$HOME/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# ---- Clion ----
export PATH=$PATH:$HOME/.local/clion/bin


# ---------- Dev development ---------------------------------------------------
# Standard libraries for CTAGS to be generated!
# Any environment variable that starts with LIB, tags will generate

# ---- ESP8266 ----
export PATH=$PATH:$HOME/toolchains/xtensa-lx106-elf/bin
export ESP_SDK=$HOME/toolchains/esp-open-sdk/sdk
# export LIB_ESP="/home/hle/src/esp-open-sdk/xtensa-lx106-elf"

# ---- ESP32 ----
# Toolchains, compiler, linker, etc...
export PATH=$PATH:$HOME/toolchains/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/toolchains/esp-idf

# # ---- Cuda -----
# export PATH=$PATH:/usr/local/cuda/bin
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/lib
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cude/extras/CUPTI/lib64
