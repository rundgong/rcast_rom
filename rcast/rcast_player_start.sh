#!/bin/sh

# Create rcast and videos directories if they dont exist
mkdir -p /data/rcast/videos

# Mount rcast/videos and usb stick on www shared folder
busybox mount --bind /data/rcast/videos /usr/share/www/rcast/videos/internal
mount -t vfat /dev/block/sda1 /usr/share/www/rcast/videos/usb/

# Make playlist of all videos on webserver
cd /system/usr/share/www
busybox find rcast -name *.mp4 > /data/rcast/playlist.temp
cat /data/rcast/playlist.temp | busybox sed s@rcast@http://127.0.0.1/rcast@ > /data/rcast/playlist.txt

# Start rCast Media Player
/system/rcast/rcast_media_player &
