#!/usr/bin/env bash

# pull images to save time later
# for FL
docker pull hasan7/fltest:0.0.0-cpu
docker pull mlcommons/miccai2023-tutorial-prep:0.0.0
# for evaluation
docker pull mlcommons/miccai2023-trained:1.0.0
docker pull mlcommons/miccai2023-metrics:0.0.0