

Then(/^I input ([1-9]+[0-9]*) (student|mentor) enrolment information which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
	counter = arg1.to_i
	users = {}
	temp = []
	hash = {}
	for i in 1..counter
		userId = generateUniId()
		userName = "selenium.%s.%s" % [arg2, userId]
		userAccount = "%s@practera.com" % [userName]
		temp.push("%s,%s,%s" % [userAccount, userId, userName])
		hash[i.to_s] = {"userId" => userId, "userName" => userName, "userAccount" => userAccount}
		users[i.to_s] = User.new(userId, userName, userAccount)
	end
	csvtext = temp.join("\n")
	writeJsonfile(hash, Dir.pwd + "/data/" + arg2 + "s.json")
	if arg2 == Application.KEY_ROLE_MENTOR
		$sharedData1.putData(Application.KEY_MENTORS, users)
	else
		$sharedData1.putData(Application.KEY_STUDENTS, users)
	end
	waitForElement($driver, $wait, arg3).send_keys(csvtext)
end
