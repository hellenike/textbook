#!/bin/sh

OUTFILE=pdf/hellenike.pdf
COMPOSITE=composite.md
SETTINGS=pdf/settings.yaml
PANDOC=`which pandoc`
SRC=docs
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $SRC $COMPOSITE
$PANDOC $COMPOSITE --from markdown --template eisvogel --pdf-engine=tectonic -V paper:letter -V 'sansfont:Brill' -V 'mainfont:Brill' --table-of-contents --number-sections  --top-level-division=chapter -V classoption=oneside -o $OUTFILE

# -V 'mainfont:Lucida Grande'
# -V classoption=oneside