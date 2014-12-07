honeypotpi
==========

Script for turning a Raspberry Pi into a Honey Pot Pi

To install, copy these scripts to your Raspberry Pi and execute:
chmod +x ./*.sh
./honeypotcreate.sh 

To start the XRDP honeypot run the following command:
./honeypotstart.sh
(or the actual xrdp command)
sudo /etc/xrdp/xrdp.sh start

The login of failed attempts will be located at:
/var/log/xrdp.log

You can filter for failed logins in a very crude manner:
./honeypotloggedcredentials.sh
(or the actual xrdp command)
sudo cat /var/log/xrdp.log | grep USER:

...and check the raw log by typing:
./honeypotrawlog.sh
(or the actual xrdp command)
sudo cat /var/log/xrdp.log

You can also check your Pi's temperature by typing:
./pitemp.sh

If you would like to have some live monitoring, which shows the logged credentials and the current date every 30 seconds, type:
./honeypotmonitor.sh

The monitor is very useful if you enter LXDE / windowed mode by typing:
startx
...then you can open a terminal window and run the honeypotmonitor.sh on one desktop,
...and run etherape on another desktop by typing into a new terminal window:
sudo etherape
...and run wireshark on another desktop by typing into a new terminal window:
sudo wireshark

Then CTRL - ALT - left arrow or right arrow will switch desktops and you can keep an eye on your HoneyPotPi

...
(Original Linux script creator)Follow me on twitter for more honeypot fun @ebrinkster :)

...
Modified to be a Pi Honeypot by @ChrisPaiano and @CircuitStatic on 20141206
