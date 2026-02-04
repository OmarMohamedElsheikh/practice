#!/bin/env bash

find ./ -type f -name "*.mp4" -print0 | while IFS= read -d -r '' file; do

	base="${file%.mp4}"
	audio="${base}.m4a"
	output="${base}.mux.mp4"
	ffmpeg -i "$file" -i "$audio" -c copy "$output" && rm -- "$file" "$audio"
	done 
