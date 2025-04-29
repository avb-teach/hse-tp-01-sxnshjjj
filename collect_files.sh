#!/bin/bash
input_dir="$1"
output_dir="$2"
find "$input_dir" -type f | while read -r file; do
  filename=$(basename "$file")
  target="$output_dir/$filename"
  i=1
  while [ -e "$target" ]; do
    target="$output_dir/${filename%.*}$i.${filename##*.}"
    i=$((i + 1))
  done
  cp "$file" "$target"
done
