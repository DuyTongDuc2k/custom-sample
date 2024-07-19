#!/bin/bash

mkdir -p /data
export WORKPLACE="/data"

./mount-disk # mount /dev/vdb to /data 

./install-tools 

./get-source

echo "Setting up the environment is completed!"
