#! /bin/sh

if sessionlist=$(tmux ls 2>/dev/null); then
    echo -n "%{T3} %{T-}"

    echo "$sessionlist" | while read -r line; do
        session=$(echo "$line" | cut -d ':' -f 1)

        if echo "$line" | grep -q "(attached)"; then
            status="*"
        else
            status=""
        fi

        echo -n "$session $status"
    done
    echo
else
    echo ""
fi
