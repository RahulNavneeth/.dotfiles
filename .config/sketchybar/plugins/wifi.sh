# #!/bin/bash
# # wifi.sh
#
# wifi_name=$(networksetup -getairportnetwork en0 | sed 's/^Current Wi-Fi Network: //')
# if [ -z "$wifi_name" ]; then
#   	sketchybar --set "wifi" label="$(echo "No wifi" | tr '[a-z]' '[A-Z]')"
# else
#   	sketchybar --set "wifi" label="$(echo "[$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1;print $0 | "tr -d ':'";exit}')" | tr '[a-z]' '[A-Z]')]|"
# fi
