#!/bin/sh
# Start dwmblocks as statusbar
dwmblocks &

# Start dunst as notificationserver
dunst &

# Start the nextcloud client in the background
/usr/bin/nextcloud --background &
