#!/bin/bash
if [ "$#" -lt "2" ]; then
  echo "usage: $0 <indir> <outfile>"
  exit;
fi

INDIR=${1}
OUTFILE=${2}
genisoimage -o ${OUTFILE} ${INDIR}

