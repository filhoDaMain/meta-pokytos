SUMMARY = "Small image with console support"
LICENSE = "MIT"

inherit core-image image-buildinfo
IMAGE_LINGUAS = " "

IMAGE_INSTALL += "\
    networkmanager \
    networkmanager-nmcli \
    opkg \
    gdbserver \
    libgpiod-tools \
"

IMAGE_FEATURES += "\
    ssh-server-dropbear \
"

TOOLCHAIN_TARGET_TASK += "\
    kernel-devsrc \
"

require include/buildinfo.inc

# Machine specific configurations if needed
include include/${SOC_FAMILY}.inc
