#!/usr/bin/env bash

wget https://storage.googleapis.com/medperf-storage/rsna2023/datasets.tar.gz
tar -xf datasets.tar.gz
rm datasets.tar.gz
mv datasets /workspaces/website/tutorial/datasets