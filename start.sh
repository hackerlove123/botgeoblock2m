#!/bin/bash

# Chạy chính chương trình trong background
node ok.js &

# Countdown hủy deploy
echo "Còn lại 4 phút" && sleep 60
echo "Còn lại 3 phút" && sleep 60
echo "Còn lại 2 phút" && sleep 60
echo "Còn lại 1 phút" && sleep 60
echo "Cảnh báo: 30 giây nữa sẽ tiến hành hủy" && sleep 30

# Force kill ứng dụng
echo "Hủy deploy..."
pkill -f -9 ok.js || true  # Thêm || true để tránh lỗi nếu process không tồn tại
exit 255
