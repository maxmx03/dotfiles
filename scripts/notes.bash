
#!/usr/bin/env bash

export NOTES_DIR="$HOME/notes"
export NOTES_NOTE_LIST="$HOME/notes/list.txt"
export EDITOR="vim"

if [ ! -e "$NOTES_DIR" ]; then
    mkdir "$NOTES_DIR"
    touch "$NOTES_DIR/list.txt"
fi

_nt_register() {
    local note=$(grep -i -x "$1" "$NOTES_NOTE_LIST")
    if [ -z "$note" ]; then
        echo "$1" >> "$NOTES_NOTE_LIST"
        echo "Note registered successfully."
    else
        echo "Note not found in $NOTES_NOTE_LIST."
    fi
}

_nt_unregister() {
    local note="$1"
    local line_to_remove=$(grep -i -x "$note" "$NOTES_NOTE_LIST")

    if [ -n "$line_to_remove" ]; then
        sed -i "/^$(printf '%s\n' "$line_to_remove" | sed 's/[^^]/[&]/g; s/\^/\\^/g')$/d" "$NOTES_NOTE_LIST"
        echo "Note unregistered successfully."
    else
        echo "Note not found in $NOTES_NOTE_LIST."
    fi
}

_nt_open() {
    pushd "$NOTES_DIR"
    $EDITOR "$(fzf -1)"
    popd
}

_nt_read() {
    pushd "$NOTES_DIR"
    batcat "$(fzf -1)"
    popd
}

_nt_create() {
    local file="$1"
    local file_path="$NOTES_DIR/$file"
    local content=$(basename "$file_path")
    local note_from_list=$(grep -i -x "$1" "$NOTES_NOTE_LIST")

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
                content="---\n"
                content+="title: $file\n"
                content+="pubDate: $(date +"%Y-%m-%d %H:%M:%S")\n"
                content+="author: $USER\n"
                content+="tags: [...]\n"
                content+="---\n"
                echo "$content" >> "$file_path"
                _nt_register "$file"
            fi

            $EDITOR "$file_path"
        fi
    fi
}

_nt_add() {
    if [ -z "$1" ]; then
        echo "You need to pass the folder that has all your notes."
        echo "Example: nt add mynotes"
    else
        pushd "$1"
        cp -r * "$NOTES_DIR"
        echo "$(fdfind md)" >> "$NOTES_NOTE_LIST"
        popd
    fi
}

_nt_remove() {
    pushd "$NOTES_DIR"
    local user_note="$(fzf -1)"
    local note=$(grep -i -x "$user_note" "$NOTES_NOTE_LIST")

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

    popd
}

_nt_list() {
    if [ ! -e "$NOTES_NOTE_LIST" ]; then
        touch "$NOTES_NOTE_LIST"
    fi
    batcat "$NOTES_NOTE_LIST"
}

_nt_help() {
    echo "📝 Notes - Help

  Usage: nt <command> [options]
  Dependencies: charmbracelet/glow, sharkdp/fd

  COMMANDS:
  help           Show this help message
  list           list notes
  create         create note
  read           read note
  open           open note
  add            add all your notes to the notes folder
    remove         remove note"
}

nt() {
    declare -A subcmds=(
        [help]="_nt_help"
        [open]="_nt_open"
        [create]="_nt_create"
        [read]="_nt_read"
        [add]="_nt_add"
        [remove]="_nt_remove"
        [list]="_nt_list"
    )

    [[ -z "${subcmds[$1]}" ]] && { _nt_help; return 1; } || ${subcmds[$1]} $2
}
