alias ls="eza --icons"
alias ll="eza --long --icons -a"

bind \cf fzf

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if not functions -q fundle;
  eval (wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish);
else
  fundle plugin 'jethrokuan/z'
  fundle plugin joseluisq/gitnow
  fundle plugin franciscolourenco/done

  set -U __done_notify_sound 1

  fundle init
end
