#!/bin/bash

myDate="$(date +"%Y_%m_%d_%H_%_M_%S")"

SOUR=$(zenity --file-selection --directory --title="Select a Folder to Backup")

case $? in
0)
    echo "Source directory '$SOUR' selected."
    DEST=$(zenity --file-selection --directory --title="Select a Backup Destination Folder")

    case $? in
    0)
        echo "Destination directory '$DEST' selected."
        zenity --question --text="Delete files in destination to match source?" --width=300
        if [ $? = 0 ]; then
            echo "Backing up '$PWD' into '$DEST'..."
            rsync -avu --delete "$SOUR/" "$DEST" >"$HOME/Desktop/${myDate}" 2>&1
        else
            echo "Backing up '$PWD' into '$DEST'..."
            rsync -avu "$SOUR/" "$DEST" >"$HOME/Desktop/${myDate}" 2>&1
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
    ;;
1)
    echo "No folder selected."
    ;;
-1)
    echo "An unexpected error has occurred."
    ;;
esac
