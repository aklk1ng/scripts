#!/bin/bash
clash() {
    ps -ef | grep clash
    if [ $? -ne 0 ]
    then
        echo "clash is not running!"
    else
        git config --global http.proxy http://127.0.0.1:7890 && git config --global https.proxy http://127.0.0.1:7890
        npm config set proxy=http://127.0.0.1:7890
        export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890
        echo "clash is running!"
    fi
}
pigcha() {
    ps -ef | grep pigcha 
    if [ $? -ne 0 ]
    then
        echo "pigcha is not running!"
    else
        git config --global http.proxy http://127.0.0.1:15777 && git config --global https.proxy http://127.0.0.1:15777
        npm config set proxy=http://127.0.0.1:15777
        export https_proxy=http://127.0.0.1:15777 http_proxy=http://127.0.0.1:15777
        echo "pigcha is running!"
    fi
}
v2ray() {
    ps -ef | grep v2ray 
    if [ $? -ne 0 ]
    then
        echo "v2ray is not running!"
    else
        git config --global http.proxy http://127.0.0.1:18317 && git config --global https.proxy http://127.0.0.1:18317
        npm config set proxy=http://127.0.0.1:18317
        export https_proxy=http://127.0.0.1:18317 http_proxy=http://127.0.0.1:18317
        echo "v2ray is running!"
    fi
}
clash
pigcha
v2ray
