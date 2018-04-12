

Given(/^I call the app "([^"]*)" api "([^"]*)" with app key "([^"]*)" and api key "([^"]*)", with:$/) do |apiMethod, apiUrl, appKey, apiKey, table|
    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2
    pheaders = {
        "appKey" => appKey
    }
    if apiKey != ""
        pheaders["apikey"] = apiKey
    end

    for i in 1..rows
        pquery = {}
        response = nil
        for j in 0..cols
            pquery[data[0][j].to_s] = data[i][j]
        end
        
        if (apiMethod == "post")
            response = HTTParty.post(apiUrl, :headers => pheaders, :body => pquery)
        else
            response = HTTParty.get(apiUrl, :query => pquery, :headers => pheaders)
        end
        result = JSON.parse(response.body)
        expectedResult = readJsonfile(Dir.pwd + "/testExpectedResult/" + data[i][-1])

        if expectedResult != result
            $testLogger1.logCase("[" + apiUrl + "] expected, [" + expectedResult.to_s + "]\nbut found, [" + result.to_s + "]")
        else
            $testLogger1.logCase("[" + apiUrl + "] passed")
        end

    end

end