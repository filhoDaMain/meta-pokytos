FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Machine specific drivers to be auto-loaded by systemd
SRC_URI += "\
    file://modules.conf; \
"

do_install:append() {
    install -d ${D}${sysconfdir}/modules-load.d/
    install ${WORKDIR}/modules.conf ${D}${sysconfdir}/modules-load.d/modules.conf
}