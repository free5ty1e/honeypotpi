#!/bin/bash
# This is a quick crude guide to getting a RDP honeypot running on Linux
# it uses a version of XRDP on github that will log all attempts
# included some apt-get install items that I was missing on my systems

git clone https://github.com/kx499/xrdp.git
cd xrdp
git pull
sudp apt-get -y update
sudo apt-get -y install build-essential automake autoconf libtool libpam0g-dev libx11-dev libxfixes-dev libssl-dev libxrandr-dev libxrandr2 apt-show-versions libapt-pkg-perl libauthen-pam-perl libio-pty-perl pkg-config make etherape wireshark
sudo apt-get -fy install
sudo ./bootstrap
sudo ./configure
sudo make
sudo make install
sudo xrdp-keygen xrdp
sudo cp rsakeys.ini /etc/xrdp/
clear
echo "To start the XRDP honeypot run the following command:"
echo ""
echo "sudo /etc/xrdp/xrdp.sh start"
echo "...or, you can type: "
echo "honeypotstart.sh"
echo ""
echo "The login of failed attempts will be located at:"
echo "/var/log/xrdp.log"
echo ""
echo "You can filter for failed logins in a very crude manner:"
echo "sudo cat /var/log/xrdp.log | grep USER:"
echo "...or you can type: "
echo "honeypotloggedcredentials.sh"
echo "...or poll every 30 seconds for failed logins, with temperature readings by typing: "
echo "honeypotmonitor.sh"
echo ""
echo "...and check the raw log by typing:"
echo "sudo cat /var/log/xrdp.log"
echo "...or you can also type: "
echo "honeypotrawlog.sh"
echo ""
echo "Follow me on twitter for more honeypot fun @ebrinkster :)"
echo ""
echo "Modified to be a Pi Honeypot by @ChrisPaiano and @CircuitStatic on 20141206"

