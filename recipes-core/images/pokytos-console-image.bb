SUMMARY = "Small image with console support"
LICENSE = "MIT"

inherit core-image
IMAGE_LINGUAS = " "

IMAGE_INSTALL += "\
    networkmanager \
    networkmanager-nmcli \
    opkg \
    gdbserver \
"

# Machine specific configurations if needed
include include/${SOC_FAMILY}.inc
