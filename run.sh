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
	if [ $fileextension = "txt" ]
	then
		cucumber -q @"$featuresFile" --format html --out "$reportFile" --format pretty
	else
		cucumber -q $featuresFile --format html --out reports/report.html --format pretty
	fi
	if [ -f "$reportFile" ]
	then
		now=$(date -u +'%Y-%m-%d-%H-%M-%S')
		cp "$reportFile" "reports/report-$now.html"
	fi
else
	echo "does not support this file type "$fileextension
fi
