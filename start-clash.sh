#!/bin/bash
# killall -q clash-linux-amd64-v1.12.0
killall -q clash-linux-386-v1.12.0
cd /home/cjh/clash
./clash-linux-386-v1.12.0 -f Wallless.yaml -d .
# ./clash-linux-amd64-v1.12.0 -f Wallless.yaml -d .
