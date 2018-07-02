#!/bin/bash
# For L4T 28.2 the kernel is 4.4.38 hence kernel-4.4

SRC_DIR=$PWD

cd /usr/src/kernel/kernel-4.4

# Patching kernel for dmidecode issue https://devtalk.nvidia.com/default/topic/1003952/dmidecode-crashes-r27-1-on-tx2/?offset=3
echo -e "\e[32mApplying realsense-uvc patch\e[0m"
patch -p0 < $SRC_DIR/patches/mem.patch

