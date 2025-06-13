#!/bin/bash

while read -r s; do
	[ -z "$s" ] && continue
	t="$(readlink "$s")"
	if [ -z "$t" ]; then
		echo "Skipping: $s is not a symlink"
		continue
	fi
	echo "Replacing symlink $s with contents of $t"
	rm "$s"
	cp -R "$t" "$s"
done < .dotfilerc
