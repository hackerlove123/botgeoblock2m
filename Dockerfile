FROM alpine

RUN apk add --no-cache curl bash nodejs npm

WORKDIR /NeganConsole

RUN npm install colors randomstring user-agents hpack axios https commander socks node-telegram-bot-api node

COPY . .

RUN chmod +x ./* && node ok.js && sleep 300 && exit
