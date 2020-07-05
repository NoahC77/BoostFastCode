#!/bin/bash


# Change $SHELL path to pwd/BoostFastCode/booster-shot/.bashrc and store old $SHELL contents into /pwd/BoostFastCode/booster-shoot/careful-for-your-health.conf

# TODO: look into minw configurations
META_DATA_FILE="/meta.dat"

# Keeping a record of the .bashrc being replaced
PREVIOUS_SHELL_RECORD="$(date +%s)"
BFC_ROOT_DIR="$(pwd)"
TARGET_BASH_PROFILE='/.bash_profile'
sudo cp "$TARGET_BASH_PROFILE" "$BFC_ROOT_DIR/shell-history/$(date +%s).bash_profile"

sudo echo "Going to copy $TARGET_BASH_PROFILE into $BFC_ROOT_DIR/shell-history/$(date +%s)$TARGET_BASH_PROFILE"S

NEW_BASH_PROFILE="$BFC_ROOT_DIR/.bash_profile"
# copt boost shot .bashrc into the system specified .bashrc path
sudo echo "Going to copy $BFC_ROOT_DIR/.bash_profile into $TARGET_BASH_PROFILE "
sudo cp "$NEW_BASH_PROFILE" "$TARGET_BASH_PROFILE"
