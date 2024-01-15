#!/usr/bin/env zsh

export NOTES_DIR="$HOME/notes"
export NOTES_NOTE_LIST="$HOME/notes/list.txt"
export EDITOR="vim"

if [ ! -e "$NOTES_DIR" ]; then
	mkdir "$NOTES_DIR"
	touch "$NOTES_DIR/list.txt"
fi

function _nt_register() {
	local note=$(grep -w "$1" "$NOTES_NOTE_LIST")
	if [ -z "$note" ]; then
		echo "$1" >> "$NOTES_NOTE_LIST"
	fi
}

function _nt_unregister() {
		 local sanitized_path=$(echo "$1" | sed 's/[^^]/[&]/g; s/\^/\\^/g')

    sed -i "\|$sanitized_path|d" "$NOTES_NOTE_LIST"
    sed -i '/^$/d' "$NOTES_NOTE_LIST"
}

function _nt_read() {
	glow $NOTES_DIR
}

function _nt_write() {
	local user_path="$NOTES_DIR/$1"
	local content=$(basename $user_path)

	if [[ "$content" == *.md ]]; then
		directory_path="${user_path%/*}"

		if [ ! -e "$directory_path" ]; then
			mkdir -p "$directory_path"
		fi

		if [ ! -e "$user_path" ]; then
      touch $user_path
      content="# Title: $content\n\n"
      content+="Date: $(date +"%Y-%m-%d %H:%M:%S")\\ \n"
      content+="Author: $USER\n\n"
      content+="---\n"
			echo "$content" >> "$user_path"
		  _nt_register $user_path
		fi

		$EDITOR $user_path
	fi
}

function _nt_remove() {
	pushd -q "$NOTES_DIR"
	local note=$(fd -p -g "**/$1")

	if [ -e "$note" ]; then
		echo "rm -rf $NOTES_DIR/$note"
		echo "Proceed with these commands? (y/n): "
		read answer

		if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
			rm -rf "$note"
	    _nt_unregister "$NOTES_DIR/$note"
		else
			echo "operation canceled"
		fi
	else
		echo "note not found"
	fi

	popd -q
}

function _nt_list() {
    if [ ! -e "$NOTES_NOTE_LIST" ]; then
        touch "$NOTES_NOTE_LIST"
    fi
    cat "$NOTES_NOTE_LIST"
}

function _nt_help() {
    echo "📝 Notes - Help

Usage: nt <command> [options]
Dependencies: charmbracelet/glow, sharkdp/fd

COMMANDS:
    help           Show this help message
    list           list notes
    read           read note
    write          write note
    remove         remove note"
}

function nt() {
	typeset -A subcmds=(
    help "_nt_help"
		read "_nt_read"
		write "_nt_write"
		remove "_nt_remove"
		list "_nt_list"
  )

	emulate -L zsh
  [[ -z "$subcmds[$1]" ]] && { _nt_help; return 1 } || ${subcmds[$1]} $2
}
