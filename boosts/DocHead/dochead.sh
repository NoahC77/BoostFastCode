#!/bin/bash

# =========================================================================
#
# File: dochead.sh
#
# Author: Noah Castetter
# Version: 1
# Created: 5-22-2020
# Updated: 7-14-2020
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
DOCHEAD_ROOT_DIR='/home/2020SummerStuff/BoostFastCode/boosts/DocHead/'
declare -r ERR_MISSING_SOURCE="ERROR: MISSING SOURCE FILE PATH CMD ARG. Try dochead source"
declare -r ERR_INVALID_EXTENSION="ERROR: INVALID FILE EXTENSION ON THE FIRST ARGUMENT PASSED"
declare -r TMP_TARGET_FILE_PATH="./tmp.txt"
declare -r LINE_FILE_PATH="$DOCHEAD_ROOT_DIR/lineFile.txt"
declare -r TEX_RESUME_HEADER_FILE_PATH="$DOCHEAD_ROOT_DIR/docheaders/tex-resume-template.txt"
declare -r SHELL_HEADER_FILE_PATH="$DOCHEAD_ROOT_DIR/docheaders/shellheader.txt"
declare -r CPP_HEADER_FILE_PATH="$DOCHEAD_ROOT_DIR/docheaders/cppheader.txt"
declare -r ADOC_DOC_HEADER="$DOCHEAD_ROOT_DIR/docheaders/adoc-doc-template.txt"
declare -r ADOC_TABLE_HEADER="$DOCHEAD_ROOT_DIR/docheaders/adoc-table-template.txt"

# Giving all permissions to target file specified by
# first command line arg.
sudo chmod 777 $1

# Creating temp file to hold original file contents
sudo touch $TMP_TARGET_FILE_PATH
sudo chmod 777 $TMP_TARGET_FILE_PATH

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
# =========================================================================
   
   # Garbage Collection
   # Used at the end of each case to delete the temporary file
   garb_coll () {
      rm $TMP_TARGET_FILE_PATH
   } 

    # Copying contents of file path specified in first command line argument into temp file.
    cp $1 $TMP_TARGET_FILE_PATH
    

    # Switch depending on the extension of the first argument.
    # Overwrites and then appends header lines to now empty target file path
    case $extension in

    adoc)
       
	select headerType in ADOC_DOC_HEADER ADOC_TABLE_HEADER
	do
		case $headerType in 

                  'ADOC_DOC_HEADER')
		      cat $ADOC_DOC_HEADER > $1
    		      cat $LINE_FILE_PATH >> $1
		      cat $TMP_TARGET_FILE_PATH >> $1
		      garb_coll
 		      exit
	   	      ;;
                

		  'ADOC_TABLE_HEADER') 
  		      cat $ADOC_TABLE_HEADER > $1
		      cat $LINE_FILE_PATH >> $1
		      cat $TMP_TARGET_FILE_PATH >> $1
 		      garb_coll
		      exit
		      ;;
    		  esac
	done
    ;;

    tex)
	cat $TEX_RESUME_HEADER_FILE_PATH > $1
	cat $LINE_FILE_PATH >> $1
	cat $TMP_TARGET_FILE_PATH >> $1
        garb_coll
	exit
    ;;

    cpp)
	cat $CPP_HEADER_FILE_PATH > $1
	cat $LINE_FILE_PATH >> $1
	cat $TMP_TARGET_FILE_PATH >> $1
        garb_coll
        exit
    ;;

    sh)
	cat $SHELL_HEADER_FILE_PATH > $1
	cat $LINE_FILE_PATH >> $1
	cat $TMP_TARGET_FILE_PATH >> $1
        garb_coll
        exit
    ;;

    *)
        echo "$ERR_INVALID_EXTENSION"
        garb_coll
    ;;
    esac

fi

exit
