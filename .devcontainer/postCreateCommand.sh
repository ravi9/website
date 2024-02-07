#!/usr/bin/env bash

wget https://storage.googleapis.com/medperf-storage/rsna2023/datasets.tar.gz
tar -xf datasets.tar.gz -C /workspaces/website/tutorial/
rm datasets.tar.gz