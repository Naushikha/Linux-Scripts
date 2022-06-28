#!/bin/bash

# Move shortcuts to laptop screen
xdotool key super+d
xdotool key super+shift+Right

WAITTIME=3
## WORKSPACE 4 - Communication, Todoist & Music
wmctrl -s 3 # Switch to W4

# Telegram
/home/naush/Apps/Telegram/Telegram -workdir /home/naush/.local/share/TelegramDesktop/ -- &
sleep $WAITTIME
xdotool key super+shift+Left
xdotool key super+Right

# WhatsApp
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=hnpfjngllnobngcgfapefoaidbinmjnm &
sleep $WAITTIME
xdotool key super+shift+Left
xdotool key super+Left

# Thunderbird
thunderbird &
sleep $WAITTIME
xdotool key super+shift+Left

# Rhythmbox
rhythmbox &
sleep $WAITTIME
xdotool key super+shift+Right

# Todoist
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=elldfnmogicegdcphgljaoaklkpcnbnn &
sleep $WAITTIME
xdotool key super+shift+Right

## WORKSPACE 1 - Personal work
wmctrl -s 1 # Switch to W1

# Chrome: Personal
/usr/bin/google-chrome-stable %U --profile-directory=Default &
sleep $WAITTIME
xdotool key super+shift+Left

## WORKSPACE 2 - Uni work
wmctrl -s 2 # Switch to W2

# Chrome: Uni
/usr/bin/google-chrome-stable %U --profile-directory="Profile 1" &
sleep $WAITTIME
xdotool key super+shift+Left

wmctrl -s 3 # Switch to W4
