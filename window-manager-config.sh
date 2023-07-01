#! /bin/bash
clash() {
    ps -ef | grep clash | grep -v grep
    if [ $? -ne 0 ]; then
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

#proxychains yay -S i3lock-color keyd wqy-microhei cava
sudo pacman -S xdotool pavucontrol xfce4-power-manager imagemagick network-manager-applet xorg-xsetroot xclip tmux pcmanfm flameshot pamixer acpi light xorg-xbacklight dunst libnotify rofi feh i3locks mpd mpc ncmpcpp pactl python nodejs yarn fzf ripgrep
pip install pynvim --break-system-packages
brew install stow cal
sudo npm install -g neovim
