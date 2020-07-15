#!/bin/bash
# =======================================================================
#
# File: Install.sh
#
# Author: Noah Castetter nbc170001@utdallas.edu
# Version: 1
# Created: 7-8-2020
# Updated: 7-15-2020
#
# Usage: Go to /booster-shot and run ./Install.sh to set BoostFastCode/booster-shot/
# /bash.bashrc as the system's applied bashrc. System 
# bash.bashrc
#
# Description: Install.sh is the shell script which allows all of BoostFastCode's boosts to be used from any directory. This is done by saving a record of the original bash.bashrc file in booster-shot/shell-history. Each previous bash.bashrc is recorded with in the following format as their file name:
# <Unix-Epoch>.bash_profile
#
# WARNING: WHILE WE ARE RECORDING PREVIOUS bash.bashrc FILES WE ARE STILL AUTOMATING CHANGING bash.bashrc FILES SO PROCEED WITH CAUTION
#
# USAGE: ./Install.sh
# =======================================================================

# Generate .bashrc record id and declare dir path to prepend 
# to later stuff.
declare -r BOOSTER_DIR='/home/2020SummerStuff/BoostFastCode/booster-shot'
COPY_ID="$(date +%s)"
BOOST_REC_RC="$BOOSTER_DIR/shell-history/$COPY_ID.bashrc"


# TODO: look into minw configurations
META_DATA_FILE='/meta.dat'


# Keep record of the .bashrc being replaced.
# TARGET_BASH_RC is the location of the system's active bash.bashrc.
declare -r TARGET_BASH_RC='/etc/bash'
sudo cp "$TARGET_BASH_RC.bashrc" "bash_profile"

# Copy booster-shot .bashrc into the system's bash.bashrc path.
# TARGET_BASH_RC is the location of the system's active bash.bashrc.
NEW_BASH_PROFILE="$BOOSTER_DIR/bash.bashrc"
sudo cp "$NEW_BASH_PROFILE" "$TARGET_BASH_RC"
