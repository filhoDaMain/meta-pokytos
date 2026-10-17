include ${SOC_FAMILY}.inc


# Remove files which are polluting the boot logs and can't be disabled through
# PACKAGECONFIG:remove
do_install:append() {
    # "Huge Pages File System was skipped because of an unmet condition"
    if [ "${@bb.utils.contains('MACHINE_FEATURES', 'hugepages', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/sysinit.target.wants/dev-hugepages.mount
        rm -f ${D}${systemd_unitdir}/system/dev-hugepages.mount
    fi

    # "FUSE Control File System was skipped because of an unmet condition"
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'fuse', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/sysinit.target.wants/sys-fs-fuse-connections.mount
        rm -f ${D}${systemd_unitdir}/system/sys-fs-fuse-connections.mount
    fi

    # "Kernel Configuration File System was skipped because of an unmet condition"
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'configfs', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-config.mount
        rm -f ${D}${systemd_unitdir}/system/sys-kernel-config.mount
    fi

    # "Journal Audit Socket was skipped because of an unmet condition check
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'audit', 'True', 'False', d)}" = "False" ]; then
        # Although audit is not there this socket file is still installed. Why?!
        rm -f ${D}${systemd_unitdir}/system/systemd-journald-audit.socket
    fi

    # "Create List of Static Device Nodes was skipped because of an unmet condition"
    # //TODO: Evaluate the possibility of PACKAGECONFIG:remove = "kmod"
    # Currently this service is being used by sun50i to load the wifi-bt modules
    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'configfs', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/sysinit.target.wants/kmod-static-nodes.service
        rm -f ${D}${systemd_unitdir}/system/kmod-static-nodes.service
    fi

    # "File System Check on Root Device was skipped because of an unmet condition
    if [ "${@bb.utils.contains('IMAGE_FEATURES', 'read-only-rootfs', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/systemd-fsck-root.service
    fi

    # "Kernel Trace File System was skipped because of an unmet condition"
    if [ "${@bb.utils.contains('MACHINEOVERRIDES', 'developer', 'True', 'False', d)}" = "False" ]; then
        rm -f ${D}${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-tracing.mount
        rm -f ${D}${systemd_unitdir}/system/sys-kernel-tracing.mount
    fi
}

