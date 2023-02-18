#! /bin/bash

si=0
set_menu() {
    menu_items[$si]=$1
    cmds[$si]=$2
    si=$(($si+1))
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
    pass
}
_preview() {
    index=$(_index "$1")
    echo ${cmds[index]}
}
