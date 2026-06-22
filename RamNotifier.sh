#!/bin/bash
while true; do

    total=$(free | grep Mem | awk '{print $2}')
    used=$(free | grep Mem | awk '{print $3}')
    percent=$(( used * 100 / total ))

    if [ $percent -gt 15 ]; then
        notify-send "Warning. RAM usage is at ${percent}"
    fi

    sleep 10
done