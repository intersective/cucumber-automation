#!/bin/bash
now=$(date -u +'%S-%M-%H-%d-%m-%Y')
zip reportBackup/reports_$now.zip reports/report.html*
rm reports/report.html.* 
