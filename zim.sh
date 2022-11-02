#! /bin/bash
curl --proxy 127.0.0.1:7890 -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

function backup_old_files()
{
    old_zim=$HOME"/zim"
    is_exist=$(is_exist_dir $old_vim)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_zim=$old_zim"_bak_"$time
        read -p "Find "$old_zim" already exists,backup "$old_zim" to "$backup_zim"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp -R $old_zim $backup_zim
        fi
    fi
}
function copy_cat_files()
{
    cp ~/zim/alisa.zsh ~/.zim/alisa.zsh
    cp ~/zim/env.zsh ~/.zim/env.zsh
    cat ~/zim/zimrc >> ~/.zimrc
    cat ~/zim/zshrc >> ~/.zshrc
    source ~/.zshrc
}

backup_old_files()
copy_cat_files()
