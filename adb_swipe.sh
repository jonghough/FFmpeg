#!/bin/bash
echo $1 #sx
echo $2 #sy
echo $3 #ex
echo $4 #ey
echo $5 #screenw
echo $6 #screenh
echo $7 #duration
a=$1
b=$2
c=$3
d=$4
e=$5
f=$6
duration=$7
h=1440
i=2560

./adb -d shell input swipe $1 $2 $3 $4 $($duration*1000)
