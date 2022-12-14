#! /bin/bash
sudo pacman -S clang python-pip gopls jedi-language-server bash-language-server lua-language-server vscode-json-languageserver vscode-html-languageserver vscode-css-languageserver
# pip install -U jedi-language-server
sudo npm i -g vscode-langservers-extracted cssmodules-language-server
# go install golang.org/x/tools/gopls@latest
pip install cmake-language-server
sudo npm install -g typescript typescript-language-server
cd /usr/bin/
sudo wget https://github.com/artempyanykh/marksman/releases/download/2022-09-13/marksman-linux
sudo mv marksman-linux marksman && sudo chmod +x marksman
