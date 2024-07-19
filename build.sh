#!/bin/bash

export DATA="/data"
cd $DATA
mkdir -p workplace
cd workplace
export WORKPLACE=`pwd`


PATCH="image-patch.ipp.yml"
CUSTOM="custom.ipp.yml"


# apply the patch and then create the custom distro yml

# Step 1: Get the original distro yml.

PATCH=$(find $DATA -name "$PATCH")

DISTRO_FOLDER= $(find $DATA -type d -name "distro")

ORIGIN_DISTRO=$(yq ".distro" $PATCH | sed 's/"//g') # f40, cs9, eln, f38

ORIGIN_DISTRO=$(find $DISTRO_FOLDER -name "$ORIGIN_DISTRO.ipp.yml") || echo "$ORIGIN_DISTRO.ipp.yml not found"

APPLY_PATCH_PATH=$(find $DATA -name "apply-patch.py")

# Apply the patch to the origin distro and then create the custom distro
rm -rf $CUSTOM
touch $CUSTOM

python3 $APPLY_PATCH_PATH $ORIGIN_DISTRO $PATCH -o $CUSTOM

# Copy the custom distro to distro folder

cp $CUSTOM $DISTRO_FOLDER && "Copy the custom distro is completed"

cd $(find $DATA -type d  -name "osbuild-manifests")

echo "Start the build for the custom distro"

sleep 3

#make custom-qemu-developer-regular.aarch64.qcow2

#mv custom-qemu-developer-regular.aarch64.qcow2 $WORKPLACE

rm -rf $DISTRO_FOLDER/$CUSTOM

echo "Build is completed!"


















