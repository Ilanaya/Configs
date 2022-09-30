#! /bin/env bash

tmp_file="/tmp/.i3-gaps"

if ! [ -z "$1" ]
then
 touch $tmp_file
fi

if [ ! -e "$tmp_file" ]; then
    touch $tmp_file
    i3-msg gaps inner all set 0
    i3-msg gaps outer all set 0
    pkill picom
else
    rm $tmp_file
    i3-msg restart
    sleep 0.5
    picom --daemon --config ~/.config/picom.conf
fi
