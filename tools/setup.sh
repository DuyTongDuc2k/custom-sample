#!/bin/bash

mkdir -p /data
cd /data
export DATA=`pwd`

./mount-disk

./setup-tools

./get-source



echo "Setting up the environment is completed!"
