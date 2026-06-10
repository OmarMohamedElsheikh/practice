#!/usr/bin/env bash

shopt -s nullglob

order=()
dry_run=false

# -------------------------
# ARG PARSING
# -------------------------
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

# -------------------------
# MAIN LOOP
# -------------------------
for raw_title in "${order[@]}"; do

    # trim whitespace
    title="$(echo "$raw_title" | xargs)"

    # skip empty lines
    [[ -z "$title" ]] && continue

    # find matches
    matches=( *"$title"* )

    if [[ ${#matches[@]} -eq 0 ]]; then
        echo "NO MATCH: $title"
        continue
    fi

    if [[ ${#matches[@]} -gt 1 ]]; then
        echo "AMBIGUOUS MATCH: $title"
        printf '%s\n' "${matches[@]}"
        continue
    fi

    f="${matches[0]}"

    ext="${f##*.}"

    new=$(printf "%02d. %s.%s" "$i" "$title" "$ext")

    if [[ "$dry_run" == true ]]; then
        echo "mv -n -- \"$f\" \"$new\""
    else
        mv -n -- "$f" "$new"
    fi

    ((i++))

done
