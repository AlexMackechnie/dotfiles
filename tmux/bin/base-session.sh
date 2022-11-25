#!/bin/bash

SESSION_DIR=${HOME}
SESSION_NAME=$(uuidgen)

tmux new-session -s "${SESSION_NAME}" -c "${SESSION_DIR}" -d -e "CURRENT_SESSION=${SESSION_NAME}" -e "TMUX_SESSION_DIR=${SESSION_DIR}"
tmux new-window -n 1 -t ${SESSION_NAME}: -c "${SESSION_DIR}"
tmux switch-client -t ${SESSION_NAME}

