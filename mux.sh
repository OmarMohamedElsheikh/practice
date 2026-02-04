#!/bin/env bash

shopt -s nullglob

dir="${1:?Usage: $0 <dir>}"

PARSED=$(getopt --options "" --long verbose,dry-run -- "$@") || exit 1
eval set -- "$PARSED"

verbose=0
dry-run=0
while true; do 
	case "$1" in 
		--verbose) verbose=1; shift ;;
		--dry-run) dry-run=1; shift ;;
		--) shift; break ;;
		*) echo "Usage: $0 [--verbose] [--dry-run] <dir>"
	esac
done

find "$dir" -type f -name "*.mp4" -print0 | while IFS= read -d -r '' file; do

	base="${file%.mp4}"
	audio="${base}.m4a"

	[[ -f "$audio" ]] || continue
	
	output="${base}.mux.mp4"
	ffmpeg -i "$file" -i "$audio" -c copy "$output" && rm -- "$file" "$audio"

	done 
