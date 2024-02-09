#!/usr/bin/env bash
MYWORKSPACE=/workspaces/website
mkdir -p $MYWORKSPACE/datasets

wget https://storage.googleapis.com/medperf-storage/testfl/data/col1.tar.gz
wget https://storage.googleapis.com/medperf-storage/testfl/data/col2.tar.gz
wget https://storage.googleapis.com/medperf-storage/testfl/data/test.tar.gz
tar -xf col1.tar.gz -C $MYWORKSPACE/datasets/
tar -xf col2.tar.gz -C $MYWORKSPACE/datasets/
tar -xf test.tar.gz -C $MYWORKSPACE/datasets/
rm col1.tar.gz
rm col2.tar.gz
rm test.tar.gz