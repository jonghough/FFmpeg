#!/bin/bash

# PID=$1
# cd /Users/jp20151/Documents/android/sdk/platform-tools

# ./adb shell screenrecord --bit-rate=2500000 --output-format=h264 - | /proc/$PID/fd/0

mkfifo videopipe
./adb shell screenrecord --bit-rate=2500000 --output-format=h264 - > videopipe &
ffplay - < videopipe
