#! /bin/bash
curl --proxy 127.0.0.1:7890 -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
cp ~/zim/alisa.zsh ~/.zim/alisa.zsh
cp ~/zim/env.zsh ~/.zim/env.zsh
cat ~/zim/zimrc >> ~/.zimrc
cat ~/zim/zshrc >> ~/.zshrc
source ~/.zshrc
