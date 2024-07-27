#!/bin/bash

cd ${WORKPLACE}

# the tool for building AutoSD
git clone --recursive https://gitlab.com/CentOS/automotive/sample-images.git

# the tool for building container to make RPMS package
git clone https://gitlab.com/CentOS/automotive/container-images/autosd-buildbox.git

echo "Getting the sources are completed!"
