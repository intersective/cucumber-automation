

private def fireRequest(apiMethod, apiUrl, pheaders, data, cols, i)
    pquery = {}
    response = nil
    for j in 0..cols
        pquery[data[0][j].to_s] = data[i][j]
    end
    
    result = fireRequestWithData(apiMethod, apiUrl, pheaders, pquery)
    return result
end

private def fireRequestWithData(apiMethod, apiUrl, pheaders, pdata)
    if (apiMethod == "post")
        response = HTTParty.post(apiUrl, :body => pdata, :headers => pheaders)
    else
        response = HTTParty.get(apiUrl, :query => pdata, :headers => pheaders)
    end
    result = JSON.parse(response.body)
    return result
end

private def buildHeader(headersStr)
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

Given("I call the app {string} api {string} by headers {string}, with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2

    pheaders = buildHeader(headersStr)

    for i in 1..rows
        result = fireRequest(apiMethod, apiUrl, pheaders, data, cols, i)
        expectedResult = readJsonfile(Dir.pwd + "/testExpectedResult/" + data[i][-1])

        if expectedResult != result
            $testLogger1.logCase("[" + apiUrl + "] expected, [" + expectedResult.to_s + "] but found, [" + result.to_s + "]")
        else
            $testLogger1.logCase("[" + apiUrl + "] passed")
        end
    end
end

Given("I call the {string} api {string} by headers {string}, should have success and status with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 3

    pheaders = buildHeader(headersStr)

    for i in 1..rows
        result = fireRequest(apiMethod, apiUrl, pheaders, data, cols, i)

        compareWithLog(apiMethod + " " + apiUrl + " exptected success", data[i][-2], result["success"].to_s)
        compareWithLog(apiMethod + " " + apiUrl + " exptected status", data[i][-1], result["status"].to_s)
    end
end

Given("{string} I call the {string} api {string} by headers {string}, with:") do |dataFormat, apiMethod, apiUrl, headersStr, table|
    data = table.raw
    rows = data.length - 1

    pheaders = buildHeader(headersStr)

    for i in 1..rows
        if dataFormat == "Json"
            result = fireRequestWithData(apiMethod, apiUrl, pheaders, JSON.parse(data[i][0]))
        else
            result = fireRequestWithData(apiMethod, apiUrl, pheaders, data[i][0])
        end
        expectedResult = readJsonfile(Dir.pwd + "/testExpectedResult/" + data[i][1])

        if expectedResult != result
            $testLogger1.logCase("[" + apiUrl + "] expected, [" + expectedResult.to_s + "] but found, [" + result.to_s + "]")
        else
            $testLogger1.logCase("[" + apiUrl + "] passed")
        end
    end
end