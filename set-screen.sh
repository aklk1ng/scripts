#! /bin/bash
: <<!
  设置屏幕分辨率的脚本
  one: INNER
  two: OUT - INNER
  check: 检测显示器连接状态是否变化 -> 调用two
  toggle_auto: 开启/关闭自动分辨率调整开关
!

INNER_PORT=eDP-1
OUTPORT1=DP-1
OUTPORT2=DP-2

two() {
    # 查找已连接、未连接的外接接口
    OUTPORT_CONNECTED=$(xrandr | grep -v $INNER_PORT | grep -w 'connected' | awk '{print $1}')
    OUTPORT_DISCONNECTED=$(xrandr | grep -v $INNER_PORT | grep -w 'disconnected' | awk '{print $1}')
    [ ! "$OUTPORT_CONNECTED" ] && one && return # 如果没有外接屏幕则直接调用one函数
    xrandr --output $INNER_PORT --mode 1440x900 --pos 1920x320 --scale 1x1 \
        --output $OUTPORT_CONNECTED --mode 1920x1080 --pos 0x0 --scale 1x1 --primary \
        --output $OUTPORT_DISCONNECTED --off
    feh --randomize --bg-fill ~/Pictures/wallpaper/*.png
}
one() {
    xrandr --output $INNER_PORT --mode 1440x900 --pos 0x0 --scale 1x1 --primary \
        --output $OUTPORT1 --off \
        --output $OUTPORT2 --off
    feh --randomize --bg-fill ~/Pictures/wallpaper/*.png
}
check() {
    CONNECTED_PORTS=$(xrandr | grep -w 'connected' | awk '{print $1}' | wc -l)
    CONNECTED_MONITORS=$(xrandr --listmonitors | sed 1d | awk '{print $4}' | wc -l)
    [ $CONNECTED_PORTS -gt $CONNECTED_MONITORS ] && two # 如果当前连接接口多于当前输出屏幕 则调用two
    [ $CONNECTED_PORTS -lt $CONNECTED_MONITORS ] && one # 如果当前连接接口少于当前输出屏幕 则调用one
}

case $1 in
one) one ;;
two) two ;;
check) check ;;
*) check ;;
esac
