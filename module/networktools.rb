def fire_request(apiMethod, apiUrl, pheaders, data, cols, i)
    pquery = {}
    response = nil
    for j in 0..cols
        pquery[data[0][j].to_s] = data[i][j]
    end
    
    result = fire_request_with_data(apiMethod, apiUrl, pheaders, pquery)
    return result
end

def fire_request_with_data(apiMethod, apiUrl, pheaders, pdata)
    if (apiMethod == "post")
        response = HTTParty.post(apiUrl, :body => pdata, :headers => pheaders)
    else
        response = HTTParty.get(apiUrl, :query => pdata, :headers => pheaders)
    end
    result = JSON.parse(response.body)
    return result
end

def build_header(headersStr)
    t = headersStr.split(";")
    pheaders = {}
    t.each do |o|
        t1 = o.split("=")
        if t1[1] != "nil"
            pheaders[t1[0]] = t1[1]
        end
    end
    return pheaders
end