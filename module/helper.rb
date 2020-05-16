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
	hash1.each do |key, value|
		if value.class == Hash
			hash_deep_equal(value, hash2[key], result, [rootPath, key.to_s].join("/"))
		elsif value.class == Array
			len = value.length - 1
			for i in 0..len do
				if value[i].class == Hash
					hash_deep_equal(value[i], hash2[key][i], result, [rootPath, key.to_s, i.to_s].join("/"))
				else
					if value[i] != hash2[key][i]
						result.push([rootPath, key.to_s, i.to_s].join("/"))
					end
				end
			end
		else
			if value != hash2[key]
				result.push([rootPath, key.to_s].join("/"))
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