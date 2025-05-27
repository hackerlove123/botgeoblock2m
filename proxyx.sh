while true; do
  p=$(curl -s "https://wwproxy.com/api/client/proxy/available?key=UK-4f0b5007-9e57-44cf-909b-4f6ff890204d&provinceId=-1" | grep -oP '"proxy"\s*:\s*"\K[^"]+')
  [ -n "$p" ] && echo "Proxy: $p" && echo "$p" > hihi.txt || echo "Lấy proxy thất bại"
  for ((i=120;i>0;i--)); do printf "\rChờ %ds..." $i; sleep 1; done; echo
done