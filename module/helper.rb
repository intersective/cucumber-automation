require 'json'
require 'securerandom'


def generateStudentId()
	localNow = Time.now
	return "%s%s%s%s%s%s" % [localNow.year.to_s, prependZero(localNow.month), prependZero(localNow.day), prependZero(localNow.hour), prependZero(localNow.min), prependZero(localNow.sec)]
end

def prependZero(num)
	if num < 10
		return "0%s" % [num.to_s]
	else
		return num.to_s
	end
end

def readJsonfile(filePath)
	fileContent = File.read(filePath)
	dataHash = JSON.parse(fileContent)
	return dataHash
end

def compareWithLog(headerMessage, expectedValue, actualValue)
	if expectedValue != actualValue
		$testLogger1.logCase(headerMessage + " [ " + expectedValue + " ] but found [ " + actualValue + " ]")
	end
end

def getUploadFileFullPath(fileName)
	return File.join($configObj["uploadFilePath"], fileName)
end
