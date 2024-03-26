#!/usr/bin/env bash

function check() {
    ps -ef | grep clash | grep -v grep
    if [ $? -ne 0 ]; then
        echo "clash isn't runnning"
    fi
}

function install() {
    output=$(check)
    if [[ ! (-z $output) ]]; then
        return
    else
        sudo pacman -S pyright clang gopls lua-language-server zls --noconfirm
        sudo yay -S rustup --noconfirm
        rustup component add rust-analyzer
    fi
}

install
