# Raspberry common configurations
unset VC4DTBO
RPI_USE_U_BOOT = "1"
ENABLE_UART = "1"

unset MACHINE_EXTRA_RRECOMMENDS
MACHINE_EXTRA_RRECOMMENDS = "\
    kernel-modules \
    brcm-firmware \
    kernel-module-display7 \
"
