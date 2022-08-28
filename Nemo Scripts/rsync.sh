#!/bin/bash

myDate="$(date +"%Y_%m_%d_%H_%_M_%S")"

DEST=$(zenity --file-selection --directory --title="Select a Backup Destination Folder")

case $? in
0)
    echo "Destination directory '$DEST' selected."
    zenity --question --text="Delete files in destination to match source?" --width=300
    gnome-terminal --window -- bash -c "watch -n 1 tail -n 5 $HOME/Desktop/${myDate}; exec bash"
    if [ $? = 0 ]; then
        echo "Backing up '$PWD' into '$DEST'..."
        rsync -avu --delete . "$DEST" >"$HOME/Desktop/${myDate}" 2>&1
    else
        echo "Backing up '$PWD' into '$DEST'..."
        rsync -avu . "$DEST" >"$HOME/Desktop/${myDate}" 2>&1
    fi
    echo Done.
    echo "Logs are at '$HOME/Desktop/${myDate}'"
    ;;
1)
    echo "No folder selected."
    ;;
-1)
    echo "An unexpected error has occurred."
    ;;
esac
