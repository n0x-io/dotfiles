#!/bin/sh
# Start statusbar script
statusbar &

# Start dunst as notificationserver
dunst &

# Start the nextcloud client in the background
/usr/bin/nextcloud --background &

# start bitwarden
/usr/bin/bitwarden-desktop &

# start mullvad vpn gui
/usr/bin/mullvad-vpn &
