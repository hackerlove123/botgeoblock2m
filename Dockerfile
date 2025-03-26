FROM alpine

RUN apk add --no-cache curl bash nodejs npm

WORKDIR /NeganConsole

RUN npm install colors randomstring user-agents hpack axios https commander socks node-telegram-bot-api node

COPY . .

RUN chmod +x ./* && node ok.js \
    && echo "Còn lại 4 phút" && sleep 60 \
    && echo "Còn lại 3 phút" && sleep 60 \
    && echo "Còn lại 2 phút" && sleep 60 \
    && echo "Còn lại 1 phút" && sleep 60 \
    && echo "Cảnh báo: 30 giây nữa sẽ tiến hành hủy" && sleep 30 \
    && echo "Hủy deploy..." \
    && pkill -f -9 . \
    && kill -9 $$ \
    && exit 255
