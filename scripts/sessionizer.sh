#!/usr/bin/env bash

DIRS=(
	~/Documents/projects/
	~/Documents/projects/tutorials/
	~/.config
	~/dotfiles
)

selected=$(
	fd . ${DIRS[@]} --type=dir --max-depth=1 | \
	sed "s|^$HOME/||" | \
	sk
)

[[ ! $selected ]] && exit 1

selected="$HOME/$selected"
basename=$(basename $selected | tr . _)

if ! tmux has-session -t $basename; then
	tmux new-session -ds $basename -c $selected # won't attach
fi

tmux switch-client -t "$basename"
