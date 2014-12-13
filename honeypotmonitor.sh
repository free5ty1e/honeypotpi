#!/bin/bash
honeyPotLogFile="/var/log/xrdp.log"

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
    sleep 30
done


