#!/bin/bash

#Just in case apache web server is started, we should probably close that for now...
sudo service apache2 stop

sudo /etc/xrdp/xrdp.sh start

