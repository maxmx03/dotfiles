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
        fastfetch
    end
end

set -U __done_notify_sound 1
set -U __done_notification_urgency_level low

alias ls="eza --icons"
alias ll="eza --long --icons -a"
