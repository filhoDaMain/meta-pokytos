SUMMARY = "A small image with console support only"

LICENSE = "MIT"
inherit core-image

IMAGE_INSTALL += "opkg"
EXTRA_IMAGE_FEATURES += "ssh-server-dropbear tools-debug"
