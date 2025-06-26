#!/usr/bin/env bash

FOLDERS=$(find ~/Documents/ ~/Downloads/ ~/.local/ ~/.config/ ~/projects -mindepth 1 -maxdepth 1 -type d)
TMUX_LIST=$(tmux list-sessions -F "#{session_name}" 2> /dev/null)

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(printf "%s\n" "$FOLDERS" "$TMUX_LIST" | fzf --color=default --bind='tab:down,shift-tab:up')
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep -x tmux)

if [[ -z "$TMUX" ]] && [[ -z "$tmux_running" ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
