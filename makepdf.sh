#!/bin/sh

OUTFILE=pdf/hellenike.pdf
COMPOSITE=composite.md
SETTINGS=pdf/settings.yaml
PANDOC=`which pandoc`
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $COMPOSITE
$PANDOC $COMPOSITE --from markdown --template eisvogel --pdf-engine=tectonic --table-of-contents --number-sections  --top-level-division=chapter -o $OUTFILE