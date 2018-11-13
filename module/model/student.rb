class Student

    attr_reader :id
    attr_reader :name
    attr_reader :account

    def initialize(id, name, account)
        @id = id
        @name = name
        @account = account
    end

end
