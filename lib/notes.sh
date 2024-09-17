#!/bin/bash

export NOTES_DIR="$HOME/notes"
export NOTES_NOTE_LIST="$NOTES_DIR/list.txt"

if [ ! -e "$NOTES_DIR" ]; then
  mkdir "$NOTES_DIR"
  touch "$NOTES_DIR/list.txt"
fi

function _nt_register() {
  declare note
  note=$(grep -i -x "$1" "$NOTES_NOTE_LIST")
  if [ -z "$note" ]; then
    echo "$1" >>"$NOTES_NOTE_LIST"
    echo "Note registered successfully."
  else
    echo "Note not found in $NOTES_NOTE_LIST."
  fi
}

function _nt_unregister() {
  declare note="$1"
  declare line_to_remove=$(grep -i -x "$note" "$NOTES_NOTE_LIST")

  if [ -n "$line_to_remove" ]; then
    sed -i "/^$(printf '%s\n' "$line_to_remove" | sed 's/[^^]/[&]/g; s/\^/\\^/g')$/d" "$NOTES_NOTE_LIST"
    echo "Note unregistered successfully."
  else
    echo "Note not found in $NOTES_NOTE_LIST."
  fi
}

function _nt_open() {
  declare note
  note=$(gum filter --limit 1 $(grep "" "$NOTES_NOTE_LIST"))
  $EDITOR "$NOTES_DIR/$note"
}

function _nt_read() {
  declare note
  note=$(gum filter --limit 1 $(grep "" "$NOTES_NOTE_LIST"))
  less -N "$NOTES_DIR/$note"
}

function _nt_create() {
  tree "$NOTES_DIR"
  declare file=$(gum input --placeholder "folder/note.md")
  declare file_path="$NOTES_DIR/$file"
  declare content=$(basename "$file_path")
  declare note_from_list=$(grep -i -x "$1" "$NOTES_NOTE_LIST")

  if [ ! -z "$note_from_list" ]; then
    echo "$note_from_list already exists"
  else
    if [[ "$content" == *.md ]]; then
      directory_path="${file_path%/*}"

      if [ ! -e "$directory_path" ]; then
        mkdir -p "$directory_path"
      fi

      if [ ! -e "$file_path" ]; then
        touch "$file_path"
        echo "---" >>"$file_path"
        echo "title: $file" >>"$file_path"
        echo "lastUpdated: $(date +"%Y-%m-%d")" >>"$file_path"
        echo "author: $USER" >>"$file_path"
        echo "tags: [...]" >>"$file_path"
        echo "---" >>"$file_path"
        _nt_register "$file"
      fi

      $EDITOR "$file_path"
    fi
  fi
}

function _nt_remove() {
  declare user_note=$(gum choose $(grep "" "$NOTES_NOTE_LIST"))
  declare note=$(grep -i -x "$user_note" "$NOTES_NOTE_LIST")

  if [ -e "$NOTES_DIR/$note" ]; then
    declare answer
    echo "rm -rf $NOTES_DIR/$note"
    gum confirm "proceed with these commands?" && answer="y"

    if [ "$answer" = "y" ]; then
      rm -rf "$note"
      _nt_unregister "$note"
    else
      gum style --foreground 37 "operation cancelled"
    fi
  else
    gum style --foreground 37 "note not found"
  fi
}

function _nt_list() {
  if [ ! -e "$NOTES_NOTE_LIST" ]; then
    touch "$NOTES_NOTE_LIST"
  fi
  less -N "$NOTES_NOTE_LIST"
}

function _nt_help() {
  gum style --foreground 37 "📝 Notes - Help

  Usage: nt <command> [options]
  Dependencies: gum

  COMMANDS:"
  gum style --foreground 166 "
  list           list notes
  create         create note
  read           read note
  open           open note
  remove         remove note"
}

function nt() {
  declare -A subcmds=(
  [open]="_nt_open"
  [create]="_nt_create"
  [read]="_nt_read"
  [remove]="_nt_remove"
  [list]="_nt_list"
)

[[ -z "${subcmds[$1]}" ]] && {
  _nt_help
  return 1
} || ${subcmds[$1]} $2
}
