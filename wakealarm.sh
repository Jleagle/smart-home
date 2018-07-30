#!/usr/bin/env bash

sh -c "echo 0 > /sys/class/rtc/rtc0/wakealarm"
sh -c "echo `date '+%s' -d '+ 12 hours'` > /sys/class/rtc/rtc0/wakealarm"

/sbin/shutdown -h now
