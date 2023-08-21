#!/bin/bash

# Check if the audio is muted or not using pamixer
is_muted=$(pamixer --get-mute)

# Toggle mute/unmute based on the current state
if [ "$is_muted" == "true" ]; then
    pamixer --unmute
    notify-send -t 100 "  Unmuted."
else
    pamixer --mute
    notify-send -t 100 "󰖁  Muted."
fi

