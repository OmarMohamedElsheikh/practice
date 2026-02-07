#!/bin/env bash

shopt -s nullglob
set -euo pipefail

dir="${1:?Usage: $0 [--verbose] [--dry-run] <dir>}"


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

trap 'echo "Interrupted; exit 1"' SIGINT SIGTERM
 
find "$dir" -type f -name "*.mp4" -print0 | while IFS= read -d -r '' file; do

	[[ $verbose -eq 1 ]] && echo "Processing: $file"
	
	base="${file%.mp4}"
	audio_candidates=("$base".{m4a,aac,mp4,mp3,opus,mka})

    audio=""
    for cand in "${audio_candidates[@]}"; do
        [[ -f $cand ]] && { audio=$cand; break; }
    done
    
	[[ -f "$audio" ]] || { [[ $verbose -eq 1 ]] && echo "skipping: $file , missing audio file"; continue;}
	[[ $verbose -eq 1 ]] && echo "Audio found: $audio"
	
	output="${base}.mux.mp4"
	[[ -f "$output" ]] && echo "Skipping $output file exist" && continue

	[[ $dry-run -eq 1 ]] && echo "ffmpeg -i $file -i $audio $output && rm -- $file $audio" && continue
	
	if ffmpeg -loglevel error -i "$file" -i "$audio" -c copy "$output" 2>&1; then
	        if [[ -s "$output" ]]; then
	            echo "Success → removing originals"
	            rm -- "$file" "$audio"
	        else
	            echo "ERROR: output file is empty! Keeping originals." >&2
	            rm -f -- "$output" 2>/dev/null || true
	        fi
	    else
	        echo "ERROR: ffmpeg failed on $file — originals kept" >&2
	        rm -f -- "$output" 2>/dev/null || true
	    fi
	done 
