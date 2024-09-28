#!/bin/bash

prev_hook() {
    killall -q clash
    cd $HOME/clash || return
}

main() {
    prev_hook
    config=$(
        ls -a *.yaml | rev | cut -d. -f2- | rev | fzf \
            --cycle \
            --header='Switch clash config' \
            --header-first \
            --height=10 \
            --preview '' \
            --preview-window=bottom:1:wrap,border-up
    )
    [[ -z "$config" ]] && exit 0
    exec $(echo clash -f "$config".yaml -d . &)
}

case "$1" in
*)
    main
    ;;
esac
