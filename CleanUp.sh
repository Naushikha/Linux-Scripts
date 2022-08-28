#!/bin/bash

# Taken from: https://forums.linuxmint.com/viewtopic.php?p=1998994&sid=0c001c815e8302be482b78ccfe339712#p1998994

# Kernel and other Cleanups after Deletions:
sudo apt autoclean
sudo apt autoremove --purge
# Clear Temporary Files:
sudo find /tmp -type f -delete
# Clear Miscellaneous Detritus:
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge
# Clear the Thumbnail Cache:
rm -v -f ~/.cache/thumbnails/*/*.png ~/.thumbnails/*/*.png
# Clear DNS Cache:
sudo systemd-resolve --flush-caches
# Flush Journald:
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s

