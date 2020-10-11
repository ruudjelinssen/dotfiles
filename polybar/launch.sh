#!/bin/bash
# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
case $(hostname -s) in
    bakkie)
        WLAN_IF=wlp6s0 MONITOR=eDP1 polybar main-laptop &
        ;;
    fedora-laptop)
        WLAN_IF=wlp2s0 MONITOR=eDP1 polybar main-laptop &
        ;;
esac
echo "Polybar launched..."
