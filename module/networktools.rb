def fireRequest(apiMethod, apiUrl, pheaders, data, cols, i)
    pquery = {}
    response = nil
    for j in 0..cols
        pquery[data[0][j].to_s] = data[i][j]
    end
    
    result = fireRequestWithData(apiMethod, apiUrl, pheaders, pquery)
    return result
end

def fireRequestWithData(apiMethod, apiUrl, pheaders, pdata)
    if (apiMethod == "post")
        response = HTTParty.post(apiUrl, :body => pdata, :headers => pheaders)
    else
        response = HTTParty.get(apiUrl, :query => pdata, :headers => pheaders)
    end
    result = JSON.parse(response.body)
    return result
end

def buildHeader(headersStr)
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