# Raspberry common configurations

RPI_USE_U_BOOT:rpi = "1"
ENABLE_UART:rpi = "1"

unset MACHINE_EXTRA_RRECOMMENDS
MACHINE_EXTRA_RRECOMMENDS:rpi = "kernel-modules brcm-firmware"
