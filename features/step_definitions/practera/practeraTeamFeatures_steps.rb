

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

Then("\"Practera Team\" I should see team student {string} submission") do |student|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    teamName = teamObj["name"]
    teamStudentName = "%s (%s)" % [teamName, studentName]
    step("\"Practera\" I should see a student \"#{teamStudentName}\" submission")
end

Then("\"Practera Team\" I can assign a mentor {string} to a team student {string} submission") do |mentor, student|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    teamName = teamObj["name"]
    teamStudentName = "%s (%s)" % [teamName, studentName]
    step("\"Practera\" I can assign a mentor \"selenium_mentor2\" to a student \"#{teamStudentName}\" submission")
end

Then("\"Practera Team\" I can go to the review page with a team student {string} submission and the assessment {string}") do |student, assessment|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    teamName = teamObj["name"]
    teamStudentName = "%s ( %s )" % [teamName, studentName]
    step("\"Practera\" I can go to the review page with a student \"#{teamStudentName}\" submission and the assessment \"#{assessment}\"")
end

Then("\"Practera Team\" I should see team student {string} ready to publish submission") do |student|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    teamName = teamObj["name"]
    teamStudentName = "%s (%s)" % [teamName, studentName]
    step("\"Practera\" I should see a student \"#{teamStudentName}\" ready to publish submission")
end

Then("\"Practera Team\" I can publish a team student {string} submission review") do |student|
    teamObj = $sharedData1.loadDataFromKey("team")
    studentName = teamObj[student]
    teamName = teamObj["name"]
    teamStudentName = "%s (%s)" % [teamName, studentName]
    step("\"Practera\" I can publish a student \"#{teamStudentName}\" submission review")
end