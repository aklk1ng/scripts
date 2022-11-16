#! /bin/bash
# DWM自启动脚本
nm-applet &
xrandr --dpi 192
mpd ~/.config/mpd/mpd.conf &
feh --bg-scale ~/wallpaper/ic8ubjf.png &
fcitx5 &
xmodmap ~/scripts/config/xmodmap.conf #让cpaslock代替esc键
settings() {
    [ $1 ] && sleep $1
    xset s 600
    xset -b
    syndaemon -i 1 -t -K -R -d
    # $DWM/statusbar/statusbar.sh cron &
    # ~/scripts/set-screen.sh &
}

daemons() {
    [ $1 ] && sleep $1 
    pactl info &
    flameshot &
    lemonade server &
    picom --experimental-backends --config ~/scripts/config/picom.conf &
    # xfce4-power-manager &
    # ~/scripts/app-starter.sh easyeffects &
}

every1s() {
    [ $1 ] && sleep $1
    while true
    do
        ~/scripts/dwm-status.sh &
        ~/scripts/proxy.sh &
        sleep 1
    done
}

every1000s() {
    [ $1 ] && sleep $1
    while true
    do
        source ~/.profile
        xset -b
        sleep 1000
        [ "$WALLPAPER_MODE" = "PIC" ] && ~/scripts/set-wallpaper.sh &
    done
}
settings 1 &
daemons 2 &
every1s 1 &
every1000s 30 &
