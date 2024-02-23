#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <session-name>"
  exit 1
fi

SESSION_NAME="$1"

tmux new-session -d -s "$SESSION_NAME"

tmux split-window -h -p 25

tmux select-pane -t 0
tmux split-window -v -p 20

tmux select-pane -t 2
tmux split-window -v -p 70
tmux split-window -v -p 70

tmux send-keys -t 0 'nano' C-m
tmux send-keys -t 1 'ls' C-m
tmux send-keys -t 3 'watch nvidia-smi' C-m
tmux send-keys -t 2 'ls' C-m
tmux send-keys -t 4 'htop' C-m

tmux attach-session -t "$SESSION_NAME"
