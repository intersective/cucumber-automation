class Event

    attr_reader :id
    attr_reader :name
    attr_reader :description
    attr_reader :location
    attr_reader :activity
    attr_reader :assessment
    attr_reader :seat

    def initialize(id, name, description, location, activity, assessment, seat)
        @id = id
        @name = name
        @description = description
        @location = location
        @activity = activity
        @assessment = assessment
        @seat = seat
    end

end
