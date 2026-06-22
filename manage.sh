#!/bin/bash

pid=$(pgrep $1)

if [ -n "$pid" ]; then

    case $2 in
        stop)
            kill -15 $pid    # politely ask process 569 to stop
        ;;
        reload)
            kill -1 $pid   # tell it to reload
        ;;
        kill)
            kill -9 $pid    # force kill it
        ;;
        status)
            cpu=$(ps -p $pid -o %cpu,%mem | tail -n 1 | awk '{print $1}')
            mem=$(ps -p $pid -o %cpu,%mem | tail -n 1 | awk '{print $2}')
            echo "The process ID is $pid | CPU: $cpu% | RAM: $mem%"
         ;;

    esac
else
    echo "$1 is not running"
fi