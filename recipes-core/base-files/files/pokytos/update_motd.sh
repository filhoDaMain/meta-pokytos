#!/bin/sh

BUILDINFO="/etc/buildinfo"
DEVICETREE_MODEL="/sys/firmware/devicetree/base/model"
OUTPUT="/etc/motd"
OUTPUT_MIN_LINES_END=18
LINE_WIDTH=80


# Only continue executing if $OUTPUT was not updated (data appended) yet
if [[ ! -f "$OUTPUT" ]]; then
    exit 1
fi
LINE_COUNT=$(wc -l < "$OUTPUT")
if (( LINE_COUNT > OUTPUT_MIN_LINES_END )); then
    # File has more than $OUTPUT_MIN_LINES_END lines.
    # We assume it was already updated by a previous run.
    exit 0
fi


# extract argument $1 value from $BUILDINFO file
_var_from_buildinfo() {
    grep -E "^$1[[:space:]]*=" "$BUILDINFO" | sed 's/^[^=]*=[[:space:]]*//' | tr -d '"' | tr -d "'"
}

DEVICE=$(tr -d '\0' < $DEVICETREE_MODEL)
IMAGE_BASENAME=$(_var_from_buildinfo "IMAGE_BASENAME")
BB_CURRENT_MC=$(_var_from_buildinfo "BB_CURRENT_MC")
MACHINE=$(_var_from_buildinfo "MACHINE")
DISTRO_VERSION=$(_var_from_buildinfo "DISTRO_VERSION")
DATETIME=$(_var_from_buildinfo "DATETIME")
KERNEL_VERSION=$(uname --all | awk '{print $1, $3}')

# Print templates
DEVICE_TEXT=":    DEVICE:    ${DEVICE}"
OS_TEXT=":    OS:        ${IMAGE_BASENAME} ${DISTRO_VERSION} (${BB_CURRENT_MC}), ${MACHINE}"
BUILD_ID_TEXT=":    BUILD_ID:  ${DATETIME}"
KERNEL_TEXT=":    KERNEL:    ${KERNEL_VERSION}"

# Function to pad a line to exactly $LINE_WIDTH chars ending wit an ":"
pad_line() {
    local line="$1"
    local length=${#line}
    local padding=$((LINE_WIDTH - length - 1))
    if (( padding < 0 )); then
        padding=0
    fi
    printf "%s%*s:\n" "$line" "$padding" ""
}

# Write formatted output
{
    echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo "::                                                                            ::"
    pad_line "$DEVICE_TEXT"
    pad_line "$OS_TEXT"
    pad_line "$BUILD_ID_TEXT"
    pad_line "$KERNEL_TEXT"
    echo "::                                                                            ::"
    echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
    echo ""
    echo ""
} >> "$OUTPUT"
