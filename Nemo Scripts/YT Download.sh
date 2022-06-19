#!/bin/bash

IFS=$'\n' SELECTED_FILE=(${NEMO_SCRIPT_SELECTED_FILE_PATHS}) # Get first line in string (seperated by newlines)

FVID=$(head -n 1 ${SELECTED_FILE}) # First video

gnome-terminal --window --maximize -- bash -c "yt-dlp -F ${FVID}; exec bash"

# bestvideo + bestaudio
VIDQ=$(zenity --entry --title="YT Download Script" --text="Select quality (video + audio):" --entry-text "18")
if [ $? = 0 ]; then
  NVIDS=$(cat ${SELECTED_FILE} | sed '/^\s*$/d' | wc -l) # Number of vids
  CVID=0                                                 # Current vid
  (
    while IFS= read -r LINK; do
      [ -z "$LINK" ] && continue
      TITLE=$(yt-dlp --skip-download --get-title --no-warnings $LINK)
      PERCEN=$(echo "$CVID/$NVIDS*100" | bc -l)
      PERCEN=${PERCEN%.*}
      echo $PERCEN
      echo "# Downloading '${TITLE}'..."
      gnome-terminal --wait -- bash -c "yt-dlp -f $VIDQ $LINK;"
      CVID=$((CVID + 1))
    done <"${SELECTED_FILE}"
    echo "# Downloads complete."
  ) |
    zenity --progress --title="YT Download Script" --text="Preparing to download..." --percentage=0 --width=400 --height=100
else
  exit 1
fi
