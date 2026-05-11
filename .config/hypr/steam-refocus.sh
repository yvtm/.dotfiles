#!/bin/bash
socat - UNIX-CONNECT:/run/user/1000/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
    case $line in
        destroyworkspace*)
            workspace="${line##*>>}"
            if [ "$workspace" = "10" ]; then
                hyprctl dispatch workspace 7
            fi
        ;;
    esac
done
