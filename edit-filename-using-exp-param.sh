#!/bin/bash
FILES=*.txt
for f in $FILES
do
  echo "Processing $f"
  REGNAME=$(awk -F"=" '$1 ~ /Region Name/ {print $2;exit;}' $f)
  echo "$REGNAME"
  FILENAME=${f/%.txt/$REGNAME}
  FILENAME=$(echo $FILENAME|tr -d '\r') #remove CR
  mv "$f" "$FILENAME.txt" #restore extension
done
