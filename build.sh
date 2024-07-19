#!/bin/bash

rm -rf deploy
mkdir -p deploy

export SAMPLE_IMAGES="/data/sample-images"
export WORKPLACE=`pwd`
export DEPLOY="${WORKPLACE}/depoy"

#Filenames
CUSTOM="custom.ipp.yml"     # This file will be created in deploy directory
PATCH="image-patch.ipp.yml" # This file locates in $WORKPLACE dir

# Create the custom yml
## Get the distro
DISTRO=$(yq ".distro" $PATCH | sed 's/"//g') # f40, cs9, eln, f38
DISTRO_DIR=$(find $SAMPLE_IMAGES -type d -name "distro") # this place contains the distro yml

python3 apply-patch.py -o $DEPLOY/$CUSTOM $DISTRO_DIR/$DISTRO.ipp.yml $PATCH

cp $DEPLOY/$CUSTOM $DISTRO_DIR


## Build The custom image

BUILD_DIR=$(find $SAMPLE_IMAGES -type d -name "osbuild-manifests")

cd $BUILD_DIR

echo "START THE BUILD"

make custom-qemu-developer-regular.aarch64.qcow2

mv custom-qemu-developer-regular.aarch64.qcow2 $DEPLOY

cd $DEPLOY

ls -l















python3 $APPLY_PATCH_PATH $ORIGIN_DISTRO $PATCH -o $CUSTOM

# Copy the custom distro to distro folder

cp $CUSTOM $DISTRO_FOLDER && "Copy the custom distro is completed"

cd $(find $DATA -type d  -name "osbuild-manifests")

echo "Start the build for the custom distro"

sleep 3

make custom-qemu-developer-regular.aarch64.qcow2

mv custom-qemu-developer-regular.aarch64.qcow2 $WORKPLACE

rm -rf $DISTRO_FOLDER/$CUSTOM

echo "Build is completed!"
