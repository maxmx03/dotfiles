#!/bin/bash

function _dump {
  local d=$'\t'
  tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}"
}

function _session_exists {
  tmux has-session -t "$1" 2>/dev/null
}

function _add_window {
  tmux new-window -t "$1" -n "$2" -c "$3"
}

function _new_session {
  tmux new-session -d -s "$1" -n "$2" -c "$3"
}

function _tmx_help {
  gum style --foreground 37 "📝 Notes - Help

  Usage: tmx <command>
  Dependencies: gum

  COMMANDS:"
  gum style --foreground 166 "
  attach         session
  list           sessions
  restore        restore sessions
  save           save sessions
  new            new session
  help           help"
}

function _tmx_new {
  tmux new-session -s $1
}

function _tmx_save {
  _dump > ~/.cache/tmux-session
}

function _tmx_attach {
  declare session sessions
  sessions=$(awk '{print $1}' $HOME/.cache/tmux-session | uniq)
  session=$(gum choose --limit 1 --header "Select a session" $sessions)
  tmux attach-session -t "${session}"
}

function _tmx_list {
  declare session sessions
  sessions=$(awk '{print $1}' $HOME/.cache/tmux-session | uniq)
  gum style --foreground 210 --padding "1 0" "Tmux Sessions"
  echo "$sessions"
}


function _tmx_restore {
  tmux start-server
  local count=0

  if [[ ! -f ~/.cache/tmux-session ]]; then
    echo "Session file not found!"
    return 1
  fi

  while IFS=$'\t' read -r session_name window_name dir; do
    if [[ -d "$dir" && $window_name != "log" && $window_name != "man" ]]; then
      if _session_exists "$session_name"; then
        _add_window "$session_name" "$window_name" "$dir"
      else
        _new_session "$session_name" "$window_name" "$dir"
        count=$(( count + 1 ))
      fi
    fi
  done < ~/.cache/tmux-session

  echo "Restored $count sessions"
}


function tmx() {
  declare -A subcmds=(
  [attach]="_tmx_attach"
  [restore]="_tmx_restore"
  [save]="_tmx_save"
  [new]="_tmx_new"
  [list]="_tmx_list"
  [help]="_tmx_help"
)
[[ -z "${subcmds[$1]}" ]] && {
  _tmx_help
  return 1
} || ${subcmds[$1]} "$2"
}
