require 'json'
require 'securerandom'


def generate_uni_id()
	utcNow = Time.now.utc
	return "%s%s%s%s%s%s%s" % [utcNow.year.to_s, prepend_zero(utcNow.month), prepend_zero(utcNow.day), prepend_zero(utcNow.hour), prepend_zero(utcNow.min), prepend_zero(utcNow.sec), SecureRandom.hex(6)]
end

def prepend_zero(num)
	if num < 10
		return "0%s" % [num.to_s]
	else
		return num.to_s
	end
end

def read_json_file(filePath)
	fileContent = File.read(filePath)
	dataHash = JSON.parse(fileContent)
	return dataHash
end

def write_json_file(hash, fileName)
	File.open(fileName,"w") do |f|
		f.write(hash.to_json)
	end
end

def verify_value(headerMessage, expectedValue, actualValue)
	if expectedValue != actualValue
		message = headerMessage + " [ " + expectedValue + " ] but found [ " + actualValue + " ]"
		$testLogger1.log_case(message)
		@collectedErrors.push(message)
	end
end

def get_upload_file_full_path(fileName)
	return File.join($configObj[Application.KEY_UPLOADFILEPATH], fileName)
end

def get_user_from_data(suffix, role)
	index = (suffix != "")? suffix : "1"
	if role == Application.KEY_ROLE_MENTOR
		return $sharedData1.load_data_from_key(Application.KEY_MENTORS)[index]
	else
		return $sharedData1.load_data_from_key(Application.KEY_STUDENTS)[index]
	end
end

def load_shared_data(key, default="")
	if $variableLoaded
		value = $sharedData1.load_data_from_key($currentFeatureFile)[key]
		if value == nil
			value =  $sharedData1.load_data_from_key(key)
		end
	else
		value = $sharedData1.load_data_from_key(key)
	end
	return (value == nil)? default : value
end

# if it is pattern for defining a paramter then load the data, else we return default value.
def extract_parameter(parameter, defaultValue="")
	mresult = parameter.match(/^#[(]{1}[a-zA-Z0-9_]+\)$/)
	if mresult == nil
		return defaultValue
	else
		return load_shared_data(parameter[2..-2], defaultValue)
	end
end


def load_config(configFile)
	temp = read_json_file(configFile)
	configObj = {}
	temp.each do |key, value|
		value = ENV[key]
		if value == nil
			configObj[key] = temp[key]
		else
			configObj[key] = value
		end
	end
	return configObj
end

def hash_deep_equal(hash1, hash2, result, rootPath)
	if (hash1 == nil && hash2 != nil) || (hash1 != nil && hash2 == nil)
		result.push(rootPath)
	else
		if hash2 != nil
			if hash1.class == Array
				hash1Len = hash1.length - 1
				hash2Len = hash2.length - 1
				if (hash1Len < 0 && hash2Len > 0) || (hash2Len < 0 && hash1Len > 0)
					result.push(rootPath)
				else
					if hash1Len != hash2Len
						result.push(rootPath)
					end
					max = hash1Len > hash2Len ? hash2Len : hash1Len
					for i in 0..max do
						hash_deep_equal(hash1[i], hash2[i], result, [rootPath, i.to_s].join("/"))
					end
				end
			elsif hash1.class == Hash
				if hash1.length < 0 || hash2.length < 0
					result.push(rootPath)
				else
					if (hash1.length != hash2.length)
						result.push(rootPath)
					end
					hash1.each do |key, value|
						if value.class == Array
							len = value.length - 1
							if hash2[key] != nil
								len2 = hash2[key].length - 1
								if (len < 0 && len2 > 0) || (len2 < 0 && len > 0)
									result.push([rootPath, key.to_s].join("/"))
								else
									if len != len2
										result.push([rootPath, key.to_s].join("/"))
									end
									max2 = len > len2 ? len2 : len
									for i in 0..max2 do
										hash_deep_equal(value[i], hash2[key][i], result, [rootPath, key.to_s, i.to_s].join("/"))
									end
								end
							else
								result.push([rootPath, key.to_s].join("/"))
							end
						else
							hash_deep_equal(value, hash2[key], result, [rootPath, key.to_s].join("/"))
						end
					end
				end
			else
				if hash1 != hash2
					result.push(rootPath)
				end
			end
		end
	end
	return result
end

def get_value_from_hash(pathStr, obj)
	path = pathStr.split("/")
	if pathStr.start_with?("/")
		path.shift
	end
	value = obj
	for p in path
		if value.class == Array
			value = value[p.to_i]
		else
			value = value[p]
		end
	end
	return value
end