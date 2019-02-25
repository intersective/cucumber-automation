

Then(/^I input ([1-9]+[0-9]*) (student|mentor) enrolment information which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
	counter = arg1.to_i
	temp = []
	hash = {}
	for i in 1..counter
		userId = generate_uni_id()
		userName = "selenium.%s.%s" % [arg2, userId]
		userAccount = "%s@practera.com" % [userName]
		temp.push("%s,%s,%s" % [userAccount, userId, userName])
		hash[i.to_s] = $userService1.generate_hash(userId, userName, userAccount)
	end
	users = $userService1.create_users(hash)
	csvtext = temp.join("\n")
	$userService1.write(hash, arg2)
	if arg2 == Application.KEY_ROLE_MENTOR
		$sharedData1.put_data(Application.KEY_MENTORS, users)
	else
		$sharedData1.put_data(Application.KEY_STUDENTS, users)
	end
	wait_for_element($driver, $wait, arg3).send_keys(csvtext)
end
