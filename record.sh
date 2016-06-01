#!/bin/bash

# ~~~~~~~~~~~~~~~~~~~~~~~~~~
# Script to pipe output of
# ADB shell screenrecord to
# cusotmized FFplay executable.
#

if [ -z "$1" ]; then
	echo "Please supply FFPlay location.";
	exit 1;
fi
 
FFPLAY=$1

TL=180

BR=1000000

VIDEOPIPE=/tmp/videopipe



function cleanup2 {
	echo "Finishing recording session.";
	rm $VIDEOPIPE;
	exit 1;
}

trap cleanup2 INT

# cleanup on exit
#trap cleanup EXIT


mkfifo $VIDEOPIPE
"$FFPLAY" - < $VIDEOPIPE &

for i in `seq 1 100` 
do
	#sleep $TL 
	echo "RUNNING NOW!!!!!!!!!!"
	current_date_time="`date +%Y%m%d%H%M%S`";

	echo $current_date_time;
	#kill -0 $!
	./adb shell screenrecord --bit-rate=$BR --size=1600x2560 --time-limit=$TL --output-format=h264 - > $VIDEOPIPE

done



