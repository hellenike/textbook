#!/bin/sh

OUTFILE=pdf/hellenike.pdf
COMPOSITE=composite.md
SETTINGS=pdf/packet1.yaml
PANDOC=`which pandoc`
SRC=docs
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $SRC $COMPOSITE
echo "Created composite file. Now running pandoc."

$PANDOC $COMPOSITE --from markdown -o $OUTFILE --pdf-engine=tectonic -V paper:letter -V 'sansfont:Lato' -V 'mainfont:Lato' --template eisvogel --table-of-contents --number-sections  --top-level-division=chapter -V classoption=oneside 




#$PANDOC $COMPOSITE --from markdown --template eisvogel --pdf-engine=tectonic --table-of-contents --number-sections  --top-level-division=chapter -o $OUTFILE -V classoption=oneside -V 'mainfont:Cardo'




#'mainfont:Open Sans'

# -V 'mainfont:Lucida Grande'
# -V classoption=oneside