#!/bin/sh

FILES=*.swift

for f in $FILES
do
	echo "Running $f ..."
	# run file
	swift $f
done
