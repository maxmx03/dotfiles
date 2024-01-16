#!/usr/bin/env zsh

export NOTES_DIR="$HOME/notes"
export NOTES_NOTE_LIST="$HOME/notes/list.txt"
export EDITOR="vim"

if [ ! -e "$NOTES_DIR" ]; then
	mkdir "$NOTES_DIR"
	touch "$NOTES_DIR/list.txt"
fi

function _nt_register() {
	local note=$(grep -i -x "$1" "$NOTES_NOTE_LIST")
	if [ -z "$note" ]; then
		echo "$1" >> "$NOTES_NOTE_LIST"
    echo "Note registered successfully."
	else
    echo "Note not found in $NOTES_NOTE_LIST."
	fi
}

function _nt_unregister() {
    local note="$1"
    local line_to_remove=$(grep -i -x "$note" "$NOTES_NOTE_LIST")

    if [ -n "$line_to_remove" ]; then
        sed -i "/^$(printf '%s\n' "$line_to_remove" | sed 's/[^^]/[&]/g; s/\^/\\^/g')$/d" "$NOTES_NOTE_LIST"
        echo "Note unregistered successfully."
    else
        echo "Note not found in $NOTES_NOTE_LIST."
    fi
}

function _nt_read() {
	glow $NOTES_DIR
}

function _nt_write() {
	local file="$1"
	local file_path="$NOTES_DIR/$file"
	local content=$(basename $file_path)
	local file_from_list=$(grep -i -x $1 $NOTES_NOTE_LIST)

	if [ ! -z "$file_from_list" ]; then
		$EDITOR $NOTES_DIR/$file_from_list
	else
		if [[ "$content" == *.md ]]; then
			directory_path="${file_path%/*}"

			if [ ! -e "$directory_path" ]; then
				mkdir -p "$directory_path"
			fi

			if [ ! -e "$file_path" ]; then
				touch $file_path
				content="# Title: $content\n\n"
				content+="Date: $(date +"%Y-%m-%d %H:%M:%S")\\ \n"
				content+="Author: $USER\n\n"
				content+="---\n"
				echo "$content" >> "$file_path"
				_nt_register $file
			fi

			$EDITOR $file_path
		fi
	fi
}

function _nt_add() {
	if [ -z $1 ]; then
		echo "You need to pass the folder that have all your notes."
		echo "Example: nt add mynotes"
	else
		pushd -q "$1"
		cp -r * "$NOTES_DIR"
		echo "$(fd md)" >> "$NOTES_NOTE_LIST"
		popd -q
	fi
}

function _nt_remove() {
	pushd -q "$NOTES_DIR"
	local note=$(grep -i -x $1 $NOTES_NOTE_LIST)

	if [ -e "$note" ]; then
		echo "rm -rf $NOTES_DIR/$note"
		echo "Proceed with these commands? (y/n): "
		read answer

		if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
			rm -rf "$note"
			_nt_unregister "$note"
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
	add            add all your notes to the notes folder
	remove         remove note"
}

function nt() {
	typeset -A subcmds=(
	help "_nt_help"
	read "_nt_read"
	write "_nt_write"
	add "_nt_add"
	remove "_nt_remove"
	list "_nt_list"
)

emulate -L zsh
[[ -z "$subcmds[$1]" ]] && { _nt_help; return 1 } || ${subcmds[$1]} $2
}
