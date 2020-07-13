#!/bin/sh

FILES=solutions/*.swift

for f in $FILES
do	
	# run file
	swift $f

	echo "$f: tests passed"
done
