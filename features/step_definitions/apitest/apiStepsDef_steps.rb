

Given("I call the app {string} api {string} by headers {string}, with:") do |apiMethod, apiUrl, headersStr, table|
    data = table.raw
    row_len = data.length - 1
    col_len = data[0].length - 1
    cols = data[0].slice(0, col_len)
    pheaders = build_header(headersStr)

    for i in 1..row_len
        requestData = build_request_form(cols, data[i].slice(0, col_len))
        result = JSON.parse(fire_request(apiMethod, apiUrl, pheaders, requestData).body)
        expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][-1])

        verificationResult = hash_deep_equal(expectedResult, result)
        diff = verificationResult["diff"]
        unset = verificationResult["unset"]
        if diff.length < 1 && unset.length < 1
            $testLogger1.log_case(["[", apiUrl, "] passed"].join())
        else
            for one in diff do
                $testLogger1.log_case(["[", apiUrl, "] ", one].join())
            end
            for one in unset do
                $testLogger1.log_case(["[", apiUrl, "] ", one].join())
            end
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
        result = JSON.parse(fire_request(apiMethod, apiUrl, pheaders, requestData).body)

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
    parametersFormatIndex = 3
    requestParametersIndex = 4
    expectedResultFileIndex = 5

    for i in 1..rowLen
        sleep 2
        pheaders = build_header(data[i][apiRequestHeaderIndex])
        pheaders["apikey"] = $apiService1.get_header("apikey")
        $apiService1.set_headers(pheaders)

        apiMethod = data[i][apiMenthodIndex]
        apiUrl = data[i][apiendpointIndex]
        if data[i][parametersFormatIndex] == "json"
            result = JSON.parse($apiService1.send_requeset(apiMethod, apiUrl,JSON.parse(data[i][requestParametersIndex])).body)
        elsif data[i][parametersFormatIndex] == "object"
            result = JSON.parse($apiService1.send_requeset(apiMethod, apiUrl, data[i][requestParametersIndex]).body)
        else
            result = $apiService1.send_requeset(apiMethod, apiUrl, data[i][requestParametersIndex])
        end

        if data[i][expectedResultFileIndex].length > 0
            expectedResult = read_json_file(Dir.pwd + "/testExpectedResult/" + data[i][expectedResultFileIndex])
            verificationResult = hash_deep_equal(expectedResult, result)
            diff = verificationResult["diff"]
            unset = verificationResult["unset"]
            if diff.length < 1 && unset.length < 1
                message = ["[", apiUrl, "] passed"].join()
                $testLogger1.log_case(message)
            else
                for one in diff do
                    message = ["[", apiUrl, "] diff row_number:", i.to_s, " ", one].join()
                    @collectedErrors.push(message)
                end
                for one in unset do
                    message = ["[", apiUrl, "] unset row_number:", i.to_s, " ", one].join()
                    @collectedErrors.push(message)
                end
                $testLogger1.log_case(["[", apiUrl, "] row_number:", i.to_s, " result: ", JSON.generate(result)].join())
            end
        end
    end

end

Given("Practer app v2 api I login with username {string} and password {string} by {string}") do |username, password, apiUrl|
    $apiService1.set_headers({
        "appkey"=>"b11e7c189b",
        "Content-Type"=>"application/json"
    })
    data = {
        "User"=>{
            "email"=>username,
            "password"=>password
        }
    }.to_json
    result = JSON.parse($apiService1.send_requeset("post", apiUrl, data).body)
    $apiService1.append_headers({
        "apikey"=>result["data"]["apikey"]
    })
end