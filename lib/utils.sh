#!/bin/bash


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

export -f loading

function open() {
  # to open directory
  # run: xdg-mime default thunar.desktop inode/directory
  xdg-open "$1"
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
