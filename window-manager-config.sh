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

proxychains yay -S i3lock-color keyd ttf-material-design-icons ttf-joypixels wqy-microhei cava
sudo pacman -S pavucontrol byzanz network-manager-applet xorg-xsetroot xclip tmux pcmanfm flameshot pamixer acpi light xorg-xbacklight xmodmap dunst libnotify rofi feh v2ray i3lock mpd mpc ncmpcpp pactl python nodejs yarn fzf ripgrep
pip install pynvim
npm install -g neovim
