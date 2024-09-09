#!/bin/bash

# This script can be used as the "miDebuggerPath" of a VSCode launch.json configuration file
# to start a KGDB session

#IMPORTANT - You might need to change this path!
PATH_TO_POKYTOS_SCRIPTS="/home/$USER/dev/repos/pokytos-yocto/pokytos/pokytos-scripts"

source "${PATH_TO_POKYTOS_SCRIPTS}/ENV_DEBUG_VARS"
source ${SDK_ENV_FILE}
${CROSS_DEBUGGER} ${KERNEL_BUILD_DIR}/vmlinux $*
