#!/usr/bin/env bash

shopt -s nullglob

order=()

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
        mv -n  "$f" "${new}"
        ((i++))
    done
done
