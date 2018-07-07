# Look n Feel
#-------------------------------------------------
#
# *-attr options accept: none, bright (or bold), dim, underscore, blink,
#                        reverse, hidden, or italics.


set -g message-fg colour11
set -g message-bg colour236
set -g message-attr none
set -g message-command-fg colour253
set -g message-command-bg colour236
set -g message-command-attr none

# set -g pane-border-fg colour250
# set -g pane-border-bg default
# # set -g pane-border "fg=$huy_text,bg=$huy_bg"
# set -g pane-active-border-fg colour4
# set -g pane-active-border-bg colour235
# set -g pane-active-border "fg=$huy_text,bg=$huy_bg"
set -g display-panes-active-colour colour220
set -g display-panes-colour colour74

set -g mode-fg colour11
set -g mode-bg colour236
set -g mode-attr none

set -g clock-mode-colour colour64
set -g clock-mode-style 24

# Background
#-------------------------------------------------
set -g window-style "fg=$huy_text,bg=$huy_bg"
set -g window-active-style "fg=$huy_text,bg=$huy_bg"
set -g pane-active-border-style "fg=$huy_green,bg=$huy_bg"
set -g pane-border-style "fg=$huy_text,bg=$huy_bg"

# Status lines
#-------------------------------------------------

set -g status on
set -g status-position top
set -g status-justify left

# Refresh 'status-left' and 'status-right' more often
set -g status-interval 3

set -g status-fg colour239
set -g status-bg colour236
set -g status-attr default

set -g status-left-length 15
set -g status-left-fg colour254
set -g status-left-bg colour241
set -g status-left-attr none
set -g status-left '#{?client_prefix,#[fg=colour236]#[bg=colour2],} #S #{?client_prefix,#[fg=colour2],#[fg=colour241]}#[bg=colour235]#[fg=colour234,bg=colour236]░'
set -g status-right-fg colour240
set -g status-right-bg default
set -g status-right-attr none
set -g status-right-length 83
set -g status-right "#[fg=colour239] #(tmux-mem-cpu-load -i 3) #[fg=colour237]#[fg=colour241] #(pmset -g batt | tail -n +2 | awk '{print $3}' | sed 's/;//') #[fg=colour237]#[fg=colour243] %H:%M #[fg=colour237]#[fg=#000000,bg=$huy_green] #h "


set -g window-status-fg colour247
set -g window-status-bg colour236
set -g window-status-attr none
set -g window-status-separator ""
set -g window-status-format " #[fg=colour243]#I#[fg=colour247]#F#[default]#W #[fg=colour236,bg=colour235]#[fg=colour234,bg=default]░"
set -g window-status-current-fg colour251
set -g window-status-current-bg colour239
set -g window-status-current-attr none
set -g window-status-current-format "#[fg=colour235]░#[fg=colour235]#I#[fg=colour235]#F#[default]#W #[fg=colour238]#[fg=colour239,bg=colour235]#[fg=colour234,bg=colour236]░"

set -g window-status-activity-fg colour254
set -g window-status-activity-bg colour236
set -g window-status-activity-attr none
set -g window-status-bell-fg colour169
set -g window-status-bell-bg colour236
set -g window-status-bell-attr none
set -g window-status-last-fg colour247
set -g window-status-last-bg colour236
set -g window-status-last-attr none

#
