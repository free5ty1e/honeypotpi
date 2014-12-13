#!/bin/bash
honeyPotLogFile="/var/log/xrdp.log"

if [ $# -eq 0 ];
then
    echo "No arguments supplied, will use default time between honeypot log polls (30 seconds)"
    secondsBetweenHoneypotLogPolls=30
else
    echo "Using supplied timeout of $1 seconds between honeypot log polls"
    secondsBetweenHoneypotLogPolls=$1
fi


function updateHoneyPotLogModifiedTimeAndBeepIfChanged()
{
    lastHoneyPotLogModifiedTime=$honeyPotLogModifiedTime
    honeyPotLogModifiedTime="$(stat --printf="%Z" $honeyPotLogFile)"
#    if [ -z ${lastHoneyPotLogModifiedTime+x} ];
#    then
#        echo lastHoneyPotLogModifiedTime is unset; this is the first run, no beep allowed...
#    else
        if [ "$honeyPotLogModifiedTime" != "$lastHoneyPotLogModifiedTime" ];
        then
#            echo ========--------********NEW LOGIN CREDENTIALS CAPTURED!********--------========
            echo NEW LOG ACTIVITY CAPTURED!!!!
            echo -ne '\a'
        fi
#    fi
}

while [  1 -lt 2 ]; do
    updateHoneyPotLogModifiedTimeAndBeepIfChanged
    echo "$(ls -l $honeyPotLogFile)"
    echo "Polling honeypot logfile $honeyPotLogFile which was last modified at $honeyPotLogModifiedTime..."
    sudo cat $honeyPotLogFile | grep USER:
    echo "$(date) <--- this is now"
    pitemp.sh
    sleep $secondsBetweenHoneypotLogPolls
done


