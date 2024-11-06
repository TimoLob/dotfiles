#!/bin/bash
# Look for emojis for other modes here : https://www.nerdfonts.com/cheat-sheet
mode=$(i3-msg -t get_binding_state | jq -r '.name')

case "$mode" in 
  "default")
    echo "󰰒"
    ;;
  "resize")
    echo "%{F#FF8800}󰁌%{F-}"
    ;;
  "volume")
    echo "%{F#FF8800}󰝝%{F-}"
    ;;
  *) # Unknown mode
    echo "%{F#FF0000}%{F-}"
    ;;
esac
