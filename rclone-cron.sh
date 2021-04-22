#!/bin/bash
if pidof -o %PPID -x “rclone-cron.sh”; then
exit 1
fi
echo "Starting rclone sync to GCC praise website - gccpraise.com"
rclone sync /var/opt/sets/ gcc:/home/gccpraise/public_html/opensongv2/sets/
rclone sync /var/opt/songs/ gcc:/home/gccpraise/public_html/opensongv2/xml/
rclone sync /var/opt/html/ gcc:/home/gccpraise/public_html/bulletin/
echo "Completed rclone sync"
exit
