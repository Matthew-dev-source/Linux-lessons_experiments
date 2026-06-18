#!/bin/bash

pid=$(pgrep $1)

if [ -n "$pid" ]; then
    cpu=$(ps -p $pid -o %cpu,%mem | tail -n 1 | awk '{print $1}')
    mem=$(ps -p $pid -o %cpu,%mem | tail -n 1 | awk '{print $2}')

    echo "The process ID is $pid, CPU usage is at $cpu and memory is $mem"

else

    echo "This program is not running"

fi
