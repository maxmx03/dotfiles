#!/bin/bash

declare folder backlog ready inprogress review finish
folder="$HOME/kanban"
backlog="$folder/backlog"
ready="$folder/ready"
inprogress="$folder/inprogress"
review="$folder/review"
finish="$folder/done"
[[ ! -d "$folder" ]] && mkdir "$folder"
[[ ! -d "$backlog" ]] && mkdir "$backlog"
[[ ! -d "$ready" ]] && mkdir "$ready"
[[ ! -d "$inprogress" ]] && mkdir "$inprogress"
[[ ! -d "$review" ]] && mkdir "$review"
[[ ! -d "$finish" ]] && mkdir "$finish"

function _kb_help() {
	gum style --foreground 37 "📝 Kanban - Help

  Usage: kb <command> [options]
  Dependencies: gum

  COMMANDS:"
	gum style --foreground 166 "
  show           show kanban
  add            add card
  open           open card
  move           move card
  remove         remove card"
}

function _kb_move() {
	declare folder list location
	folder="$HOME/kanban/"
	tree "$folder"
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	list=$(gum choose --limit 1 $(ls "${folder}"))
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	[[ -n "$list" ]] && card=$(gum choose --limit 1 $(ls "${folder}${list}"))
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	location=$(gum choose --limit 1 $(ls "${folder}"))
	[[ -n "$location" ]] && [[ -f "${folder}${list}/${card}" ]] && [[ -d "${folder}${location}" ]] && mv "${folder}${list}/${card}" "${folder}${location}"
	tree "$folder"
}

function _kb_remove() {
	declare folder list card
	folder="$HOME/kanban/"
	tree "$folder"
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	list=$(gum choose --limit 1 $(ls "${folder}"))
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	[[ -n "$list" ]] && card=$(gum choose --limit 1 $(ls "${folder}${list}"))
	[[ -f "${folder}${list}/${card}" ]] && rm -ri "${folder}${list:?}/${card}"
	tree "$folder"
}

function _kb_open() {
	declare folder list card
	folder="$HOME/kanban/"
	tree "$folder"
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	list=$(gum choose --limit 1 $(ls "$folder"))
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	[[ -n "$list" ]] && card=$(gum choose --limit 1 $(ls "${folder}${list}"))
	[[ -n "$card" ]] && [[ -f "${folder}${list:?}/$card" ]] && $EDITOR "${folder}${list:?}/$card"
	tree "$folder"
}

function _kb_show() {
	declare folder
	folder="$HOME/kanban"
	tree "$folder"
}

function _kb_add() {
	declare folder list card card_path
	folder="$HOME/kanban/"
	# shellcheck disable=SC2046 # Intended splitting of OPTIONS
	list=$(gum choose --limit 1 $(ls "${folder}"))
	[[ -n $list ]] && card=$(gum input --placeholder "cardname")
	[[ -n $card ]] && touch "${folder}${list}/${card}.md"
	card_path="${folder}${list:?}/${card}.md"
	[[ -f "$card_path" ]] && echo "# Card Name" >>"${card_path}"
	[[ -f "$card_path" ]] && echo "" >>"${card_path}"
	[[ -f "$card_path" ]] && echo "- [x] Task1" >>"$card_path"
	[[ -f "$card_path" ]] && echo "- [x] Task2" >>"$card_path"
	[[ -f "$card_path" ]] && echo "- [x] Task3" >>"$card_path"
	tree "$folder"
}

function kb() {
	declare -A subcmds=(
		[open]="_kb_open"
		[add]="_kb_add"
		[remove]="_kb_remove"
		[show]="_kb_show"
		[move]="_kb_move"
	)
	[[ -z "${subcmds[$1]}" ]] && {
		_kb_help
		return 1
	} || ${subcmds[$1]} "$2"
}
