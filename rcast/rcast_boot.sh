#!/bin/sh

# give sntpd a chance to update if we are connected to internet
sleep 30

date >> /data/temp/userboot_timestamp

# if time has been updated we are connected to the internet
if /system/rcast/check_time_is_set.sh ; then
  echo "Time has been set. Skip rCast mods"
else
  # start sntp server and redirect ntp client to localhost
  echo " " >> etc/hosts
  echo "127.0.0.1 pool.ntp.org" >> etc/hosts
  echo "127.0.0.1 mtalk.google.com" >> etc/hosts
  echo "127.0.0.1 clients4.google.com" >> etc/hosts
  echo "127.0.0.1 google.com" >> etc/hosts
  echo "127.0.0.1 channel.status.request.url" >> /etc/hosts
  echo "127.0.0.1 fonts.googleapis.com" >> /etc/hosts

  /system/rcast/sntp/sntp_server &

  # Start dns server
  cd /system/rcast/dns
  ./dnsserver 53 hosts &

  # 8.8.8.8 (Google DNS) is hardcoded in net_mgr
  ifconfig mlan0:0 8.8.8.8 netmask 255.255.255.255

  # Restart cast_shell
  busybox killall cast_shell
  
fi

