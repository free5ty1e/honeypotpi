#!/bin/bash

while [  1 -lt 2 ]; do
    echo "Polling honeypot at $(date)..."
    sudo cat /var/log/xrdp.log | grep USER:
    echo "$(date) <--- this is now"
    pitemp.sh
    sleep 30
done


