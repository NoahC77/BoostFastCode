#!/bin/bash


# Change $SHELL path to pwd/BoostFastCode/booster-shot/.bashrc and store old $SHELL contents into /pwd/BoostFastCode/booster-shoot/careful-for-your-health.conf

# TODO: look into minw configurations
META_DATA_FILE="/meta.dat"

# Keeping a record of the .bashrc being replaced
PREVIOUS_SHELL_RECORD="$(date +%s)"
BFC_ROOT_DIR="$(pwd)"
TARGET_BASH_RC='/etc/bash.bashrc'
sudo cp "$TARGET_BASH_RC" "$BFC_ROOT_DIR/shell-history/$(date +%s).bash_profile"

NEW_BASH_PROFILE="$BFC_ROOT_DIR/bash.bashrc"
# copt boost shot .bashrc into the system specified .bashrc path
sudo cp "$NEW_BASH_PROFILE" "$TARGET_BASH_RC"
