#!/bin/sh


COMPOSITE=composite.md
SETTINGS=pdf/packet1.yaml
PANDOC=`which pandoc`
SRC=docs
JULIA=`which julia`
echo Using $PANDOC and $JULIA

$JULIA composite.jl $SETTINGS $SRC $COMPOSITE