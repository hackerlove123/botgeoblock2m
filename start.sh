#!/bin/sh

export NODE_OPTIONS=--max-old-space-size=102400 

node ok &


./monitor.sh & 

#./proxyx.sh &

#./run.sh &

sleep 530

./setup.sh
