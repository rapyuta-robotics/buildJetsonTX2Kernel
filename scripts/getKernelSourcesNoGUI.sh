#!/bin/bash

SKIP=false

if [ -d /usr/src/kernel/kernel-4.4 ]; then
  echo "The kernel source already exists in /usr/src/kernel/kernel-4.4"
  echo "Do you wish to remove the current kernel source directory and install fresh?"
  select yn in "Y" "N"; do
    case $yn in
        y|Y )
            sudo rm -r /usr/src/kernel/;
            sudo rm -r /usr/src/hardware;
            break;;
        * ) SKIP=true; break;;
    esac
  done
fi

if [ "$SKIP" = false ]; then
    if [ ! -f /usr/src/public_sources.tbz2 ]; then
       # wget -N https://developer.download.nvidia.com/embedded/L4T/r28_Release_v2.1/public_sources.tbz2?toWMzbmf3Pf4Utd4_DJ5KEtlgBi1COf3kjUdhCLNckj8evJlbs8j10xRrtkJqQhVlX6-SKBfzIuEav86pvM2ohoyZ7PCJk4FqSvwk-nDJI7uq7Z5bgIhX69mdPfFJvpOYAC9plyFLXsF$
       echo "Download L4T28.2.1 public_sources.tbz2 from https://developer.nvidia.com/embedded/linux-tegra and move it to /usr/src before proceeding."
       exit 1
    else
       apt-add-repository universe
       apt-get update
       apt-get install pkg-config -y
       cd /usr/src
       sudo tar -xvf public_sources.tbz2 public_release/kernel_src.tbz2
       tar -xvf public_release/kernel_src.tbz2
       # Space is tight; get rid of the compressed kernel source
       rm -r public_release
       cd kernel/kernel-4.4
       # Go get the default config file; this becomes the new system configuration
       zcat /proc/config.gz > .config
    fi
fi

