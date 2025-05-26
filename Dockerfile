FROM alpine

# Cài đặt dependencies
RUN apk add --no-cache curl bash nodejs npm

# Thiết lập thư mục làm việc
WORKDIR /NeganConsole

# Cài đặt các package Node.js
RUN npm install colors randomstring user-agents hpack axios https commander socks node-telegram-bot-api

# Copy toàn bộ source code vào container (bao gồm cả start.sh)
COPY . .

# Chỉ cấp quyền thực thi
RUN chmod +x ./*

# Chạy script khi build (chỉ dùng RUN)
RUN /NeganConsole/start.sh
