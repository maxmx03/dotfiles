#!/bin/bash
export DOTS_DIR="${XDG_DATA_HOME:-$HOME}/dotfiles"
export DOTS_DATA_FILE="$DOTS_DIR/dots.txt"

function loading {
  declare t msg
  t=$1
  msg=$2

  for i in {0..11}; do
    printf "\r${msg:-Loading}: [%-10s]" "$(seq -s "#" "$i" | tr -d '[:digit:]')"
    sleep "${t:-0.1}"
  done
  echo " Done!"
}

[[ ! -f "$DOTS_DATA_FILE" ]] && touch "$DOTS_DATA_FILE"

function _dots_help {
  echo 'Dots - Help

  Usage: dots <command> [options]

  COMMANDS:
  install             install config
  install all         install all config
  update              update config
  update all          update all config
  remove              remove config
  show                display config inside dots.txt
  help                display help
  '
}

function __install {
  declare config
  config=$(grep "$1" "$DOTS_DATA_FILE" | head -1)
  if [[ -z "$config" ]]; then
    echo "config not found: $1"
    return
  fi
  echo "installing $config to $HOME/$config"
  if [[ -e "$HOME/$config" ]]; then
    read -re -p "$config already installed, do you want to processed? [y/n] " confirm

    if [[ $confirm == [yY] ]]; then
      loading 0.1 "cleaning"
      rm -rf "$HOME/${config:?}"
      loading 0.1 "installing"
      cp -rf "$DOTS_DIR/$config" "$HOME/$config"
    fi
  else
    read -re -p "Do you want to processed? [y/n] " confirm
    if [[ $confirm == [yY] ]]; then
      loading 0.1 "installing"
      cp -rf "$DOTS_DIR/$config" "$HOME/$config"
    fi
  fi
}

function __install_all {
  read -re -p "install all is going to override all existing installed, do you want to processed? [y/n] " confirm
  if [[ $confirm == [yY] ]]; then
    declare -a configs=$1
    loading 0.1 "cleaning"
    parallel rm -rf "$HOME/"{} ';' echo "" {} ::: "${configs[@]}"
    loading 0.1 "installing"
    parallel cp -rf "$DOTS_DIR/"{} "$HOME/"{} ';' echo "" {} ::: "${configs[@]}"
  fi
}

function _dots_install {
  declare configs args
  args=$1
  configs=$(grep "" "$DOTS_DATA_FILE")

  if [[ -z $configs ]]; then
    echo "$DOTS_DATA_FILE is empty, please fill $DOTS_DATA_FILE manually."
    return
  fi

  case "$args" in
  all)
    __install_all "$configs"
    ;;
  *)
    __install "$args"
    ;;
  esac
}

function __update {
  declare config
  config=$(grep "$1" "$DOTS_DATA_FILE" | head -1)
  echo "updating $HOME/$config to $DOTS_DIR/$config"
  if [[ -z "$config" ]]; then
    echo "config not found: $1"
    return
  fi
  if [[ -e "$DOTS_DIR/$config" ]] && [[ -e "$HOME/$config" ]]; then
    read -re -p "Do you want to processed? [y/n] " confirm

    if [[ $confirm == [yY] ]]; then
      loading 0.1 "cleaning"
      rm -rf "$DOTS_DIR/${config:?}"
      loading 0.1 "installing"
      cp -rf "$HOME/$config" "$DOTS_DIR/$config"
    fi
  else
    echo "nothing to update"
  fi
}

function __update_all {
  read -re -p "update all is going to override all existing dotfiles, do you want to processed? [y/n] " confirm
  if [[ $confirm == [yY] ]]; then
    declare -a configs=$1
    loading 0.1 "cleaning"
    parallel rm -rf "$DOTS_DIR/"{} ';' echo "" {} ::: "${configs[@]}"
    loading 0.1 "updating"
    parallel cp -rf "$HOME/"{} "$DOTS_DIR/"{} ';' echo "" {} ::: "${configs[@]}"
  fi
}

function _dots_update {
  declare configs args
  args=$1
  configs=$(grep "" "$DOTS_DATA_FILE")

  if [[ -z $configs ]]; then
    echo "$DOTS_DATA_FILE is empty, please fill $DOTS_DATA_FILE manually."
    return
  fi

  case "$args" in
  all)
    __update_all "$configs"
    ;;
  *)
    __update "$args"
    ;;
  esac
}

function _dots_remove {
  declare config
  config=$(grep "$1" "$DOTS_DATA_FILE" | head -1)
  echo "removing $HOME/$config"
  if [[ -e "$HOME/$config" ]]; then
    read -re -p "Do you want to processed? [y/n] " confirm

    if [[ $confirm == [yY] ]]; then
      loading 0.3 "removing"
      rm -rf "$HOME/${config:?}"
    fi
  else
    echo "nothing to remove"
  fi
}

function _dots_show {
  less "$DOTS_DATA_FILE"
}

function dots {
  declare arg1 arg2
  arg1=$1
  arg2=$2
  declare -A subcmds=(
    [install]="_dots_install"
    [update]="_dots_update"
    [remove]="_dots_remove"
    [show]="_dots_show"
    [help]="_dots_help"
  )

  case $arg1 in
  show)
    _dots_show
    ;;
  help)
    _dots_help
    ;;
  *)
    if [[ -z "$arg1" ]] || [[ -z "$arg2" ]]; then
      _dots_help
    else
      ${subcmds[$arg1]} "$arg2"
    fi
    ;;
  esac
}
