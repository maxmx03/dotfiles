#!/bin/bash
export DOTS_DIR="${XDG_DATA_HOME:-$HOME}/dotfiles"
export DOTS_DATA_FILE="$DOTS_DIR/dots.txt"

if [ ! -e "$DOTS_DATA_FILE" ]; then
  touch "$DOTS_DATA_FILE"
fi

function _dots_remove() {
  declare config answer data
  data=$(grep "" "$DOTS_DATA_FILE")

  if [ -n "$data" ]; then
    config=$(gum choose $data)
  fi

  if [ -n "$config" ] && [ -e "$HOME/$config" ]; then
    gum style --foreground 37 "the followings commands are going to be executed:"
    gum style --foreground 160 "rm -rf $HOME/$config"
    gum confirm "proceed with these commands?" && answer="y"

    if [ "$answer" = "y" ]; then
      gum spin --spinner dot --title "preparing to remove $HOME/$config" -- sleep 3
      rm -rf "$HOME/$config"
      gum spin --spinner dot --title "removing $HOME/$config" -- sleep 2
      gum log --structured --level info "the $HOME/$config has been removed"
    else
      gum log --structured --level info "operation canceled"
    fi
  else
    gum log --structured --level error "config not found"
  fi
}

function _dots_list() {
  if [ ! -e "$DOTS_DATA_FILE" ]; then
    touch "$DOTS_DATA_FILE"
  fi
  less "$DOTS_DATA_FILE"
}

function _dots_installation() {
  declare config answer
  config=$1

  gum style --foreground 37 "the followings commands are going to be executed:"
  gum style --foreground 160 "cp -r $DOTS_DIR/$config $HOME/$config"
  gum confirm "proceed with these commands?" && answer="y"

  if [ "$answer" = y ]; then
    gum spin --spinner dot --title "preparing to install $DOTS_DIR/$config to $HOME/$config" -- sleep 3
    cp -r "$DOTS_DIR/$config" "$HOME/$config"
    gum spin --spinner dot --title "installing $DOTS_DIR/$config to $HOME/$config" -- sleep 2
    gum log --structured --level info "the $config has been installed"
  else
    gum log --structured --level info "operation canceled"
  fi
}

function _dots_add() {
  gum write --placeholder "You can add multiple config ex: .config/nvim .config/kitty" >>"$DOTS_DATA_FILE"
}

function _dots_install() {
  declare config answer data
  data=$(grep "" "$DOTS_DATA_FILE")

  if [ -n "$data" ]; then
    config=$(gum choose $data)
  fi

  if [ "$config" == ".bashrc" ]; then
    gum spin --spinner dot --title "preparing to install $config..." -- sleep 3
    echo "source $DOTS_DIR/$config" >>"$HOME/.bashrc"
    gum spin --spinner dot --title "installing $config..." -- sleep 2
    gum style --foreground 64 "completd"
    return
  fi

  if [ -n "$config" ]; then
    if [ -e "$HOME/$config" ]; then
      gum style --foreground 37 "'$HOME/$config' already exists."
      gum confirm "Do you want to overwrite it?" && answer="y"

      if [ "$answer" = "y" ]; then
        gum spin --spinner dot --title "preparing to remove '$HOME/$config..." -- sleep 3
        rm -rf "$HOME/$config"
        gum spin --spinner dot --title "removing '$HOME/$config..." -- sleep 2
        _dots_installation "$config"
      else
        gum log --structured --level info "operation canceled: $answer"
      fi
    else
      _dots_installation "$config"
    fi
  else
    gum log --structured --level error "config not found"
  fi
}

function _dots_update() {
  declare config answer data

  data=$(grep "" "$DOTS_DATA_FILE")

  if [ -n "$data" ]; then
    config=$(gum choose $data)
  fi

  if [ -n "$config" ] && [ -e "$HOME/$config" ]; then
    gum style --foreground 37 "the followings commands are going to be executed:"
    gum style --foreground 160 "rm -rf '$DOTS_DIR/$config'"
    gum style --foreground 160 "cp -r '$HOME/$config' '$DOTS_DIR/$config'"
    gum confirm "proceed with these commands?" && answer="y"

    if [ "$answer" = "y" ]; then
      gum spin --spinner dot --title "preparing to remove '$DOTS_DIR/$config'..." -- sleep 3
      rm -rf "$DOTS_DIR/$config"
      gum spin --spinner dot --title "removing '$DOTS_DIR/$config'..." -- sleep 2
      gum spin --spinner dot --title "preparing to copy '$HOME/$config' to '$DOTS_DIR/$config'..." -- sleep 3
      cp -r "$HOME/$config" "$DOTS_DIR/$config"
      gum spin --spinner dot --title "copying '$HOME/$config' to '$DOTS_DIR/$config'..." -- sleep 2
      gum log --structured --level info "the $DOTS_DIR/$config  has been updated"
    else
      gum log --structured --level info "operation canceled"
    fi
  else
    gum log --structured --level error "$config not found"
  fi
}

function _dots_exit() {
  gum spin --spinner dot --title "exiting..." -- sleep 1
  return
}

function dots() {
  declare DOTS_CMD
  DOTS_CMD=$(gum choose --limit 1 "add" "install" "update" "list" "remove" "exit")

  declare -A subcmds=(
    [update]="_dots_update"
    [add]="_dots_add"
    [install]="_dots_install"
    [list]="_dots_list"
    [remove]="_dots_remove"
    [exit]="_dots_exit"
  )

  if [[ -n "${subcmds[$DOTS_CMD]}" ]]; then
    ${subcmds[$DOTS_CMD]}
  fi
}
