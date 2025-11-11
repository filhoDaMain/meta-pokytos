FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

hostname = "${DISTRO}"

SRC_URI += "\
    file://update_motd.sh \
    file://update-motd.service \    
"

inherit systemd
SYSTEMD_SERVICE:${PN} = "update-motd.service"

do_install:append(){
    install -d ${D}${sbindir}
    install -d ${D}${systemd_system_unitdir}
    install -m 0755 ${WORKDIR}/update_motd.sh ${D}${sbindir}
    install -m 0644 ${WORKDIR}/update-motd.service ${D}${systemd_system_unitdir}
}
