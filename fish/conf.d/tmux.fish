if not set -q TMUX
#     set -g TMUX tmux new-session -d -s trial
#     eval $TMUX
#     tmux attach-session -d -t trial
  # tmux -L trial -f ~/.tmux-alacritty.conf new-session -d -s trial
tmux -L trial -f ~/.tmux-alacritty.conf new-session -d -s trial
  tmux -L trial attach -t trial
end
