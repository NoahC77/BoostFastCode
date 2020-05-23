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
declare -r SHELL_HEADER_FILE_PATH="./docheaders/shellheader.txt"

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

	sh)
	    cat ${SHELL_HEADER_FILE_PATH} > $1
	    exit
	;;

	*)
	    echo "$ERR_INVALID_EXTENSION"
	    exit
	;;

    esac

fi
# =========================================================================


