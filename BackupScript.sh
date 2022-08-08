#!/bin/bash

myDate="`date +"%Y_%m_%d"`"

# Backup UCSC stuff
echo Backing up UCSC stuff...
rsync -avu --delete /mnt/secondary/UCSC/ /media/naush/EXT-HD/BACKUP/UCSC > "$HOME/Desktop/${myDate}_BKUP_UCSC" 2>&1

# Backup DOCS
echo Backing up DOCS...
rsync -avu --delete /mnt/secondary/DOCS/ /media/naush/EXT-HD/BACKUP/DOCS > "$HOME/Desktop/${myDate}_BKUP_DOCS" 2>&1

# Backup MUSIC
echo Backing up MUSIC...
rsync -avu --delete /mnt/secondary/MUSIC/ /media/naush/EXT-HD/BACKUP/MUSIC > "$HOME/Desktop/${myDate}_BKUP_MUSIC" 2>&1

echo Done.
