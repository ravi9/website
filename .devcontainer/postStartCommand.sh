#!/usr/bin/env bash

cd /medperf/server
cp .env.local.local-auth .env
# hotfix: use python3.9 in place of python
sed -i 's/python /python3.9 /g' setup-dev-server.sh
echo "Running a local MedPerf server"
bash ./setup-dev-server.sh < /dev/null &>server.log &
sleep 30
if [ ! -f "db.sqlite3" ]; then
    echo "Setting up the local database"
    python3.9 ./seed.py --demo benchmark
fi
medperf profile activate local