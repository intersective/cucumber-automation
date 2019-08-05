require 'singleton'


class EventService

    include Singleton

    def initialize
        puts("EventService init")
    end

    def write(hashObj)
        write_json_file(hashObj, Dir.pwd + "/data/events.json")
    end
    
    def create(id, name, description, location, activity, assessment, seat)
        return Event.new(id, name, description, location, activity, assessment, seat)
    end

    def generate_hash(id, name, description, location, activity, assessment, seat)
        return {"id" => id, "name" => name, "description" => description, "location" => location, "activity" => activity, "assessment" => assessment, "seat" => seat}
    end

    def hash_to_obj(hashObj)
        return Event.new(hashObj["id"], hashObj["name"], hashObj["description"], hashObj["location"], hashObj["activity"], hashObj["assessment"], hashObj["seat"])
    end

    def create_events(hashObj)
        events = {}
        hashObj.each do |key, value|
            events[key] = Event.new(value["id"], value["name"], value["description"], value["location"], value["activity"], value["assessment"], value["seat"])
        end
        return events
    end

end
