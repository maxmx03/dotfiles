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
    if test $TERM = xterm-256color
        # fastfetch
    end
end

alias ls="eza --icons"
alias ll="eza --long --icons -a"
set -U __done_notify_sound 1
set -U __done_notification_urgency_level low
# fish_add_path "$HOME/.local/share/fnm"
fish_add_path "$HOME/Android/Sdk/platform-tools"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/develop/flutter_linux_3.38.5-stable/flutter/bin"
set -gx EDITOR nvim
# eval (fnm env)
