#!/bin/sh

TARGET=${1}

echo ${TARGET}

function update_nvim {
    echo "Updating...       nvim 🚧"
    cp -r nvim/* ~/.config/nvim
    echo "Update Complete:  nvim ✅"
}

function update_brew {
    echo "Updating...       brew 🚧"
    cp brew/Brewfile ~/Brewfile
    echo "Update Complete:  brew ✅"
}

function update_tmux {
    echo "Updating...       tmux 🚧"
    cp tmux/.tmux.conf ~/.tmux.conf
    cp -pr tmux/bin/ ~/.config/tmux/bin/
    echo "Update Complete:  tmux ✅"
}

if [ "${TARGET}" = "nvim" ]; then
    update_nvim
elif [ $TARGET = "brew" ]; then
    update_brew
elif [ $TARGET = "tmux" ]; then
    update_tmux
elif [ $TARGET = "all" ]; then
    update_nvim
    update_brew
    update_tmux
else
    echo "No arg specified"
fi

