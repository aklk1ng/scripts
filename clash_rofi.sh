#!/bin/bash
# killall -q clash-linux-amd64-v1.12.0
killall -q clash-linux-386-v1.12.0
cd /home/cjh/clash || return
case "$1" in
    Wallless) ./clash-linux-386-v1.12.0 -f Wallless.yaml -d .
    ;;
    glados) ./clash-linux-386-v1.12.0 -f glados.yaml -d .
    ;;
    *) ./clash-linux-386-v1.12.0 -f Wallless.yaml -d .
    ;;
esac
