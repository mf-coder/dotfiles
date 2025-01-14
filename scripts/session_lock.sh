#!/bin/bash

############################################################
#                                                          #
# ███╗   ███╗███████╗██╗██╗      ██████╗ ███████╗██╗   ██╗ #
# ████╗ ████║██╔════╝██║██║      ██╔══██╗██╔════╝██║   ██║ #
# ██╔████╔██║█████╗  ██║██║█████╗██║  ██║█████╗  ██║   ██║ #
# ██║╚██╔╝██║██╔══╝  ██║██║╚════╝██║  ██║██╔══╝  ╚██╗ ██╔╝ #
# ██║ ╚═╝ ██║██║     ██║███████╗ ██████╔╝███████╗ ╚████╔╝  #
# ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚══════╝  ╚═══╝   #
#                                                          #
############################################################

scrot /tmp/cur.png
magick /tmp/cur.png -blur 0x10 /tmp/blur.png
composite -gravity east "$HOME/Downloads/mashiro_peeking.png" /tmp/blur.png /tmp/lock.png

suspend_after_delay() {
    sleep 600
    systemctl suspend
}

suspend_after_delay &
SUSPEND_PID=$!

i3lock -i /tmp/lock.png
kill $SUSPEND_PID 2>/dev/null

rm /tmp/cur.png /tmp/blur.png /tmp/lock.png
