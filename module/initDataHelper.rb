def init_test_data(filePath, key)
    if File.exist?(filePath)
        testObj = read_json_file(filePath)
        $sharedData1.put_data(key, testObj)
        return true
    end
    return false
end

def init_test_user_data(filePath, key)
    if File.exist?(filePath)
        hash = read_json_file(filePath)
        users = $userService1.create_users(hash)
        $sharedData1.put_data(key, users)
        return true
    end
    return false
end

def init_test_data_with_key(filePath)
    if File.exist?(filePath)
        testObj = read_json_file(filePath)
        testObj.each do |key, value|
            $sharedData1.put_data(key, value)
        end
        return true
    end
    return false
end