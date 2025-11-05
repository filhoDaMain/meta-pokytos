# Build info added by 'image-buildinfo' to /etc/buildinfo
IMAGE_BUILDINFO_VARS = "\
    MACHINE \
    DISTRO \
    DISTRO_VERSION \
    IMAGE_BASENAME \
    DATETIME \
    BB_CURRENT_MC \
"

# developer only extra buildinfo
IMAGE_BUILDINFO_VARS:append:developer = "\
    DISTRO_FEATURES \
    MACHINE_FEATURES \
    MACHINE_EXTRA_RRECOMMENDS \
"

# Don't include in /etc/buildinfo information about layer revisions
# if image is not of 'developer' type.
# This section is always the last to come in /etc/buildinfo.
python buildinfo_clean_layer_revs () {
    if d.getVar('BB_CURRENT_MC') == 'developer':
        return  # Leave file intact
    else:
        destfile = d.expand('${BUILDINFODEST}${IMAGE_BUILDINFO_FILE}')

        with open(destfile, 'r') as f:
            lines = f.readlines()

            pattern = [
                "-----------------------\n",
                "Layer Revisions:      |\n",
                "-----------------------\n"
            ]

        for i in range(len(lines)):
            if lines[i:i+3] == pattern:
                lines = lines[:i]   # Ignore all lines after pattern
                break

        # Re-write /etc/buildinfo without Layer Revivisions section
        with open(destfile, 'w') as f:
            f.writelines(lines)

}
IMAGE_PREPROCESS_COMMAND += "buildinfo_clean_layer_revs"
