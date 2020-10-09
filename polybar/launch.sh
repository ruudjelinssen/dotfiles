#!/bin/bash
# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
for screen in $(bspc query -M --names)
do
    if grep -q "\[bar/$screen\]" "$HOME/.config/polybar/config"; then
        polybar $screen &
    fi
done

echo "Polybar launched..."
