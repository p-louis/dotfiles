#!/bin/bash

percent=$1
size=10

fullChar=""
emptyChar="-"

mod=$(($percent/$size))
n=1

output="["
while [ $n -le $size ]; do
  if [ $n -le $mod ]; then
    output="$output$fullChar"
  else
    output="$output$emptyChar"
  fi
  n=$(($n+1))
done

output="$output]"
echo $output
