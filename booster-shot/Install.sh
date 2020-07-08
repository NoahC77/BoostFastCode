#!/bin/bash
# =======================================================================
#
# File: Install.sh
#
# Author: Noah Castetter nbc170001@utdallas.edu
# Version: 1
# Created: 7-8-2020
# Updated: 7-8-2020
#
# Description: Install.sh is the shell script which allows all of BoostFastCode's boosts to be used from any directory. This is done by saving a record of the original bash.bashrc file in booster-shot/shell-history. Each previous bash.bashrc is recorded with in the following format as their file name:
# <Unix-Epoch>.bash_profile
#
# WARNING: WHILE WE ARE RECORDING PREVIOUS bash.bashrc FILES WE ARE STILL AUTOMATING CHANGING bash.bashrc FILES SO PROCEED WITH CAUTION
#
# USAGE: ./Install.sh
# =======================================================================

# Location of bashrc is /etc/bash.bashrc - as of 7-8-2020
# TARGET_BASH_RC is the location of the system's active bash.bashrc
TARGET_BASH_RC='/etc/bash.bashrc'

# TODO: look into minw configurations
META_DATA_FILE='/meta.dat'

# Keeping a record of the .bashrc being replaced
PREVIOUS_SHELL_RECORD="$(date +%s)"
BFC_ROOT_DIR="$(pwd)"
sudo cp "$TARGET_BASH_RC" "$BFC_ROOT_DIR/shell-history/$(date +%s).bash_profile"

NEW_BASH_PROFILE="$BFC_ROOT_DIR/bash.bashrc"
# copt boost shot .bashrc into the system specified .bashrc path
sudo cp "$NEW_BASH_PROFILE" "$TARGET_BASH_RC"
