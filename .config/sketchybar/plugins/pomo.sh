#!/bin/bash
# pomo.sh


INFO=$(~/.local/bin/scripts/pomo/pomo.sh status)

POMO_STATUS="$INFO"

if [ "$SENDER" = "pomo_update" ]; then
  POMO_STATUS="$INFO"
fi

echo $POMO_STATUS

sketchybar --set "pomo" label="$POMO_STATUS"
