#!/bin/bash

# Input and output directories
INPUT_DIR="/home/lubuntu/Desktop/judo-bot-stuff/full-videos"
OUTPUT_DIR="/home/lubuntu/Desktop/judo-bot-stuff/5-sec-clips"

# Create output directory if it doesn’t exist
mkdir -p "$OUTPUT_DIR"

# Loop through all mp4 files in input dir
for file in "$INPUT_DIR"/*.mp4; do
    filename=$(basename "$file" .mp4)
    
    # Split into 5-second clips
    ffmpeg -i "$file" -c copy -map 0 \
        -f segment -segment_time 5 -reset_timestamps 1 \
        "$OUTPUT_DIR/${filename}_part%03d.mp4"
done

