#!/bin/bash
# ==========================================
# Phần 1: Chạy node ok.js trong background
# ==========================================
echo "Khởi động ứng dụng Node.js..."
node ok.js &

# ==========================================
# Phần 2: Đếm ngược 1 giờ (3600 giây)
# ==========================================
total_seconds=3600  # 1 giờ = 3600 giây

echo "Bắt đầu đếm ngược 1 giờ..."
while [ $total_seconds -gt 0 ]; do
    hours=$(( total_seconds / 3600 ))
    minutes=$(( (total_seconds % 3600) / 60 ))
    seconds=$(( total_seconds % 60 ))
    
    printf "Thời gian còn lại: %02d:%02d:%02d\n" "$hours" "$minutes" "$seconds"
    sleep 1
    total_seconds=$(( total_seconds - 1 ))
done

# ==========================================
# Phần 3: Gọi API Render (phiên bản đơn giản)
# ==========================================
echo "Đang kích hoạt deploy trên Render..."
curl -X GET "https://api.render.com/deploy/srv-cvhjvtiqgecs73d1hot0?key=bhpT4WemXMo" -w "\nHTTP Status: %{http_code}\n"

wait

# ==========================================
# Phần 4: Kết thúc
# ==========================================
echo "Hoàn thành quy trình"
exit 0
