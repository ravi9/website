#!/usr/bin/env bash
cd /medperf/server
alias python=python3.9 && bash ./setup-dev-server.sh < /dev/null &>server.log &
sleep 30
python3.9 ./seed.py --demo benchmark