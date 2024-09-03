#!/bin/bash

FILE="copy_log.txt"

if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist. Creating it..."
    touch "$FILE"
    echo "File created: $FILE"
fi

# Sources folder to copy
SOURCE_ANIME="/media/Anime"
SOURCE_CONCERTS="/media/Concerts"
SOURCE_MOVIES="/media/Movies"
SOURCE_SERIES="/media/Series"

# Destination folder (mounted drive)
DESTINATION="/media/pi/Untitled/media"

echo Copying: from  "$SOURCE", to "$DESTINATION"

# Copy the folder
echo "Copy started on: $(date)" >> copy_log.txt
rsync -av --ignore-existing "$SOURCE_ANIME" "$DESTINATION"
rsync -av --ignore-existing "$SOURCE_CONCERTS" "$DESTINATION"
rsync -av --ignore-existing "$SOURCE_MOVIES" "$DESTINATION"
rsync -av --ignore-existing "$SOURCE_SERIES" "$DESTINATION"

# Optional: Log the copy operation
echo "Copy completed on: $(date)" >> copy_log.txt
