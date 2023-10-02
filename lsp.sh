#! /bin/bash

function get_uname() {
    type=$(uname)
    distro=$(get_linux_distro)
    if [ $type == "Darwin" ]; then
        mac install
    elif [ $type == "Linux" ]; then
        linux install
    else
        echo "Not support platform type: "${type}
    fi

}

function install() {
    get_uname
}

function check() {
    ps -ef | grep clash | grep -v grep
    if [ $? -ne 0 ]; then
        echo "clash isn't runnning"
    fi
}

function mac() {
    output=check
    if [[ ! (-z $output) ]]; then
        return
    else
        case "$1" in
        install)
            pip3 install cmake-language-server
            brew install llvm gopls bash-language-server marksman lua-language-server typescript-language-server python-lsp-server
            rustup component add rust-analyzer
            sudo npm install -g dockerfile-language-server-nodejs vscode-langservers-extracted
            ;;
        esac
    fi
}

function linux() {
    output=check
    if [[ ! (-z $output) ]]; then
        return
    else
        case "$1" in
        install)
            sudo pacman -S python-lsp-server clang python-pip gopls bash-language-server lua-language-server tsserver zls --noconfirm
            sudo yay -S rustup marksman --noconfirm
            rustup component add rust-analyzer
            pip3 install cmake-language-server
            sudo npm install -g typescript dockerfile-language-server-nodejs vscode-langservers-extracted typescript-language-server
            ;;
        esac
    fi
}

case "$1" in
install)
    install
    ;;
esac
