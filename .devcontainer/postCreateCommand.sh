#!/usr/bin/env bash

mkdir -p /workspaces/website/tutorial/datasets

wget https://storage.googleapis.com/medperf-storage/testfl/data/col1.tar.gz
wget https://storage.googleapis.com/medperf-storage/testfl/data/col2.tar.gz
wget https://storage.googleapis.com/medperf-storage/testfl/data/test.tar.gz
tar -xf col1.tar.gz -C /workspaces/website/tutorial/datasets/
tar -xf col2.tar.gz -C /workspaces/website/tutorial/datasets/
tar -xf test.tar.gz -C /workspaces/website/tutorial/datasets/
rm col1.tar.gz
rm col2.tar.gz
rm test.tar.gz

# copy tutorial md to display on startup
cp /workspaces/website/docs/tutorial.md /workspaces/website/tutorial/README.md