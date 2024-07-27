#!/bin/bash

DISK=$(lsblk -np -o NAME,MOUNTPOINT | awk '$2 == "" {print $1}')

if [ -n "$DISK" ]; then
    echo "Detected unmounted disk: $DISK"
else
    echo "No unmounted disk detected"
    exit 1
fi

# Mount the disk to the workplace
cp /etc/fstab fstab.bak    # create a back-up file

if blkid /dev/vdb; then

    echo "/dev/vdb is formatted"

else

    mkfs.ext4 /dev/vdb

fi

mount ${DISK} ${WORKPLACE}

# save the mounted configuration
echo "${DISK} ${WORKPLACE} ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "Mount is completed!"

