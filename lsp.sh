#! /bin/bash
sudo pacman -S clang rust-analyzer python-pip gopls jedi-language-server bash-language-server lua-language-server vscode-json-languageserver vscode-html-languageserver vscode-css-languageserver
# pip install -U jedi-language-server
sudo npm i -g vscode-langservers-extracted cssmodules-language-server
# go install golang.org/x/tools/gopls@latest
pip install cmake-language-server
sudo npm install -g typescript typescript-language-server
proxychains yay -S marksman-bin
