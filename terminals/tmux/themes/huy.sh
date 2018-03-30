# Look n Feel
#-------------------------------------------------
#
# *-attr options accept: none, bright (or bold), dim, underscore, blink,
#                        reverse, hidden, or italics.


set-option -g message-fg colour11
set-option -g message-bg colour236
set-option -g message-attr none
set-option -g message-command-fg colour253
set-option -g message-command-bg colour236
set-option -g message-command-attr none

set-option -g pane-border-fg colour240
set-option -g pane-border-bg default
set-option -g pane-active-border-fg colour4
set-option -g pane-active-border-bg colour235
set-option -g display-panes-active-colour colour220
set-option -g display-panes-colour colour74

set-window-option -g mode-fg colour11
set-window-option -g mode-bg colour236
set-window-option -g mode-attr none

set-window-option -g clock-mode-colour colour64
set-window-option -g clock-mode-style 24

# Background
#-------------------------------------------------
set-window-option -gq window-style "fg=$huy_text,bg=$huy_bg"
set-window-option -gq window-active-style "fg=$huy_text,bg=$huy_bg"
set-window-option -gq pane-active-border-style ''

# Status lines
#-------------------------------------------------

set-option -g status on
set-option -g status-position top
set -g status-justify left

# Refresh 'status-left' and 'status-right' more often
set-option -g status-interval 3

set-option -g status-fg colour239
set-option -g status-bg colour236
set-option -g status-attr default

set-option -g status-left-length 15
set-option -g status-left-fg colour254
set-option -g status-left-bg colour241
set-option -g status-left-attr none
set-option -g status-left '#{?client_prefix,#[fg=colour236]#[bg=colour2],} #S #{?client_prefix,#[fg=colour2],#[fg=colour241]}#[bg=colour235]#[fg=colour234,bg=colour236]░'
set-option -g status-right-fg colour240
set-option -g status-right-bg default
set-option -g status-right-attr none
set-option -g status-right-length 83
set-option -g status-right "#[fg=colour239] #(tmux-mem-cpu-load -i 3) #[fg=colour237]#[fg=colour241] #(pmset -g batt | tail -n +2 | awk '{print $3}' | sed 's/;//') #[fg=colour237]#[fg=colour243] %H:%M #[fg=colour237]#[fg=#000000,bg=$huy_green] #h "


set-window-option -g window-status-fg colour247
set-window-option -g window-status-bg colour236
set-window-option -g window-status-attr none
set-window-option -g window-status-separator ""
set-window-option -g window-status-format " #[fg=colour243]#I#[fg=colour247]#F#[default]#W #[fg=colour236,bg=colour235]#[fg=colour234,bg=default]░"
set-window-option -g window-status-current-fg colour251
set-window-option -g window-status-current-bg colour239
set-window-option -g window-status-current-attr none
set-window-option -g window-status-current-format "#[fg=colour235]░#[fg=colour235]#I#[fg=colour235]#F#[default]#W #[fg=colour238]#[fg=colour239,bg=colour235]#[fg=colour234,bg=colour236]░"

set-window-option -g window-status-activity-fg colour254
set-window-option -g window-status-activity-bg colour236
set-window-option -g window-status-activity-attr none
set-window-option -g window-status-bell-fg colour169
set-window-option -g window-status-bell-bg colour236
set-window-option -g window-status-bell-attr none
set-window-option -g window-status-last-fg colour247
set-window-option -g window-status-last-bg colour236
set-window-option -g window-status-last-attr none

#
