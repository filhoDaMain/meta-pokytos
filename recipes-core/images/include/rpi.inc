unset IMAGE_BOOT_FILES

IMAGE_BOOT_FILES ?= "\
    ${BOOTFILES_DIR_NAME}/* \
    bcm2837-rpi-3-a-plus.dtb \
    ${RPI_EXTRA_IMAGE_BOOT_FILES} \
"
