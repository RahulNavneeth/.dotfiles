#!/bin/bash

while read -r source; do
	[ -z "$source" ] && continue
	src_path="$PWD/$source"
	dst_path="$HOME/$source"

	[ -e "$dst_path" ] || [ -L "$dst_path" ] && rm -rf "$dst_path"

	mkdir -p "$(dirname "$dst_path")"

	if [ -d "$src_path" ]; then
		cp -r "$src_path" "$dst_path"
	else
		cp "$src_path" "$dst_path"
	fi

	rm -rf "$source"
	ln -sf "$dst_path" "$source"
done < .dotfilerc

