#!/bin/bash
INTERNAL="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep eDP)"
# LEFT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-1)"
LEFT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep HDMI)"
# RIGHT="$(xrandr --current | sed 's/^\(.*\) connected.*$/\1/p;d' | grep DP2-3)" // Don't use third one

if [[ ! -n $LEFT ]] && [[ ! -n $RIGHT ]] # Single monitor setup
then
    xrandr --output eDP --mode 2160x1440 --primary 
    # xrandr --output DP2-1 --off 
    # xrandr --output DP2-3 --off
elif [[ -n $LEFT ]] 
# && [[ -n $RIGHT ]] # Dual monitor dock setup with HDMI and Display port
then
    xrandr --output eDP --mode 2160x1440 --primary 
    xrandr --output HDMI-A-0 --mode 1920x1080 --left-of eDP
    # xrandr --output eDP1 --off
else # Fail-safe
    xrandr --output eDP --mode 2160x1440 --primary 
   # --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off
fi

~/.config/i3/scripts/toggle_gaps.sh 1
