#!/bin/bash

# Swayidle configuration
SWAYIDLE_TIMEOUT=5
SLEEP_SCRIPT=~/Documents/Scripts/monitor_sleep.sh
WAKE_SCRIPT=~/Documents/Scripts/monitor_awake.sh

# Start swayidle with the specified timeout and actions
swayidle -w timeout $SWAYIDLE_TIMEOUT "exec $SLEEP_SCRIPT" resume "exec $WAKE_SCRIPT"
