#!/bin/bash

exec 1<&-
exec 2<&-

exec 1<>/var/log/first-boot.log
exec 2>&1

if [ ! -e /first-boot ] ; then
  echo "/first-boot doesn't exist ; exiting"
  exit 1
fi

echo "Reconfiguring openssh-server"
dpkg-reconfigure openssh-server

echo "Cleaning up"
rm -f $0
rm -f /first-boot
systemctl disable first-boot
rm -f /etc/systemd/system/first-boot.service
