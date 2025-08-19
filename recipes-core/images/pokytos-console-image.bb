SUMMARY = "Small image with console support"
LICENSE = "MIT"

inherit core-image
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

# Machine specific configurations if needed
include include/${SOC_FAMILY}.inc
