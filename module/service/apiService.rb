require 'singleton'


class APIService

    include Singleton

    def initialize
        @mHeaders = {}
    end

    def send_requeset(apiMethod, apiUrl, data)
        return fire_request(apiMethod, apiUrl, @mHeaders, data)
    end

    def set_headers(headers)
        headers.each do |key, value|
            @mHeaders[key] = value
        end
    end

    def clear_headers()
        @mHeaders = {}
    end

end