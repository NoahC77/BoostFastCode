#!/bin/bash

#=========================================================================
#
# File: TMHPD.sh
#
# Author: Noah Castetter
# Version: 0
# Created: 5-22-2020
# Updated: 5-22-2020
#
# Description: A shell script which takes a directory name relative from
# present working directory and searches for any files with the extensions
# .aadoc, .adoc, or .wiki and puts them all into a directory relative
# to the caller's present working directory "./RMHPD_OUT".
#
# WARNING: THIS SCRIPT SHOULD AT NO POINT EVER EDIT THE SOURCE .ADOC ETC.
#
#=========================================================================

# Initializating stuff and constants
#=========================================================================
declare -r TB_DIR_ID=$((date -rfc-2822))
declare -r SOURCES_DEST='./docsfrontpage/source/'
# If no files are put into this dir, then it is deleted at the end script.
# TODO: Make sure you actually do that tho.
mkdir "./${TB_DIR_ID}_RMHDP_OUT"

#=========================================================================

# Print the name of each file found to standard out in parallel and 
# copy them into the ./docsfrontpage/source directory.
#=========================================================================
cp $((find "$1" -type f -name "*.aadoc")) ${SORUCES_DEST} &
cp $((find "$1" -type f -name "*.wiki")) ${SORUCES_DEST} &
cp $((find "$1" -type f -name "*.adoc")) ${SORUCES_DEST} &



