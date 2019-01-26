require 'singleton'


class UserService

    include Singleton

    def initialize
        puts("UserService init")
    end

    def write(hashObj, role)
        writeJsonfile(hashObj, Dir.pwd + "/data/" + role + "s.json")
    end
    
    def create(userId, userName, userAccount)
        return User.new(userId, userName, userAccount)
    end

    def generateHash(userId, userName, userAccount)
        return {"id" => userId, "name" => userName, "account" => userAccount}
    end

    def hashToObj(hashObj)
        return User.new(hashObj["id"], hashObj["name"], hashObj["account"])
    end

end
