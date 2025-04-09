#!/bin/bash

#Check argument
if [ $# -ne 2 ]; then
  echo "Usage: ./gencsv.sh <start_index> <end_index>"
  exit 1
fi

start=$1
end=$2

#start should less than end
if [ $start -gt $end ]; then
  echo "Error: Start index should be less than or equal to End index."
  exit 1
fi

> inputFile

#update numbers
for (( i=$start; i<$end; i++ ))
do
  rand=$(( RANDOM % 1000 ))
  echo "$i, $rand" >> inputFile
done

