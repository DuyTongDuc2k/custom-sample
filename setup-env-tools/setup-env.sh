#==================================================
# This script for setting up the build AutoSD env #
# Author: Mr.Giryu                                #
# Date  : 27 Jul 2024                             #      
#==================================================

#!/bin/bash

# Create the workplace
mkdir -p /media/data
export WORKPLACE="/media/data"
chmod -R 777 ${WORKPLACE}

# mounting the disk
./mount-disk.sh

sleep 3

# instalation the necessary tools
./setup-tools.sh

sleep 3

# getting the sources
./get-source.sh

sleep 3

echo "Setting up the build env is completed!"



