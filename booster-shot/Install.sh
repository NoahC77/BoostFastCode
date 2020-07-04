#!/bin/bash


# Change $SHELL path to pwd/BoostFastCode/booster-shot/.bashrc and store old $SHELL contents into /pwd/BoostFastCode/booster-shoot/careful-for-your-health.conf
# TODO: look into minw configurations
BFC_ROOT_DIR="$(pwd)"
META_DATA_FILE="/meta.dat"

# Keeping a record of the .bashrc being replaced
PREVIOUS_SHELL_RECORD="$(date +%s)"

# cp "$SHELL/.bashrc" "$BFC_ROOT_DIR/shell-history/$(date +%s).bashrc"

echo "Going to copy $SHELL/.bashrc into $BFC_ROOT_DIR/shell-history/$(date +%s).bashrc"

# Yeah I did it
SHELL="$BFC_ROOT_DIR"
