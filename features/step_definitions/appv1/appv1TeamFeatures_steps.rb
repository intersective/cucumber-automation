

Then("\"Appv1 Team\" I login with team member {string} and password {string} and domain {string}") do |student, upassword, domain|
    teamObj = loadSharedData(Application.KEY_TEAM)
    studentName = teamObj[student] + "@" + domain
    password = loadSharedData(upassword, upassword)
    step("\"Appv1\" I login with username \"#{studentName}\" and password \"#{password}\"")
end

Then("\"Appv1 Team\" I should be able to select {string} from selector options") do |student|
    teamObj = loadSharedData(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("\"Appv1\" I should be able to select \"#{studentName}\" from selector options which is located at \"//*[@ng-repeat='question in group.questions'][1]//label[1]\"")
end

Then("\"Appv1 Team\" I can see team member {string} name") do |student|
    teamObj = loadSharedData(Application.KEY_TEAM)
    studentName = teamObj[student]
    step("I should see \"member name\" which is located at \"//*[@class='chat-name'][normalize-space()='#{studentName}']\" with xpath")
end