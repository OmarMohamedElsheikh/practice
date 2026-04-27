#!/usr/bin/env bash

shopt -s nullglob

order=()
dry_run=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --order)
            shift
            order=("$@")
            break
            ;;
        --file)
            shift
            [[ -f "$1" ]] || { echo "file not found"; exit 1; }
            mapfile -t order < "$1"
            break
            ;;
        --dry-run)
            dry_run=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

i=1

for title in "${order[@]}"; do
    for f in *"$title"*; do
    	echo $f
        [[ -e "$f" ]] || continue

        ext=".${f##*.}"

		new=$(printf "%02d. %s%s" "$i" "$title" "$ext")

		if [ "$dry_run" = true ]; then
            echo "mv -n \"$f\" \"$new\""
        else
            mv -n "$f" "$new"
        fi        ((i++))

    done
done
