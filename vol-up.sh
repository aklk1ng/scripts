#!/bin/bash

# /usr/bin/amixer -qM set Master 1%+ umute
pactl set-sink-volume @DEFAULT_SINK@ +1%
bash ~/scripts/dwm-status-refresh.sh
