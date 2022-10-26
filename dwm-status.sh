#! /bin/bash
# dwm状态栏刷新脚本

source ~/.profile

s2d_reset="^d^"
s2d_fg="^c"
s2d_bg="^b"
color00="#FF7FA8^"
color01="#223344^"
color02="#8A4179^"
color03="#333344^"
color04="#111199^"
color05="#442266^"
color06="#245566^"
color07="#7F7256^"
color08="#000000^"
color09="#CCCCCC^"

others_color="$s2d_fg$color01$s2d_bg$color02"
  disk_color="$s2d_fg$color04$s2d_bg$color09"
   cpu_color="$s2d_fg$color00$s2d_bg$color06"
   mem_color="$s2d_fg$color05$s2d_bg$color07"
  time_color="$s2d_fg$color00$s2d_bg$color06"
   vol_color="$s2d_fg$color08$s2d_bg$color07"
   bat_color="$s2d_fg$color00$s2d_bg$color02"

print_others() {
    icons=()
    [ "$(docker ps | grep v2raya)" ] && icons=(${icons[@]} "")
    [ "$(docker ps | grep 'arch')" ] && icons=(${icons[@]} "")
    [ "$(bluetoothctl info C4:8D:8C:DA:E2:A7 | grep 'Connected: yes')" ] && icons=(${icons[@]} "")
    [ "$(bluetoothctl info 8C:DE:F9:E6:E5:6B | grep 'Connected: yes')" ] && icons=(${icons[@]} "")
    [ "$(bluetoothctl info 88:C9:E8:14:2A:72 | grep 'Connected: yes')" ] && icons=(${icons[@]} "")
    [ "$(ps -aux | grep 'danmu_sender' | sed 1d)" ] && icons=(${icons[@]} "ﳲ")
    [ "$(ps -aux | grep 'aria2c' | sed 1d)" ] && icons=(${icons[@]} "")
    [ "$AUTOSCREEN" = "OFF" ]  && icons=(${icons[@]} "ﴸ")

    if [ "$icons" ]; then
        text=" ${icons[@]} "
        color=$others_color
        printf "%s%s%s" "$color" "$text" "$s2d_reset"
    fi
}

print_temperature() {
    temperature=$[$(cat /sys/class/thermal/thermal_zone0/temp)/1000]
    printf "%s%s" "Tem " "$temperature"
}

print_disk() {
    disk_icon="﫭"
    used_rate=$( df -h | grep '/dev/nvme0n1p7' | awk '{print $5}' )
    printf "%s %s" "$disk_icon" "$used_rate"
}

print_cpu() {
    cpu_icon="閭"
    cpu_text=$(top -n 1 -b | sed -n '3p' | awk '{printf "%02d%", 100 - $8}')

    text=" $cpu_icon $cpu_text "
    color=$cpu_color
    printf "%s%s%s" "$color" "$text" "$s2d_reset"
}

print_mem() {
    mem_total=$(cat /proc/meminfo | grep "MemTotal:"|awk '{print $2}')
    mem_free=$(cat /proc/meminfo | grep "MemFree:"|awk '{print $2}')
    mem_buffers=$(cat /proc/meminfo | grep "Buffers:"|awk '{print $2}')
    mem_cached=$(cat /proc/meminfo | grep -w "Cached:"|awk '{print $2}')
    men_usage_rate=$(((mem_total - mem_free - mem_buffers - mem_cached) * 100 / mem_total))
	mem_icon=""
    mem_text=$(echo $men_usage_rate | awk '{printf "%02d%", $1}')
    text=" $mem_icon $mem_text "
    color=$mem_color
    printf "%s%s%s" "$color" "$text" "$s2d_reset"
}

print_time() {
    time_text="$(date '+%m/%d %H:%M:%S')"
    case "$(date '+%I')" in
        "01") time_icon="" ;;
        "02") time_icon="" ;;
        "03") time_icon="" ;;
        "04") time_icon="" ;;
        "05") time_icon="" ;;
        "06") time_icon="" ;;
        "07") time_icon="" ;;
        "08") time_icon="" ;;
        "09") time_icon="" ;;
        "10") time_icon="" ;;
        "11") time_icon="" ;;
        "12") time_icon="" ;;
    esac

    text=" $time_icon $time_text "
    color=$time_color
    printf "%s%s%s" "$color" "$text" "$s2d_reset"
}

print_vol() {
    volunmuted=$(pamixer --get-mute)
    vol_text=$(pamixer --get-volume)
    if [ "$vol_text" -eq 0 ] || [ ! "$volunmuted" ]; then vol_text="--"; vol_icon="婢";
    elif [ "$vol_text" -lt 10 ]; then vol_icon="奄"; vol_text=0$vol_text;
    elif [ "$vol_text" -le 20 ]; then vol_icon="奄";
    elif [ "$vol_text" -le 60 ]; then vol_icon="奔";
    else vol_icon="墳"; fi

    vol_text=$vol_text%

    text=" $vol_icon $vol_text "
    color=$vol_color
    printf "%s%s%s" "$color" "$text" "$s2d_reset"
}

print_bat() {
    bat_text=$(acpi -b | sed 2d | awk '{print $4}' | grep -Eo "[0-9]+")
    [ ! "$bat_text" ] && bat_text=$(acpi -b | sed 2d | awk '{print $5}' | grep -Eo "[0-9]+")
    [ ! "$(acpi -b | grep 'Battery 0' | grep Discharging)" ] && charge_icon=""
    if  [ "$bat_text" -ge 95 ]; then charge_icon=""; bat_icon="";
    elif [ "$bat_text" -ge 90 ]; then bat_icon="";
    elif [ "$bat_text" -ge 80 ]; then bat_icon="";
    elif [ "$bat_text" -ge 70 ]; then bat_icon="";
    elif [ "$bat_text" -ge 60 ]; then bat_icon="";
    elif [ "$bat_text" -ge 50 ]; then bat_icon="";
    elif [ "$bat_text" -ge 40 ]; then bat_icon="";
    elif [ "$bat_text" -ge 30 ]; then bat_icon="";
    elif [ "$bat_text" -ge 20 ]; then bat_icon="";
    elif [ "$bat_text" -ge 10 ]; then bat_icon="";
    else bat_icon=""; fi

    bat_text=$bat_text%
    bat_icon=$charge_icon$bat_icon

    text=" $bat_icon $bat_text "
    color=$bat_color
    printf "%s%s%s" "$color" "$text" "$s2d_reset"
}

xsetroot -name "$(print_disk)$(print_cpu)$(print_mem)$(print_temperature)$(print_time)$(print_vol)$(print_bat)"
