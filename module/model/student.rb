class Student

    attr_reader :id
    attr_reader :name
    attr_reader :account
    attr_accessor :regUrl

    def initialize(id, name, account)
        @id = id
        @name = name
        @account = account
        @regUrl = ""
    end

end
