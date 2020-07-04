#!/bin/bash

#=================================================================================================
# FILE:    InstallMHPD.sh
# AUTHOR:  Noah Castetter <nbc170001@utdallas.edu>
# 
# DESC:    A shell script which once ran, allows ./MakeHtmlAndPdf.sh
#          to run using the alias MPHD. This shell script simply 
#	   adds the alias for it to run usidng "MHPD". This script's
#          MVP can be used on Unix or Windows' Gitbash.
#
# USAGE:   ./InstallMHPD.sh
#=================================================================================================


# Determining what kind of OS we are running on. Also Global constants and stuff.
#=================================================================================================

declare osName = ${printenv OS}
#=================================================================================================

