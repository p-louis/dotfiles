#!/bin/bash


fileName=$1
encoding=$2

if [[ "$encoding" == "base64" ]]; then
  outFile="$fileName.tmp"
  cat $fileName | base64 -d > $outFile
  mv $outFile $fileName
fi

khal printics $fileName
