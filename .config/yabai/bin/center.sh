#!/bin/bash

# Apply the Yabai grid layout
yabai -m window --grid 12:12:1:1:10:10

# Simulate pressing "ctrl + opt + c"
osascript -e 'tell application "System Events" to keystroke "c" using {control down, option down}'
