#!/bin/bash

timeout_script="Scripts/monitor_sleep.sh"
return_script="Scripts/monitor_awake.sh"




on_timeout(){
    if [ -e "$timeout_script" ]; then
        exec "$timeout_script"
    fi
}

on_return(){
    if [ -e "$return_script" ]; then
        exec "$return_script"
    fi
}



#seconds for timeout
seconds=10

is_timeout_enabled=false


