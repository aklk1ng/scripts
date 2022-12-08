#!/bin/bash
killall -q clash-linux-amd64-v1.10.0
cd /home/cjh/clash
# ./clash-linux-amd64-v1.10.0 -f glados.yaml -d .
./clash-linux-amd64-v1.10.0 -f Wallless.yaml -d .
