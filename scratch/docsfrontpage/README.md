# DocsFrontPage

## Overview
A tool intended for use by UTD OIT HPC to update and create a hub through which educational and generally useful resources can be accessed easily.

## Asciidoctor
The output of this tool are html and pdfs which are generated using Ascii doctor.

## Prereq
1. Ruby version atleast 2.3 for [ASCIIDoctor](https://asciidoctor.org/docs/asciidoctor-pdf/) pdf stuff.

2. ASCIIDoctor PDF published [Gem](https://asciidoctor.org/docs/asciidoctor-pdf/#install-the-published-gem)

## Usage
'*All directory and file paths which follow are relative to the README.md and the MakeHtmlAndPdfDocs.sh.*' To edit or add resources on the Gitlab documentation hub, go to ./source/<idkAdocNameYet> and make any necessary changes. To change the styling with which the html and pdfs are generated go to ./source/assets and do your thing. To change the css styles of the html output go to the top of the .adoc and change the following line :stylesheet: (name of new style sheet here).css. 

TODO: Once the makefile is created actually document what you need to type and where the output is located and how to determine which output you just did.
