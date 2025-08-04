# @fish-lsp-disable 2002 2003
if status is-interactive
    # Commands to run in interactive sessions can go here
end

if not functions -q fundle
    eval (wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish)
    return false
end

fundle plugin jethrokuan/z
fundle plugin franciscolourenco/done
fundle init

function fish_greeting
    if test $TERM = xterm-ghostty
        fastfetch
    end
end

alias ls="eza --icons"
alias ll="eza --long --icons -a"

set -U __done_notify_sound 1
set -U __done_notification_urgency_level low
set FNM_PATH "$HOME/.local/share/fnm"
set CARGO_PATH "$HOME/.cargo/bin"
set BIN_PATH "$HOME/.local/bin"
set -gx PATH $BIN_PATH $FNM_PATH $CARGO_PATH $PATH
set -gx EDITOR nvim
