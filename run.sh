#!/bin/bash
touch logs/error.log
touch logs/info.log
touch logs/trace.log
touch logs/testcases.log
reportFile="reports/report.html"
featuresFile=$1
if [ -f "$reportFile" ]
then
	now=$(date -u +'%S-%M-%H-%d-%m-%Y')
	cp "$reportFile" "$reportFile.$now"
fi
cucumber -q @"$featuresFile" --format html --out "$reportFile" --format pretty
