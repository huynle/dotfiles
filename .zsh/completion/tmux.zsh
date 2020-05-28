# function _tmux_completions() {
#   local -a sessions
#   sessions=($(tmux-ls))
#   compadd -a sessions
# }
#
# compdef _tmux_completions tss
