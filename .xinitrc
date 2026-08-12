#!/bin/sh
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
exec dbus-launch --exit-with-session i3
