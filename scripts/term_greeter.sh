#!/bin/bash

greet() {
    cur_hour=$(date +"%H")

    if [ "$cur_hour" -ge 0 ] && [ "$cur_hour" -lt 12 ]; then
        message="Morning!"
    elif [ "$cur_hour" -ge 12 ] && [ "$cur_hour" -lt 18 ]; then
        message="Afternoon!"
    else
        message="Evening!"
    fi

    figlet -f /usr/share/figlet/fonts/3d.flf -w 120 $message | lolcat
}

if [[ "$(tput cols)" -ge 120 ]]; then
    greet
fi
