#!/bin/bash
source getKernelSourcesNoGUI.sh
apt-get install qt5-default -y
# Ready to configure kernel
make xconfig
