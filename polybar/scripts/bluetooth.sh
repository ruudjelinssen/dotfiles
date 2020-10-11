#!/bin/bash
case $1 in
    --toggle)
        if [[ $(bluetoothctl show | grep "Powered: yes" | wc -c ) -eq 0 ]]; then
            rfkill unblock bluetooth
        else
            rfkill block bluetooth
        fi
        ;;
    *)
        if [[ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]]; then
            echo "%{T2}%{F#4e4e4e}%{F-}%{T}"
        elif [[ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]]; then
            echo "%{T2}%{F#dfdfdf}%{F-}%{T}"
        else
            echo "%{T2}%{F#dfdfdf}%{F}%{T}"
        fi
        ;;
esac
