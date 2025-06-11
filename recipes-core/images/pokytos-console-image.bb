SUMMARY = "Small image with console support"
LICENSE = "MIT"

inherit core-image
IMAGE_LINGUAS = " "

IMAGE_FSTYPES = "ext4 wic"

# Remove wic for emulated devices
IMAGE_FSTYPES:qemuall = "ext4"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
"

IMAGE_ROOTFS_SIZE ?= "8192"
IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
