#!/bin/busybox ash

YEAR=`date +%Y`

if [ $YEAR -gt 1970 ] ; then
    echo "Time has been updated"
    exit 0
else
    echo "Time has not been updated"
    exit 1
fi