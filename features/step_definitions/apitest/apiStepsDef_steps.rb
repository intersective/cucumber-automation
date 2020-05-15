

Given("I call the app {string} api {string} by headers {string}, with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    row_len = data.length - 1
    col_len = data[0].length - 1
    cols = data[0].slice(0, col_len)
    pheaders = build_header(headersStr)

    for i in 1..row_len
        requestData = build_request_form(cols, data[i].slice(0, col_len))
        result = fire_request_with_data(apiMethod, apiUrl, pheaders, requestData)
        expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][-1])

        if expectedResult != result
            $testLogger1.log_case("[" + apiUrl + "] expected, [" + expectedResult.to_s + "] but found, [" + result.to_s + "]")
        else
            $testLogger1.log_case("[" + apiUrl + "] passed")
        end
    end
end

Given("I call the {string} api {string} by headers {string}, should have success and status with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    row_len = data.length - 1
    col_len = data[0].length - 2
    cols = data[0].slice(0, col_len)
    pheaders = build_header(headersStr)

    for i in 1..row_len
        requestData = build_request_form(cols, data[i].slice(0, col_len))
        result = fire_request_with_data(apiMethod, apiUrl, pheaders, requestData)

        verify_value(apiMethod + " " + apiUrl + " exptected success", data[i][-2], result["success"].to_s)
        verify_value(apiMethod + " " + apiUrl + " exptected status", data[i][-1], result["status"].to_s)
    end
end

Given("{string} I call the {string} api {string} by headers {string}, with:") do |dataFormat, apiMethod, apiUrl, headersStr, table|
    runId = $sharedData1.load_data_from_key(Application.KEY_RUN_ID)
    data = table.raw
    row_len = data.length - 1
    pheaders = build_header(headersStr)

    for i in 1..row_len
        if dataFormat == "Json"
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, JSON.parse(data[i][0]))
        elsif dataFormat == "Graphql"
            header_keys = data[i][1].split(";")
            for hk in header_keys
                temp = hk.split("=")
                value = $sharedData1.load_data_from_key(runId + "-" + i.to_s + "-" + temp[1])
                pheaders[temp[0]] = value
            end
            result = fire_request(apiMethod, apiUrl, pheaders, data[i][0])
        else
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, data[i][0])
        end
        expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][2])

        if expectedResult != result
            $testLogger1.log_case("[" + apiUrl + "] expected, [" + expectedResult.to_s + "] but found, [" + result.to_s + "]")
        else
            $testLogger1.log_case("[" + apiUrl + "] passed")
        end
    end
end

Given("{string} I call the {string} api {string} by headers {string}, and set keys:") do |dataFormat, apiMethod, apiUrl, headersStr, table|
    runId = $sharedData1.load_data_from_key(Application.KEY_RUN_ID)
    data = table.raw
    row_len = data.length - 1
    pheaders = build_header(headersStr)

    for i in 1..row_len
        keys = data[i][1].split(";")
        if dataFormat == "Json"
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, JSON.parse(data[i][0]))
        elsif dataFormat == "Graphql"
            result = fire_request(apiMethod, apiUrl, pheaders, data[i][0])
        else
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, data[i][0])
        end
        for k in keys
            path = k.split(".")
            value = result
            for p in path
                value = value[p]
            end
            $sharedData1.put_data(runId + "-" + i.to_s + "-" + k.to_s, value)
        end
    end
end