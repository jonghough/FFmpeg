#!/bin/bash
echo $1
echo $2
a=$1
b=$2
./adb -d shell input tap $a $b
