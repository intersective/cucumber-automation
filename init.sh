#!/bin/bash
creatDir(){
	dirPath=$1
	if [ ! -d "$dirPath" ]; then
		if [ ! -L "$dirPath" ]; then
			mkdir $dirPath
		else
			echo "$dirPath is a symbolic(soft) link"
		fi
	else
		echo "$dirPath exists"
	fi
}

creatDir "logs"
creatDir "reports"
creatDir "reportBackup"
creatDir "headlessScreenshot"

touch logs/error.log
touch logs/info.log
touch logs/trace.log
touch logs/testcases.log

echo "init completed"
