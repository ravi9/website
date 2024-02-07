#!/usr/bin/env bash
cd /medperf/server
bash ./setup-dev-server.sh < /dev/null &>server.log &
sleep 10
python3.9 ./seed.py --demo benchmark