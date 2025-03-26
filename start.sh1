#!/bin/bash
set -e  # Tự động thoát nếu có lỗi

# ==========================================
# Phần 1: Khởi chạy ứng dụng chính
# ==========================================
echo "🟢 Khởi động ứng dụng Node.js..."
node ok.js &  # Chạy trong nền
APP_PID=$!    # Lưu lại Process ID

# ==========================================
# Phần 2: Đếm ngược 5 phút (300 giây)
# ==========================================
total_seconds=300

echo "⏳ Bắt đầu đếm ngược 5 phút..."
while [ $total_seconds -gt 0 ]; do
    # Tính toán thời gian
    hours=$((total_seconds/3600))
    minutes=$(( (total_seconds%3600)/60 ))
    seconds=$((total_seconds%60))
    
    # Hiển thị thanh progress bar đơn giản
    progress=$((100-(total_seconds*100/300)))
    printf "⌛ Thời gian: %02d:%02d:%02d [%-50s] %d%%\n" \
           $hours $minutes $seconds \
           $(printf '%*s' $((progress/2)) | tr ' ' '#') \
           $progress
    
    sleep 1
    total_seconds=$((total_seconds-1))
done

# ==========================================
# Phần 3: Gọi API Render
# ==========================================
echo "🔵 Đang kích hoạt deploy trên Render..."
API_URL="https://api.render.com/deploy/srv-cvhjvtiqgecs73d1hot0?key=bhpT4WemXMo"
curl_response=$(curl -sS -X GET "$API_URL" -w "\nHTTP Status: %{http_code}\n")
echo "$curl_response"

# ==========================================
# Phần 4: Dọn dẹp và kết thúc
# ==========================================
echo "🛑 Dừng ứng dụng Node.js..."
kill -15 $APP_PID 2>/dev/null || true  # Gửi SIGTERM
sleep 2  # Chờ xử lý dọn dẹp
kill -9 $APP_PID 2>/dev/null || true   # Force kill nếu cần

echo "✅ Hoàn thành quy trình"
exit 0
