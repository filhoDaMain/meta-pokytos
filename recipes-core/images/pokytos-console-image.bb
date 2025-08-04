SUMMARY = "Small image with console support"
LICENSE = "MIT"

inherit core-image
IMAGE_LINGUAS = " "

unset IMAGE_BOOT_FILES

# Include raspberrypi3 upstream kernel DTB
# //TODO make this in a separate machine specific file
IMAGE_BOOT_FILES ?= "\
    ${BOOTFILES_DIR_NAME}/* \
    bcm2837-rpi-3-a-plus.dtb \
    ${RPI_EXTRA_IMAGE_BOOT_FILES} \
"

unset VC4DTBO
