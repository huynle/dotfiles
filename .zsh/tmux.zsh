# tmux aliases

# session management
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tls='tmux ls'
alias tss='tmux switch -t'
alias tks='tmux kill-session -t'
alias tk='tmux kill-session'
alias tkkk='tmux kill-server' # extra 'k' to make sure
alias tmd='tmux detach'

# window management
alias tnw='tmux new-window'
alias tnwn='tmux new-window -n'
alias tkw='tmux kill-window'

# pane managemnet
# alias tkp='tmux kill-pane' # the same as bind x


# default mapping, placed here for reference
# C-a (          previous session
# C-a )          next session
# C-a L          ‘last’ (previously used) session
# C-a s          choose a session from a list

# # window stuff
# c  create window
# w  list windows
# n  next window
# p  previous window
# f  find window
# ,  name window
# &  kill window

# # pane stuff
# %  vertical split
# "  horizontal split
#
# o  swap panes
# q  show pane numbers
# x  kill pane
# +  break pane into window (e.g. to select text by mouse to copy)
# -  restore pane from window
# ⍽  space - toggle between layouts
# <prefix> q (Show pane numbers, when the numbers show up type the key to goto that pane)
# <prefix> { (Move the current pane left)
# <prefix> } (Move the current pane right)
# <prefix> z toggle pane zoom
