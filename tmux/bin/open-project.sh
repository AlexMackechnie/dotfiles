#!/bin/bash

PROJECT_LIST=("${HOME}/home/dev" "${HOME}/home/personal")

SESSION_DIR=`for project in ${PROJECT_LIST[@]}
do
  ls -d ${project}/*
done | fzf --layout=reverse --no-preview` 

[ "${SESSION_DIR}" == "" ] && exit 1

SESSION_NAME=$(basename ${SESSION_DIR})

tmux new-session -s "${SESSION_NAME}" -c "${SESSION_DIR}" -d -e "CURRENT_SESSION=${SESSION_NAME}" -e "TMUX_SESSION_DIR=${SESSION_DIR}"
tmux new-window -n 1 -t ${SESSION_NAME}: -c "${SESSION_DIR}"
tmux switch-client -t ${SESSION_NAME}

