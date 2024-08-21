SUMMARY = "A small image with console support only"

LICENSE = "MIT"
inherit core-image

IMAGE_INSTALL += "opkg"
EXTRA_IMAGE_FEATURES += "ssh-server-dropbear tools-debug"

# Include machine specific flags (if any needed)
# (silently fails if no machine specific files are found)
include include/${MACHINE}.inc
