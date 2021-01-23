#!/bin/sh
export PATH=$PATH:~/.local/bin

# Start dwmblocks as statusbar
dwmblocks &

# Start dunst as notificationserver
dunst &
