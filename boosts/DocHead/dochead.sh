#!/bin/bash


# =========================================================================
#
# File: dochead.sh
#
# Author: Noah Castetter
# Version: 0
# Created: 5-22-2020
# Updated: 5-22-2020
#
# Description: A shell script which takes the name of a file and depending
# on the extension of the file pastes a header format to documentation or
# a simple starter template thing. The templates which are printed onto the
# target are called .autodoc.
#
# USAGE: dochead <filepath>
# =========================================================================

# Input Validation & Declaring Constants
# =========================================================================

declare -r ERR_MISSING_SOURCE="ERROR: MISSING SOURCE FILE PATH CMD ARG. Try dochead source"
declare -r ERR_INVALID_EXTENSION="ERROR: INVALID FILE EXTENSION ON THE FIRST ARGUMENT PASSED"
declare -r LINE_FILE_PATH="./lineFile.txt"
declare -r SHELL_HEADER_FILE_PATH="./docheaders/shellheader.txt"
declare -r CPP_HEADER_FILE_PATH="./docheaders/cppheader.txt"

# If the source arg isn't null, then we will see if it's extension is 
# eligible for prepending through a switch statement
if [ -z "$1" ]
then
    echo $ERR_MISSING_SOURCE
    exit
else

    # Getting the extension of the filename argument
    filename=$(basename -- "$1")
    extension="${filename##*.}"

    # Switch depending on the extension of the first arugment.
    case $extension in

    cpp)
        echo -e "$(cat ${CPP_HEADER_FILE_PATH})$(cat ${LINE_FILE_PATH})$(cat $1)" > "$1"
    ;;

    sh)
        echo -e "$(cat ${SHELL_HEADER_FILE_PATH})$(cat ${LINE_FILE_PATH})$(cat $1)" > "$1"
    ;;

    *)
        echo "$ERR_INVALID_EXTENSION"
    ;;
    esac

fi

# =========================================================================


