require 'singleton'


class APIService

    include Singleton

    def initialize
        @mHeaders = {}
    end

    def send_requeset(apiMethod, apiUrl, data)
        return fire_request(apiMethod, apiUrl, @mHeaders, data)
    end

    def append_headers(headers)
        headers.each do |key, value|
            @mHeaders[key] = value
        end
    end

    def set_headers(headers)
        @mHeaders= headers
    end

    def clear_headers()
        @mHeaders = {}
    end

    def get_header(key)
        return @mHeaders[key]
    end

end