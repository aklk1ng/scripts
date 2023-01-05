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
pigcha() {
    ps -ef | grep pigcha | grep -v grep
    if [ $? -ne 0 ]
    then
        echo "pigcha is not running!"
    else
        proxy=$(cat ~/.npmrc)
        if [[ $proxy ]]; then
            git config --global http.proxy http://127.0.0.1:15777 && git config --global https.proxy http://127.0.0.1:15777
            npm config set proxy=http://127.0.0.1:15777
            export https_proxy=http://127.0.0.1:15777 http_proxy=http://127.0.0.1:15777
        fi
    fi
}
clash
pigcha

sudo pacman -S clang delve rust-analyzer python-pip gopls jedi-language-server bash-language-server lua-language-server vscode-json-languageserver vscode-html-languageserver vscode-css-languageserver
# pip install -U jedi-language-server
sudo npm i -g vscode-langservers-extracted
# go install golang.org/x/tools/gopls@latest
pip install python-language-server cmake-language-server debugpy
sudo npm install -g typescript typescript-language-server dockerfile-language-server-nodejs
proxychains yay -S marksman-bin
brew install llvm
