#!/bin/sh

connection_status() {
    connection=$(sudo wg show "$config_name" 2>/dev/null | head -n 1 | awk '{print $NF }')

    if [ "$connection" = "$config_name" ]; then
        echo "1"
    else
        echo "2"
    fi
}

config="/etc/wg/wg0.conf"
config_name=$(basename "${config%.*}")

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        sudo wg-quick down "$config_name" 2>/dev/null
    else
        sudo wg-quick up "$config_name" 2>/dev/null
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo "  $config_name"
    elif [ "$(connection_status)" = "3" ]; then
        echo "#3 Config not found!"
    else
        echo "%{F#4e4e4e}輦  $config_name%{F-}"
    fi
    ;;
esac
