#!/bin/bash

# =========================================================================
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
# USAGE: RMHPD <directorypath>
#
# =========================================================================

# Initializating stuff and constants
# =========================================================================
declare -r TB_DIR_ID=$(date +%S%N)
declare -r SOURCES_DEST='./docsfrontpage/source/'
declare -r OUTPUT_DIR="./${TB_DIR_ID}_RMHPDF_OUT"
declare -r TMP_DAT_PATH="./${OUTPUT_DIR}/${TB_DIR_ID}.dat"

# Delimitor for space seperated list of files who
# satisfy file extension requirements
OIFS=$IFS
IFS=" "

# If no files are put into this dir, then it is deleted at the end script.
# Puting a temp file to print file paths to
mkdir "${OUTPUT_DIR}"
touch "${TMP_DAT_PATH}"
# =========================================================================



# Print the name of each file found to standard out in parallel and 
# copy them into the ./docsfrontpage/source directory.
# =========================================================================
find "$1" -type f -name "*.aadoc" >> "$TMP_DAT_PATH"
find "$1" -type f -name "*.wiki" >> "$TMP_DAT_PATH"
find "$1" -type f -name "*.adoc" >> "$TMP_DAT_PATH"

# Taking every line of output and putting into an array called targets
targets=$( ./ReadFileLines.exe "$TMP_DAT_PATH" )

echo "check sources dest = ${SOURCES_DEST}" 
# Looping through targets and making a copy of every file in the 
# targets array in the $SOURCES_DEST
for i in ${targets[@]}; do
    cp ${targets[$i]} ${SOURCES_DEST}
done

# Garbage Collection
# =========================================================================
unset IFS
rm "$TMP_DAT_PATH"
# =========================================================================

