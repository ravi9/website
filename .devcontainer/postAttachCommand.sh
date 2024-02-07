#!/usr/bin/env bash
cd /medperf/server
cp .env.local.local-auth .env
# hotfix
sed -i 's/python /python3.9 /g' setup-dev-server.sh
bash ./setup-dev-server.sh < /dev/null &>server.log &
sleep 30
python3.9 ./seed.py --demo benchmark

# open tutorial guide
code /workspaces/website/docs/tutorial.md