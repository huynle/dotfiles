# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hle/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hle/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"