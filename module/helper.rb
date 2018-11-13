require 'json'
require 'securerandom'


def generateUniId()
	utcNow = Time.now.utc
	return "%s%s%s%s%s%s%s" % [utcNow.year.to_s, prependZero(utcNow.month), prependZero(utcNow.day), prependZero(utcNow.hour), prependZero(utcNow.min), prependZero(utcNow.sec), SecureRandom.hex(6)]
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

def writeJsonfile(hash, fileName)
	File.open(fileName,"w") do |f|
		f.write(hash.to_json)
	end
end

def verifyValue(headerMessage, expectedValue, actualValue)
	if expectedValue != actualValue
		message = headerMessage + " [ " + expectedValue + " ] but found [ " + actualValue + " ]"
		$testLogger1.logCase(message)
		@collectedErrors.push(message)
	end
end

def getUploadFileFullPath(fileName)
	return File.join($configObj["uploadFilePath"], fileName)
end

def getStudentFromData(suffix)
	index = (suffix != "")? suffix : "1"
	return $sharedData1.loadDataFromKey("students")[index]
end
