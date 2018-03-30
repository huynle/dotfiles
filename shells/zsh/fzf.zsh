# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hle/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hle/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hle/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/hle/.fzf/shell/key-bindings.zsh"

