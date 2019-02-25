

Given("I call the app {string} api {string} by headers {string}, with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2

    pheaders = build_header(headersStr)

    for i in 1..rows
        result = fire_request(apiMethod, apiUrl, pheaders, data, cols, i)
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
    rows = data.length - 1
    cols = data[0].length - 3

    pheaders = build_header(headersStr)

    for i in 1..rows
        result = fire_request(apiMethod, apiUrl, pheaders, data, cols, i)

        verify_value(apiMethod + " " + apiUrl + " exptected success", data[i][-2], result["success"].to_s)
        verify_value(apiMethod + " " + apiUrl + " exptected status", data[i][-1], result["status"].to_s)
    end
end

Given("{string} I call the {string} api {string} by headers {string}, with:") do |dataFormat, apiMethod, apiUrl, headersStr, table|
    data = table.raw
    rows = data.length - 1

    pheaders = build_header(headersStr)

    for i in 1..rows
        if dataFormat == "Json"
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, JSON.parse(data[i][0]))
        else
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, data[i][0])
        end
        expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][1])

        if expectedResult != result
            $testLogger1.log_case("[" + apiUrl + "] expected, [" + expectedResult.to_s + "] but found, [" + result.to_s + "]")
        else
            $testLogger1.log_case("[" + apiUrl + "] passed")
        end
    end
end