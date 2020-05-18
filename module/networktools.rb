def fire_request(apiMethod, apiUrl, pheaders, pdata)
    if (apiMethod == "post")
        response = HTTParty.post(apiUrl, :body => pdata, :headers => pheaders)
    else
        response = HTTParty.get(apiUrl, :query => pdata, :headers => pheaders)
    end
    return response
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

def build_request_form(cols, rows)
    pquery = {}
    len = cols.length - 1
    for i in 0..len
        pquery[cols[i]] = rows[i]
    end
    return pquery
end