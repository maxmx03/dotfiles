#!/usr/bin/env zsh

export DOTS_DIR="${XDG_DATA_HOME:-$HOME}/dotfiles"
export DOTS_CONFIG_FILE="$DOTS_DIR/dots_configs.txt"
default_msg="⚡ Dots"

function register_config() {
    if [ ! -e "$DOTS_CONFIG_FILE" ]; then
        touch "$DOTS_CONFIG_FILE"
    fi
    config=$(grep -w "$1" "$DOTS_CONFIG_FILE")
    if [ -z "$config" ]; then
        echo "$1" >> "$DOTS_CONFIG_FILE"
    fi
}

function _dots_remove() {
    echo "$default_msg - remove"
    pushd -q "$HOME"
    config=$(fd -H -I --maxdepth 2 -E .cache -E .local -E dotfiles "^$1$")

    echo "$default_msg - The following commands are going to be executed:"
    echo "sed -i 's/$1//g' $DOTS_CONFIG_FILE"
    echo "rm -rf $config"
    echo "Proceed with these commands? (y/n): "
    read answer

    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        sed -i "s/$1//g" $DOTS_CONFIG_FILE
        rm -rf $config
    else
        echo "$default_msg - Operation canceled."
    fi
    popd -q
}

function _dots_list() {
    if [ ! -e "$DOTS_CONFIG_FILE" ]; then
        touch "$DOTS_CONFIG_FILE"
    fi
    echo "$default_msg - list"
    cat "$DOTS_CONFIG_FILE"
}

function _dots_install() {
    echo "$default_msg - Install"
    pushd -q "$DOTS_DIR"
    config=$(fd -H -I --maxdepth 2 -E .local -E .cache "^$1$")

    echo "$default_msg - The following commands are going to be executed:"
    echo "cp -r $DOTS_DIR/$config $HOME/$config"
    echo "Proceed with these commands? (y/n): "
    read answer
    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        if [ -e "$config" ] && [ ! -e "$HOME/$config" ]; then
            cp -r "$DOTS_DIR/$config" "$HOME/$config"
            echo "$default_msg - $config was installed"
            register_config "$1"
        else
            echo "$default_msg - '$config' not found or already exists"
        fi
    else
        echo "$default_msg - Operation canceled."
    fi

    popd -q
}

function _dots_help() {
    echo "$default_msg - Help

Usage: dots <command> [options]

COMMANDS:
    help           Show this help message
    install        Install config
    update         Update dots
    remove         Remove dots
    list           List dots"
}

function _dots_update() {
    echo "$default_msg - update"
    pushd -q "$HOME"
    config=$(fd -H -I --maxdepth 2 -E dotfiles -E .cache -E .local -E GitHub "^$1$")

    if [ -e "$config" ] ; then
        echo "$default_msg - The following commands are going to be executed:"
        echo "rm -rf '$DOTS_DIR/$config'"
        echo "cp -r '$config' '$DOTS_DIR/$config'"
        echo "Proceed with these commands? (y/n): "
        read answer
        if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
            rm -rf "$DOTS_DIR/$config"
            cp -r "$config" "$DOTS_DIR/$config"

            echo "$default_msg - $DOTS_DIR/$config was updated"
        else
            echo "$default_msg - Operation canceled."
        fi
    else
        echo "$default_msg - $config not found"
    fi

    popd -q
}

function dots() {
    typeset -A subcmds=(
        help "_dots_help"
        update "_dots_update"
        install "_dots_install"
        list "_dots_list"
        remove "_dots_remove"
    )

    emulate -L zsh
    [[ -z "$subcmds[$1]" ]] && { _dots_help; return 1 } || ${subcmds[$1]} $2
}
