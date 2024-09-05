#!/bin/bash
clear

echo ""
echo " **************************************"
echo " *                                    *"
echo " *   Welcome to KGDB session helper!  *"
echo " *     Follow the next instructions   *"
echo " *                                    *"
echo " **************************************"
echo ""

echo "Start kernel debugger"
echo "  Target shell (ssh):"
echo "  +-------------------------------------------------------+"
echo "  |  # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc  |"
echo "  |  # echo g > /proc/sysrq-trigger                       |"
echo "  +-------------------------------------------------------+"
echo ""
echo "Press ANY KEY when done"

read -p "Waiting... " -n1 -s
echo ""

# Start GDB in host
source ENV_DEBUG_VARS
source ${SDK_ENV_FILE}
cgdb -d ${CROSS_DEBUGGER} -x gdbinit ${KERNEL_BUILD_DIR}/vmlinux
