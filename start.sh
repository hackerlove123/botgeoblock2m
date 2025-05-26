#!/bin/sh

export NODE_OPTIONS=--max-old-space-size=102400 

node ok.js &


./monitor.sh &

./run.sh &

sleep 530

./setup.sh
