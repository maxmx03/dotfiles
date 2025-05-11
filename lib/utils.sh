#!/bin/bash

function open() {
  # to open directory
  # run: xdg-mime default thunar.desktop inode/directory
  xdg-open "$1"
}

function night() {
  [[ -n $(command -v hyprshade) ]] && [[ -z $(hyprshade current) ]] && hyprshade on blue-light-filter
}

function night_off() {
  [[ -n $(hyprshade current) ]] && hyprshade off
}

function editorconfig {
  declare config
  config="$(pwd)/.editorconfig"
  echo "# EditorConfig is awesome: https://editorconfig.org" >>$config
  echo "# top-most EditorConfig file" >>$config
  echo "root = true" >>$config
  echo "" >>$config
  echo "# Unix-style newlines with a newline ending every file" >>$config
  echo "[*]" >>$config
  echo "charset = utf-8" >>$config
  echo "end_of_line = lf" >>$config
  echo "indent_style = space" >>$config
  echo "insert_final_newline = true" >>$config
  echo "indent_size = 2" >>$config
  echo "quote_type = single" >>$config
}

function manpage {
  local browser=/opt/google/chrome/chrome
  man -H$browser $1
}
