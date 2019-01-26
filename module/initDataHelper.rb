def initTestData(filePath, key)
    if File.exist?(filePath)
        testObj = readJsonfile(filePath)
        $sharedData1.putData(key, testObj)
        return true
    end
    return false
end

def initTestUserData(filePath, key)
    if File.exist?(filePath)
        users = {}
        temp = readJsonfile(filePath)
        temp.each do |key, value|
            users[key] = $userService1.hashToObj(value)
        end
        $sharedData1.putData(key, users)
        return true
    end
    return false
end

def initTestDataWithKey(filePath)
    if File.exist?(filePath)
        testObj = readJsonfile(filePath)
        testObj.each do |key, value|
            $sharedData1.putData(key, value)
        end
        return true
    end
    return false
end