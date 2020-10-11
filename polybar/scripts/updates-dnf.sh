#!/bin/sh

updates=$(dnf updateinfo -q --list | wc -l)

if [ "$updates" -gt 10 ]; then
    echo "%{T3}%{T-} $updates"
else
    echo ""
fi
