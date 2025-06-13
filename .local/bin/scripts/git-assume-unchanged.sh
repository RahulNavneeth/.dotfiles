#!/bin/bash

for i in "$@"; do
	git update-index --assume-unchanged ${i}
done
