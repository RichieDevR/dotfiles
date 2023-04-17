#!/usr/bin/env zsh

SOURCE_LIST="$HOME/.zsh/source_list"

if [ ! -f "$SOURCE_LIST" ]; then
  touch $SOURCE_LIST
fi

for location in "$@"; do
  if [ -f "$location" ]; then
    echo "source \"$location\"" >> "$SOURCE_LIST"
  elif [ -d "$location" ]; then
    for file in "$location"/*; do
        echo "source \"$file\"" >> "$SOURCE_LIST"
    done
  else
    echo "File not found: $location"
  fi
done
