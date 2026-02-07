#!/usr/bin/env bash

shopt -s nullglob
set -euo pipefail



PARSED=$(getopt --options "" --long verbose,dryrun,rencode -- "$@") || exit 1
eval set -- "$PARSED"

verbose=0
dryrun=0
rencode=0


while true; do 
	case "$1" in 
		--verbose) verbose=1; shift ;;
		--dryrun) dryrun=1; shift ;;
		--rencode) rencode=1; shift ;;
		--) shift; break ;;
		*) echo "Usage: $0 [--verbose] [--dryrun] [--rencode] <dir>"
	esac
done

dir="${1:?Usage: $0 [--verbose] [--dryrun] [--rencode] <dir>}"

trap 'echo "Interrupted" >&2; exit 1' SIGINT SIGTERM
 
while IFS= read  -r -d '' file; do
	
	[[ $verbose -eq 1 ]] && echo "Processing: $file"
	
	base="${file%.mp4}"
	audio_candidates=("$base".{m4a,aac,mp3,opus,mka})

    audio=""
    for cand in "${audio_candidates[@]}"; do
        [[ -f $cand ]] && { audio=$cand; break; }
    done
    
	[[ -n "$audio" ]] || { [[ $verbose -eq 1 ]] && echo "skipping: $file , missing audio file"; continue;}
	[[ $verbose -eq 1 ]] && echo "Audio found: $audio"
	
	output="${base}.mux.mp4"
	[[ -f "$output" ]] && echo "Skipping $output file exist" && continue


	if [[ $rencode -eq 0 ]]; then 
		cmd=(ffmpeg -loglevel error -i "$file" -i "$audio" -c copy "$output")
	else 
		cmd=(ffmpeg -loglevel error -i "$file" -i "$audio" "$output")
	fi

	[[ $dryrun -eq 1 ]] && {
	    printf 'DRY-RUN: %q ' "${cmd[@]}"
	    echo "&& rm -- $file $audio"
	    continue
	}

	if "${cmd[@]}" 2>&1; then 
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
	done < <(find "$dir" -type f -name "*.mp4" -print0)
