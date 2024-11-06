exec swayidle -w \
    timeout 900 'exec ~/Documents/Scripts/monitor_sleep.sh' \
    resume 'exec ~/Documents/Scripts/monitor_awake.sh'
