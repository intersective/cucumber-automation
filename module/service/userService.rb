require 'singleton'


class UserService

    include Singleton

    def initialize
        puts("UserService init")
    end

    def write(hashObj, role)
        write_json_file(hashObj, Dir.pwd + "/data/" + role + "s.json")
    end
    
    def create(userId, userName, userAccount, userRegUrl)
        return User.new(userId, userName, userAccount, userRegUrl)
    end

    def generate_hash(userId, userName, userAccount, userRegUrl)
        return {"id" => userId, "name" => userName, "account" => userAccount, "regUrl" => userRegUrl}
    end

    def hash_to_obj(hashObj)
        return User.new(hashObj["id"], hashObj["name"], hashObj["account"], hashObj["regUrl"])
    end

    def create_users(hashObj)
        users = {}
        hashObj.each do |key, value|
            users[key] = User.new(value["id"], value["name"], value["account"], value["regUrl"])
        end
        return users
    end

end
