# rofi -show 自定义 -modi "自定义:~/rofi.sh"
#   1: 上述命令可调用rofi.sh作为自定义脚本
#   2: 将打印的内容作为rofi的选项
#   3: 每次选中后 会用选中项作为入参再次调用脚本
#   4: 当没有输出时 整个过程结束

source ~/.profile

# !!! 确保所有item没有重复的 !!!
main_menu_item[1]="set wallpaper"        ; main_cmd[1]='~/scripts/set-wallpaper.sh; main_menu'
main_menu_item[2]="toggle some server"   ; main_cmd[2]='server_menu'

# server_menu_item[1]="v2raya"             ; server_cmd[1]='[ "$(docker ps | grep v2raya)" ] && docker stop v2raya >> /dev/null || docker restart v2raya >> /dev/null;'
# server_menu_item[1]="v2ray"             ; server_cmd[1]='killall v2ray || ~/scripts/v2ray.sh'
server_menu_item[1]="xmodmap"              ; server_cmd[2]='xmodmap ~/scripts/config/xmodmap.conf'
server_menu_item[2]="picom"              ; server_cmd[2]='killall picom || ~/scripts/app-starter.sh picom'
server_menu_item[3]="easyeffects"        ; server_cmd[3]='killall easyeffects || ~/scripts/app-starter.sh easyeffects'
server_menu_item[5]="aria2c"             ; server_cmd[5]='killall aria2c || ~/scripts/app-starter.sh aria2c'
server_menu_item[6]="virsual arch"       ; server_cmd[6]='[ "$(docker ps | grep minearch)" ] && docker stop minearch >> /dev/null || docker restart minearch >> /dev/null && docker exec -u root -itd arch bash -c "/usr/sbin/vncserver :1" ;'


main_menu() {
    echo -e "\0prompt\x1fmenu"
    for item in "${main_menu_item[@]}"; do
        echo "$item"
    done
}
server_menu() {
    echo -e "\0prompt\x1fserver"
    for item in "${server_menu_item[@]}"; do
        echo "$item"
    done
}

[ ! "$*" ] && main_menu
for i in "${!main_menu_item[@]}"; do
    [ "$*" = "${main_menu_item[$i]}" ] && eval "${main_cmd[$i]}"
done
for i in "${!server_menu_item[@]}"; do
    [ "$*" = "${server_menu_item[$i]}" ] && eval "${server_cmd[$i]}"
done
