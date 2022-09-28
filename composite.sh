#!/bin/sh

OUTFILE=pdf/hellenike.pdf
COMPOSITE=composite.md
SETTINGS=pdf/settings_w_cover.yaml
PANDOC=`which pandoc`
SRC=docs
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $SRC $COMPOSITE
echo "Created composite file. Now running pandoc."

$PANDOC $COMPOSITE --from markdown -o $OUTFILE --pdf-engine=tectonic -V paper:letter -V 'sansfont:Brill' -V 'mainfont:Brill' --template eisvogel --table-of-contents --number-sections  --top-level-division=chapter -V classoption=oneside 

