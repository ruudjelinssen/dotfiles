#!/bin/bash


case "$1" in
    --toggle)
        if pgrep xautolock > /dev/null; then
            pkill xautolock
            notify-send -i /usr/share/icons/Papirus/16x16/panel/caffeine-cup-full.svg Autolock disabled
        else
            xautolock -time 10 -locker '~/.bin/betterlockscreen -l blur' &
            notify-send -i /usr/share/icons/Papirus/16x16/panel/caffeine-cup-empty.svg Autolock enabled
        fi
        ;;
    *)
        if pgrep xautolock > /dev/null; then
            echo "﯈"
        else
            echo ""
        fi
        ;;
esac
