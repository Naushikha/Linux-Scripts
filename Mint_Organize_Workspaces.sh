#!/bin/bash

# Move shortcuts to laptop screen
xdotool key super+shift+Right # Assuming we are looking at desktop when script is running

move_windows() {
    # $1 = window name grep matching
    # $2 = monitor left/right?
    wmctrl -lix | grep "$1" | cut -d ' ' -f 1 | xargs -i sh -c "wmctrl -ia {}; xdotool key super+shift+$2"
}

tile_windows() {
    # $1 = window name grep matching
    # $2 = tile left/right of screen?
    wmctrl -lix | grep "$1" | cut -d ' ' -f 1 | xargs -i sh -c "wmctrl -ia {}; xdotool key super+$2"
}

## WORKSPACE 4
# Telegram
move_windows "Telegram" "Left"
tile_windows "Telegram" "Right"
# WhatsApp
move_windows "WhatsApp" "Left"
tile_windows "WhatsApp" "Left"
# Rhythmbox
move_windows "(Paused)" "Right" # Assuming that rhythmbox is paused
# Thunderbird
move_windows "Thunderbird" "Left"
# Todoist
move_windows "Todoist" "Right"

# Fix up VS Code
move_windows "code.Code" "Left"
# Fix Mendeley
move_windows "mendeleydesktop.Mendeley" "Left"
# Fix Okular
move_windows "okular.okular" "Left"
# Fix up terminals
move_windows "gnome-terminal" "Right"
# Fix up nemo
move_windows "nemo.Nemo" "Right"
# Fix up Chrome windows
move_windows "google-chrome" "Left"

wmctrl -s 0 # Switch to W1
