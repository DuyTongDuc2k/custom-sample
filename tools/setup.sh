#!/bin/bash

mkdir -p /data

export DATA="/data"

./mount-disk

./setup-tools

./get-source



echo "Setting up the environment is completed!"
