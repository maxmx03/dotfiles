#!/bin/bash

function _tmx_help {
  echo "📝 Notes - Help

  Usage: tmx <command>
  Dependencies: jq tmux

  COMMANDS:
  newx  config.json   new complex sessions
  new   session-name  new session
  attach              attach session
  rm                  rm session
  help                help"
}

function _tmx_newx {
  declare directory file
  directory=$(pwd)
  file="${directory}/$1"

  num_sessions=$(jq '.sessions | length' "${file}")

  for ((i = 0; i < num_sessions; i++)); do
    declare project root 
    declare -i index=1

    session=$(jq ".sessions[$i]" "${file}")
    project=$(echo "${session}" | jq -r .name)

    tmux has-session -t $project 2>/dev/null

    if [ $? != 0 ]; then
      tmux new-session -s $project -d

      root=$(echo "${session}" | jq -r .root)
      tmux send-keys -t $project "cd $root" C-m
      tmux send-keys -t $project "clear" C-m

      # Extraindo as janelas
      mapfile -t windows < <(echo "$session" | jq -r '.windows[]')

      for window in "${windows[@]}"; do
        if [[ $index -gt 1 ]]; then
          tmux new-window -t $project
        fi
        tmux send-keys -t $project "cd $root" C-m
        tmux send-keys -t $project "$window" C-m
        index=$index+1
      done

      tmux select-window -t "${project}:1"
    fi
  done
}

function _tmx_rm {
  sessions=$(tmux ls | awk -F':' '{print $1}')

  echo "Select a session to delete:"
  select session in $sessions; do
    if [ -n "$session" ]; then
      break
    else
      echo "Invalid selection."
    fi
  done

  read -p "Are you sure you want to delete the session '$session'? (y/n): " confirm
  if [[ "$confirm" == [yY] ]]; then
    tmux kill-session -t "$session"
    echo "Session '$session' deleted."
  else
    echo "Deletion canceled."
  fi
}

function _tmx_new {
  declare session confirm
  session=$1

  [[ -z $session ]] && _tmx_help && return

  read -p "attach to the session '$session'? (y/n): " confirm
  if [[ "$confirm" == [yY] ]]; then
    tmux new -s $session
  else
    tmux new -s $session -d
  fi
}

function _tmx_attach {
  declare session sessions
  sessions=$(tmux ls | awk -F':' '{print $1}')
  echo "select a session"
  select session in $sessions; do
    if [ -n "$session" ]; then
      break
    else
      echo "Invalid selection."
    fi
  done

  tmux attach-session -t "${session}"
}

function tmx() {
  declare -A subcmds=(
    [attach]="_tmx_attach"
    [new]="_tmx_new"
    [newx]="_tmx_newx"
    [rm]="_tmx_rm"
    [help]="_tmx_help"
  )
  [[ -z "${subcmds[$1]}" ]] && {
    _tmx_help
    return 1
  } || ${subcmds[$1]} "$2"
}
