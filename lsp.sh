#! /bin/bash

function get_linux_distro() {
    if grep -Eq "Ubuntu" /etc/*-release; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release; then
        echo "Deepin"
    elif grep -Eq "LinuxMint" /etc/*-release; then
        echo "LinuxMint"
    elif grep -Eq "Debian" /etc/*-release; then
        echo "Debian"
    elif grep -Eq "Kali" /etc/*-release; then
        echo "Kali"
    elif grep -Eq "fedora" /etc/*-release; then
        echo "fedora"
    elif grep -Eq "Arch Linux" /etc/*-release; then
        echo "ArchLinux"
    else
        echo "Unknown"
    fi
}

function get_uname() {
    type=$(uname)
    distro=$(get_linux_distro)
    if [ $type == "Darwin" ]; then
        mac install
    elif [ $type == "Linux" -a $distro == 'ArchLinux' ]; then
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
            brew install llvm gopls bash-language-server marksman lua-language-server typescript-language-server pyright
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
            sudo pacman -S clang python-pip gopls bash-language-server lua-language-server tsserver zls --noconfirm
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
