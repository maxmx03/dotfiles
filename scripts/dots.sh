#!/bin/bash

export DOTS_DIR="${XDG_DATA_HOME:-$HOME}/dotfiles"
export DOTS_CONFIG_FILE="$DOTS_DIR/dots_configs.txt"

_dots_register() {
    if [ ! -e "$DOTS_CONFIG_FILE" ]; then
        touch "$DOTS_CONFIG_FILE"
    fi
    local config=$(grep -w "$1" "$DOTS_CONFIG_FILE")
    if [ -z "$config" ]; then
        echo "$1" >> "$DOTS_CONFIG_FILE"
    fi
}

_dots_unregister() {
    sed -i "s/$1//g" "$DOTS_CONFIG_FILE"
    sed -i '/^$/d' "$DOTS_CONFIG_FILE"
}

_dots_remove() {
    pushd "$HOME"
    local config=$(fdfind -p -g -H -I --maxdepth 2 -E .cache -E .local -E dotfiles "**/$1")

    if [ ! -z "$config" ] && [ -e "$config" ]; then
        echo "⚡ Dots - The following commands are going to be executed:"
        echo "sed -i 's/$1//g' $DOTS_CONFIG_FILE"
        echo "rm -rf $config"
        echo "Proceed with these commands? (y/n): "
        read answer

        if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
            echo "⚡ Dots - removing $config"
            sleep 3
            _dots_unregister "$1"
            rm -rf "$config"
            echo "⚡ Dots - The $config has been removed"
        else
            echo "⚡ Dots - Operation canceled."
        fi
    else
        echo "⚡ Dots - Config not found"
    fi

    popd
}

_dots_list() {
    if [ ! -e "$DOTS_CONFIG_FILE" ]; then
        touch "$DOTS_CONFIG_FILE"
    fi
    echo "⚡ Dots - list"
    batcat "$DOTS_CONFIG_FILE"
}

_dots_installation() {
    local config=$1

    echo "⚡ Dots - The following commands are going to be executed:"
    echo "cp -r $DOTS_DIR/$config $HOME/$config"
    echo "Proceed with these commands? (y/n): "
    read answer

    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        echo "⚡ Dots - copying $DOTS_DIR/$config to $HOME/$config"
        sleep 3
        cp -r "$DOTS_DIR/$config" "$HOME/$config"
        echo "⚡ Dots - The $config has been installed"
    else
        echo "⚡ Dots - Operation canceled."
    fi
}

_dots_install() {
    pushd "$DOTS_DIR"

    if [ "$1" == ".bashrc" ]; then
        echo "You don't need to install bashrc, you can just source from ~/.bashrc"
        echo "Exiting..."
        sleep 5
        exit 1
    fi

    local config=$(fdfind -p -g -H -I --maxdepth 2 -E .local -E .cache "**/$1")

    if [ ! -z "$config" ] && [ -e "$config" ]; then
        if [ -e "$HOME/$config" ]; then
            echo "⚡ Dots - '$HOME/$config' already exists."
            echo "Do you want to overwrite it? (y/n)"
            read answer

            if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
                echo "⚡ Dots - removing $HOME/$config ..."
                sleep 3
                rm -rf "$HOME/$config"
                _dots_installation "$config"
                _dots_register "$1"
            else
                echo "⚡ Dots - Operation canceled."
            fi
        else
            _dots_installation "$config"
            _dots_register "$1"
        fi
    else
        echo "⚡ Dots - Config not found"
    fi

    popd
}

_dots_help() {
    echo "⚡ Dots - Help

Usage: dots <command> [options]

COMMANDS:
    help           Show this help message
    install        Install config
    update         Update dots
    remove         Remove dots
    list           List dots"
}

_dots_update() {
    pushd "$HOME"
    local config=$(fdfind -p -g -H -I --maxdepth 2 -E dotfiles -E .cache -E .local -E GitHub "**/$1")

    if [ ! -z "$config" ] && [ -e "$config" ]; then
        echo "⚡ Dots - The following commands are going to be executed:"
        echo "rm -rf '$DOTS_DIR/$config'"
        echo "cp -r '$config' '$DOTS_DIR/$config'"
        echo "Proceed with these commands? (y/n): "
        read answer

        if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
            echo "⚡ Dots - removing $DOTS_DIR/$config"
            sleep 3
            rm -rf "$DOTS_DIR/$config"

            echo "⚡ Dots - copying $config to $DOTS_DIR/$config"
            sleep 3
            cp -r "$config" "$DOTS_DIR/$config"

            echo "⚡ Dots - The $DOTS_DIR/$config has been updated"
        else
            echo "⚡ Dots - Operation canceled."
        fi
    else
        echo "⚡ Dots - $config not found"
    fi

    popd
}

dots() {
    declare -A subcmds=(
        [help]="_dots_help"
        [update]="_dots_update"
        [install]="_dots_install"
        [list]="_dots_list"
        [remove]="_dots_remove"
    )

    [[ -z "${subcmds[$1]}" ]] && { _dots_help; return 1; } || ${subcmds[$1]} $2
}
