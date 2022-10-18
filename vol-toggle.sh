#!/bin/bash

# /usr/bin/amixer set Master toggle
pactl set-sink-mute @DEFAULT_SINK@ toggle
bash ~/scripts/dwm-status-refresh.sh
