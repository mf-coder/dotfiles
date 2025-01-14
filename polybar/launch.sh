#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 1: Abort script if xrandr is not installed
# 2: Setup a polybar for every connected display
if type "xrandr" >/dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config.ini &
    done
else
    polybar --reload mainbar-i3 -c ~/.config/polybar/config.ini &
fi
