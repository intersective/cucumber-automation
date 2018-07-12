

Then("\"Practera Team\" I see the add team page") do
    while waitForElementVisible($driver, $wait, "#TeamAdminAddForm") == nil
        sleep 1
    end
end

Then("\"Practera Team\" I add {string} as a team member") do |student|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    step("I input \"#{studentName}\" to \"Team memebers\" which is located at \"#TeamAdminAddForm > .form-group:nth-of-type(4) input[type='text']\"")
    step("I click on \"the team member\" which is located at \"//*[@class='select2-match'][text()='#{studentName}']\" with xpath")
    step("I wait 2 seconds")
end

Then("\"Practera Team\" I input team name") do
    teamObj = $sharedData1.loadDataFromKey("team")
    teamName = teamObj["name"]
    step("I input \"#{teamName}\" to \"Team Name\" which is located at \"#TeamAdminAddForm #TeamName\"")
end