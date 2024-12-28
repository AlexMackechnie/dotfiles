#!/bin/sh

TARGET=${1}

echo ${TARGET}

function update_brew {
    echo "Updating...       brew 🚧"
    brew bundle install --file=brew/Brewfile
    echo "Update Complete:  brew ✅"
}

function update_tmux {
    echo "Updating...       tmux 🚧"
    mkdir ~/.config/tmux
    cp tmux/.tmux.conf ~/.tmux.conf
    cp -pr tmux/bin/ ~/.config/tmux/bin/
    echo "Update Complete:  tmux ✅"
}

function update_zsh {
    echo "Updating...       zsh  🚧"
    cp zsh/.zshrc ~/.zshrc
    echo "Update Complete:  zsh  ✅"
}

function update_asdf {
    echo "Updating...       asdf 🚧"
    sh asdf/plugins.sh
    echo "Update Complete:  asdf ✅"
}

function update_aerospace {
    echo "Updating...       aerospace 🚧"
    cp aerospace/aerospace.toml ~/.aerospace.toml
    echo "Update Complete:  asdf ✅"
}

if [ $TARGET = "brew" ]; then
    update_brew
elif [ $TARGET = "tmux" ]; then
    update_tmux
elif [ $TARGET = "zsh" ]; then
    update_zsh
elif [ $TARGET = "asdf" ]; then
    update_asdf
elif [ $TARGET = "aerospace" ]; then
    update_aerospace
elif [ $TARGET = "all" ]; then
    update_brew
    update_tmux
    update_zsh
    update_asdf
    update_aerospace
else
    echo "No arg specified"
fi

