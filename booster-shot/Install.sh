#!/bin/bash


# Change $SHELL path to pwd/BoostFastCode/booster-shot/.bashrc and store old $SHELL contents into /pwd/BoostFastCode/booster-shoot/careful-for-your-health.conf

TARGET_BASH_PROFILE='~/.bash_profile'
# TODO: look into minw configurations
BFC_ROOT_DIR="$(pwd)"
META_DATA_FILE="/meta.dat"

# Keeping a record of the .bashrc being replaced
PREVIOUS_SHELL_RECORD="$(date +%s)"

sudo cp "$TARGET_BASH_PROFILE" "$BFC_ROOT_DIR/shell-history/$(date +%s)$TARGET_BASH_PROFILE"

sudo echo "Going to copy $TARGET_BASH_PROFILE into $BFC_ROOT_DIR/shell-history/$(date +%s)$TARGET_BASH_PROFILE"S

# copt boost shot .bashrc into the system specified .bashrc path
sudo echo "Going to copy $BFC_ROOT_DIR/.bash_profile into $TARGET_BASH_PROFILE "
sudo cp "$BFC_ROOT_DIR/.bash_profile" "$TARGET_BASH_PROFILE"
