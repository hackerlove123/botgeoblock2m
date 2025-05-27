#!/bin/bash
while true; do
  p=$(curl -s "https://wwproxy.com/api/client/proxy/available?key=UK-4f0b5007-9e57-44cf-909b-4f6ff890204d&provinceId=-1" | grep -o '"proxy":"[^"]*"' | sed 's/"proxy":"\([^"]*\)"/\1/')
  if [ -n "$p" ]; then
    echo "Proxy: $p"
    echo "$p" > hihi.txt
  else
    echo "Lấy proxy thất bại"
  fi
  for ((i=300;i>0;i--)); do printf "\rChờ %ds..." $i; sleep 1; done; echo
done
