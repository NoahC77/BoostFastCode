#!/bin/bash

#=================================================================================================
# FILE:    MakeHtmlAndPdfDocs.sh
# AUTHOR:  Noah Castetter <nbc170001@utdallas.edu>
# CREATED: 5-10-2020
#
# DESC:    A shell script which, once given atleast one argument,
#          uses asciidoctor to generate an html and pdf from the
#          source file which contains .adoc stuff.
#
# BUGS:    User can only use target files which are in (rel to 
#          this sh) ./source and ./build. An example would be
#          "Docs.adoc". User should be able to specify any dir,
#          but if only the file name is given, then the script
#	   should check the ./source directory
#
# TODO:    Add capability to clear all former contents in the 
#	   directory before writing.
#
# USAGE:   ./MakeHtmlAndPdfDocs.sh <SourceFileName> [BuildFileName]
#
#		<SourceFileName> - Name of source file which resides in DEFAULT_SOURCE_PATH
#		[BuildFileName] - Name of build file which is created in DEFAULT_BUILD_PATH
#
#=================================================================================================



# All global constants declared and making sure the user entered atleast one. If the user didn't 
# enter more than zero arguments then the proram prints the appropriate error message and exits.
#=================================================================================================
# EXPECTS FILE NAMES TO NOT BE RELATIVE, JUST THE FILE WHICH SHOULD RESIDE IN A PREDEFINED DIR.

# GLOBAL CONSTANTS
declare -r PDF_EXT='.pdf'
declare -r HTML_EXT='.html'
declare -r ASCIIDOC_EXT='.adoc'
declare -r DEFAULT_SOURCE_PATH='./source/'
declare -r DEFAULT_BUILD_PATH='./build/'

# Errors (glob const)
declare -r ERR_MISSING_SOURCE="ERROR: MISSING SOURCE FILE PATH CMD ARG. Try ./MakeHtmlAndPdfDocs.sh source"
declare -r ERR_TOO_MANY_ARG="ERROR: TOO MANY ARGUMENTS. MAX IS 2. Try ./MakeHtmlAndPdfDocs.sh source"
declare -r ERR_INVALID_SOURCE_EXT="ERROR: SOURCE FILE NAME MISSING .adoc EXTENSION"
declare -r ERR_INVALID_BUILD_EXT="ERROR: BUILD FILE NAME INVAID, MUST BE .html or .pdf. Only source is necessary"

# If the source arg isn't null, then we can make the build name
if [ -z "$1" ]
then
      echo $ERR_MISSING_SOURCE
      exit
else
      declare SOURCEBASED_GENERATED_BUILD_NAME=${1: 0: -5}
fi   
#=================================================================================================



# Handling use cases with different arguments and validating input. The switch case takes the name
# of the source file, cuts off the .adoc, and replaces it with .html and .pdf and generates html 
# and pdf files with those names.
#=================================================================================================
case $# in

# 1 = Handling case where only the source file is passed
  1)
    if [ "$ASCIIDOC_EXT" = "${1: -5:5}" ]
    then

      asciidoctor -o "$DEFAULT_BUILD_PATH""$SOURCEBASED_GENERATED_BUILD_NAME""$HTML_EXT" "$DEFAULT_SOURCE_PATH""$1"&
      asciidoctor-pdf -o "$DEFAULT_BUILD_PATH""$SOURCEBASED_GENERATED_BUILD_NAME""$PDF_EXT" "$DEFAULT_SOURCE_PATH""$1" &
						# we ^ just use the html name a take out .html
    else
      echo $ERR_INVALID_SOURCE_EXT
    fi
  ;;


# 2 = Handling case where source and build file is passed
  2)
    # Checking for correct .adoc extension on the source file
    if [ "$ASCIIDOC_EXT" = "${1: -5}" ]
    then
 
      # todo: add an else to this conditional to get any invalid stuff handled
      if [[ "${2: -5:5}" = "$HTML_EXT" || "${2: -4:4}" = "$PDF_EXT" ]]
      then

        if [ "${2: -5:5}" = "$HTML_EXT" ]
	then
		
	   asciidoctor -o "$DEFAULT_BUILD_PATH""$SOURCEBASED_GENERATED_BUILD_NAME""$HTML_EXT" "$DEFAULT_SOURCE_PATH""$1" &
           asciidoctor-pdf -o "$DEFAULT_BUILD_PATH""$SOURCEBASED_GENERATED_BUILD_NAME""$PDF_EXT" "$DEFAULT_SOURCE_PATH""$1" &
	fi

      fi
      	
 
    else

      echo $ERR_INVALID_BUILD_EXT
    fi
  ;;

# * = Handling more than 2 arg case
  *)
    echo $ERR_TOO_MANY_ARG
    exit
  ;;
esac
#=================================================================================================
