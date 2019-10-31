

Then("\"Practera Team\" I see the add team page") do
    while wait_for_element_visible($driver, $wait, "#TeamAdminAddForm") == nil
        sleep 1
    end
end

Then("\"Practera Team\" I add {string} as a team member") do |student|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Practera Team\" I input \"#{studentName}\" as a team member")
end

Then("\"Practera Team\" I input {string} as a team member") do |studentName|
    step("I input \"#{studentName}\" to \"Team memebers\" which is located at \"#TeamAdminAddForm > .form-group:nth-of-type(4) input[type='text']\"")
    step("I click on \"the team member\" which is located at \"//*[@class='select2-match'][text()='#{studentName}']\" with xpath")
    step("I wait 2 seconds")
end

Then(/^"Practera Team" I add student(|[1-9]+[0-9]*) as a team member$/) do |arg1|
    studentName = get_user_from_data(arg1, "student").name
    step("\"Practera Team\" I input \"#{studentName}\" as a team member")
end

Then("\"Practera Team\" I input team name") do
    teamObj = load_shared_data(Application.KEY_TEAM)
    teamName = teamObj["name"]
    step("I input \"#{teamName}\" to \"Team Name\" which is located at \"#TeamAdminAddForm #TeamName\"")
end

Then("\"Practera Team\" I create a team name") do
    id = generate_uni_id()
    teamName = "selenium.team.%s" % [id]
    step("I input \"#{teamName}\" to \"Team Name\" which is located at \"#TeamAdminAddForm #TeamName\"")
end

Then(/^"Practera Team" I create team data for ([1-9]+[0-9]*) students$/) do |numOfStudents|
    teamName = "selenium.team.%s" % [generate_uni_id()]
    hashObj = {"name" => teamName}
    numOfStudents = numOfStudents.to_i
    for i in 1..numOfStudents
        index = i.to_s
        key = "student%s" % [index]
        hashObj[key] = get_user_from_data(index, "student").name
    end
    write_json_file(hashObj, Dir.pwd + "/data/team.json")
end

Then("\"Practera Team\" I should see team student {string} submission") do |student|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Practera\" I should see a student \"#{studentName}\" submission")
end

Then("\"Practera Team\" I can assign a mentor {string} to a team student {string} submission") do |mentor, student|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    mentorName = load_shared_data(mentor, mentor)
    step("\"Practera\" I can assign a mentor \"#{mentorName}\" to a student \"#{studentName}\" submission with role \"mentor\"")
end

Then("\"Practera Team\" I can go to the review page with a team student {string} submission and the assessment {string}") do |student, assessment|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessment}\"")
end

Then("\"Practera Team\" I should see team student {string} ready to publish submission") do |student|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Practera\" I should see a student \"#{studentName}\" ready to publish submission")
end

Then("\"Practera Team\" I can publish a team student {string} submission review") do |student|
    teamObj = load_shared_data(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Practera\" I can publish a student \"#{studentName}\" submission review")
end