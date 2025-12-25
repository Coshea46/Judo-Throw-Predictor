#!/bin/bash

# Directory containing the files
DIR="/home/lubuntu/Desktop/judo-bot-stuff/5-sec-clips"

# Go into the directory
cd "$DIR" || exit

# Counter
count=1

# Loop over files (sorted)
for file in *.mp4; do
    # Zero-padded numbers (e.g., 001.mp4, 002.mp4)
    newname=$(printf "%03d.mp4" "$count")
    
    echo "Renaming $file -> $newname"
    mv "$file" "$newname"
    
    count=$((count + 1))
done

