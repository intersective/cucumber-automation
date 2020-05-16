

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

        verificationResult = hash_deep_equal(expectedResult, result, "", "")
        if verificationResult.length > 0
            $testLogger1.log_case(["[", apiUrl, "] ", verificationResult].join())
        else
            $testLogger1.log_case(["[", apiUrl, "] passed"].join())
        end
    end
end

Given("I call the {string} api {string} by headers {string}, should have keys equal with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    row_len = data.length - 1
    col_len = data[0].length - 3
    keys_index = data[0].length - 1
    value_index = data[0].length - 2
    cols = data[0].slice(0, col_len)
    pheaders = build_header(headersStr)

    for i in 1..row_len
        requestData = build_request_form(cols, data[i].slice(0, col_len))
        result = fire_request_with_data(apiMethod, apiUrl, pheaders, requestData)

        keys = data[i][keys_index].split("&")
        values = data[i][value_index].split("&")
        j = 0
        for k in keys
            verify_value(apiMethod + " " + apiUrl + " exptected success", values[j], get_value_from_hash(k, result))
            j = j +1
        end
    end
end

Given("I call the apis with:") do |table|
    runId = $sharedData1.load_data_from_key(Application.KEY_RUN_ID)
    data = table.raw
    rowLen = data.length - 1
    apiMenthodIndex = 0
    apiendpointIndex = 1
    apiRequestHeaderIndex = 2
    dataformatIndex = 3
    requestParametersIndex = 4
    additionalHeaderIndex = 5
    exportValueIndex = 6
    expectedResultFileIndex = 7

    for i in 1..rowLen
        pheaders = build_header(data[i][apiRequestHeaderIndex])
        if data[i][additionalHeaderIndex].length > 0
            header_keys = data[i][additionalHeaderIndex].split("&")
            for hk in header_keys
                temp = hk.split("=")
                value = $sharedData1.load_data_from_key(runId + "-" + temp[1])
                pheaders[temp[0]] = value
            end
        end

        apiMethod = data[i][apiMenthodIndex]
        apiUrl = data[i][apiendpointIndex]
        if data[i][dataformatIndex] == "Json"
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, JSON.parse(data[i][requestParametersIndex]))
        elsif data[i][dataformatIndex] == "Graphql"
            result = fire_request(apiMethod, apiUrl, pheaders, data[i][requestParametersIndex])
        else
            result = fire_request_with_data(apiMethod, apiUrl, pheaders, data[i][requestParametersIndex])
        end

        if data[i][expectedResultFileIndex].length > 0
            expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][expectedResultFileIndex])
            verificationResult = hash_deep_equal(expectedResult, result, [], "")
            if verificationResult.length > 0
                for one in verificationResult do
                    message = ["[", apiUrl, "] row_number:", i.to_s, " ", one, ":", get_value_from_hash(one, expectedResult)].join()
                    @collectedErrors.push(message)
                end
            else
                message = ["[", apiUrl, "] passed"].join()
                $testLogger1.log_case(message)
            end
        end
        if data[i][exportValueIndex].length > 0
            keys = data[i][exportValueIndex].split("&")
            for k in keys
                value = get_value_from_hash(k, result)
                $sharedData1.put_data(runId + "-" + k.to_s, value)
            end
        end
    end

end