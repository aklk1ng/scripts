#! /bin/bash
sudo pacman -S clang python-pip lua-language-server
pip install -U jedi-language-server
suod npm i -g bash-language-servervvv vscode-langservers-extracted
go install golang.org/x/tools/gopls@latest
sudo npm install -g typescript typescript-language-server
cd /usr/bin/
sudo wget https://github.com/artempyanykh/marksman/releases/download/2022-09-13/marksman-linux
sudo mv marksman-linux marksman && sudo chmod +x marksman
