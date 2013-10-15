#!/bin/sh

echo "Mounting proc..."
mount -t proc /proc /proc
echo "Mounting sysfs..."
mount -t sysfs /sys /sys
echo "Mounting tmpfs..."
mount -t tmpfs /tmp /tmp
echo "Populate dev..."
mdev -s
echo "complete"
