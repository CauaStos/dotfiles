exec swayidle -w \
    timeout 5 'exec ~/Documents/Scripts/monitor_sleep.sh' \
    resume 'exec ~/Documents/Scripts/monitor_awake.sh'
