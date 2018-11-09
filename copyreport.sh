#!/bin/bash
NOW=$(date -u +'%S-%M-%H-%d-%m-%Y')
TESTSUITNAME=$1
S3REPORTNAME=$(awk '{split($0, a, "."); print a[1]}' <<< $TESTSUITNAME)
ruby tools/test_reports.rb > reports/report-date.html
aws s3 cp reports/report-date.html s3://sydney-test-data/ui-automation/reports/$S3REPORTNAME-$NOW.html