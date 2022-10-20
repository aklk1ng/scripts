#! /bin/bash
# DWM自启动脚本
xrandr --dpi 192
feh --bg-scale ~/wallpaper/ic8ubjf.png &
mpd ~/.config/mpd/mpd.conf &
# xcompmgr &
picom --experimental-backends --config ~/scripts/config/picom.conf &
settings() {
    [ $1 ] && sleep $1
    xset s 600
    xset -b
    syndaemon -i 1 -t -K -R -d
    xss-lock -- ~/scripts/app-starter.sh blurlock &
    # ~/scripts/set-screen.sh &
}

daemons() {
    [ $1 ] && sleep $1 
    fcitx5 &
    pactl info &
    nm-applet &
    flameshot &
    # xfce4-power-manager &
    lemonade server &
    # ~/scripts/app-starter.sh picom &
    ~/scripts/app-starter.sh easyeffects &
}

every1s() {
    [ $1 ] && sleep $1
    while true
    do
        ~/scripts/dwm-status.sh &
        sleep 1
    done
}

every1000s() {
    [ $1 ] && sleep $1
    while true
    do
        source ~/.profile
        xset -b
        xmodmap ~/scripts/config/xmodmap.conf
        sleep 1000
        [ "$WALLPAPER_MODE" = "PIC" ] && ~/scripts/set-wallpaper.sh &
    done
}
settings 1 &
daemons &
every1s 1 &
every1000s 30 &
