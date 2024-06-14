#!/bin/bash

si=0
set_menu() {
    menu_items[$si]=$1
    cmds[$si]=$2
    si=$(($si + 1))
}

get_config_files() {
    for file in $(ls *.yaml); do
        file_name=${file%.*}
        set_menu $file_name "clash -f $file -d . &"
    done
}

_list() {
    for ((i = 0; i < ${#menu_items[@]}; i++)); do
        _item=${menu_items[$i]}
        echo "${_item[@]}"
    done
}

_index() {
    for ((i = 0; i < ${#menu_items[@]}; i++)); do
        _item=${menu_items[$i]}
        [[ "$_item" == "$1" ]] && echo $i && break
    done
}

prev_hook() {
    killall -q clash*
    cd $HOME/clash || return
}

_preview() {
    index=$(_index "$1")
    echo ${cmds[index]}
}

_clash() {
    prev_hook
    get_config_files
    proxy=$(
        _list | fzf \
            --cycle \
            --header='switch clash proxy' \
            --header-first \
            --height=10 \
            --preview '' \
            --preview-window=bottom:1:wrap,border-up
    )
    [[ -z "$proxy" ]] && exit 0
    [[ -z "$(_index "$proxy")" ]] && echo $proxy && exit 0
    exec $(_preview "$proxy")
}

case "$1" in
*)
    _clash
    ;;
esac
