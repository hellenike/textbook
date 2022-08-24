#!/bin/sh

OUTFILE=pdf/hellenike-packet1.pdf
COMPOSITE=composite.md
SETTINGS=pdf/packet1.yaml
PANDOC=`which pandoc`
SRC=docs
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $SRC $COMPOSITE
echo "Created composite file. Now running pandoc."

$PANDOC $COMPOSITE --from markdown -o $OUTFILE --pdf-engine=tectonic -V paper:letter -V 'sansfont:Brill' -V 'mainfont:Brill' --template eisvogel --table-of-contents --number-sections  --top-level-division=chapter -V classoption=oneside 

