#! /bin/bash
clash() {
    ps -ef | grep clash | grep -v grep
    if [ $? -ne 0 ]
    then
        echo "clash is not running!"
    else
        proxy=$(cat ~/.npmrc)
        if [[ $proxy ]]; then
            git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy http://127.0.0.1:7890
            npm config set proxy=http://127.0.0.1:7890
            export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890
        fi
    fi
}
clash

sudo pacman -S clang delve rust-analyzer python-pip vscode-json-languageserver
pip3 install python-language-server debugpy --break-system-packages
sudo npm install -g typescript typescript-language-server dockerfile-language-server-nodejs
brew install llvm
