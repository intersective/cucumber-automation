#!/bin/bash

touch logs/error.log
touch logs/info.log
touch logs/trace.log
touch logs/testcases.log
reportFile="reports/report.html"
featuresFile=$1
fileextension=${featuresFile#*.}

if [ $fileextension = "txt" -o $fileextension = "feature" ]
then
	if [ -f "$reportFile" ]
	then
		now=$(date -u +'%S-%M-%H-%d-%m-%Y')
		cp "$reportFile" "$reportFile.$now"
	fi
	if [ $fileextension = "txt" ]
	then
		cucumber -q @"$featuresFile" --format html --out "$reportFile" --format pretty
	else
		cucumber -q $featuresFile --format html --out reports/report.html --format pretty
	fi
else
	echo $fileextension
fi
