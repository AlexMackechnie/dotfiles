#!/bin/sh

TARGET=${1}

echo ${TARGET}

function update_nvim {
    echo "Updating...       nvim 🚧"
    cp -r nvim/* ~/.config/nvim
    echo "Update Complete:  nvim ✅"
}

function update_brew {
    echo "Updating...       brew🚧"
    cp brew/Brewfile ~/Brewfile
    echo "Update Complete:  brew ✅"
}

if [ "${TARGET}" = "nvim" ]; then
    update_nvim
elif [ $TARGET = "brew" ]; then
    update_brew
elif [ $TARGET = "all" ]; then
    update_nvim
    update_brew
else
    echo "No arg specified"
fi

