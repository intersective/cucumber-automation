class User

    attr_reader :id
    attr_reader :name
    attr_reader :account
    attr_accessor :regUrl

    def initialize(id, name, account, regUrl="")
        @id = id
        @name = name
        @account = account
        @regUrl = regUrl
    end

end
