z() {
    pushd $HOME
    clear
    local location=$(fdfind -p -g -H -I --maxdepth 2 -E .cache -E .local "**/$1" | head -1)

    if [ -z "$location" ]; then
        echo "Could not find $1"
        popd
        clear
    else
        cd "$location"
    fi
}
