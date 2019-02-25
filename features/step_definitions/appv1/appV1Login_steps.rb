

Then(/^"Appv1" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
	u = extract_parameter(username, username)
	p = extract_parameter(userPassword, userPassword)
	$appv1PageActions.login($driver, $wait, u, p)
end

Then(/^"Appv1" I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end

Then(/^"Appv1" I login with the (mentor|student)(|[1-9]+[0-9]*) account and password "([^"]*)"$/) do |arg1, arg2, uPassword|
	studentAccount = get_user_from_data(arg2, arg1).account
	userPassword = load_shared_data(uPassword)
	step("\"Appv1\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"Appv1" I should see desired program "([^"]*)"$/) do |programName|
	programs = wait_for_elements($driver, $listWait, ".item-content")
	found = false
	programs.each do |opg|
		if programName == refine_element_text_content(opg)
			found = true
			break
		end
	end
	if !found
		fail("I can not see the expected program")
	end
end

Then(/^"Appv1" I choose a program "([^"]*)"$/) do |programName|
	programs = wait_for_elements($driver, $listWait, ".item-content")
	i = 0
	programs.each do |opg|
		i = i + 1
		if programName == refine_element_text_content(opg)
			wait_for_element_visible($driver, $wait, ".jsmbp-switch-item:nth-of-type(" + i.to_s + ")").click()
			break
		end
	end
end

Then(/^"Appv1" I should see the app home screen$/) do
	wait_for_load_finished($driver, $wait)
	if "active" != wait_for_element($driver, $wait, "ion-nav-view[name='home']").attribute("nav-view")
		fail("something wrong in the home screen")
	end
end

Then(/^"Appv1" I can see the current activity "([^"]*)"$/) do |activityName|
	activity = wait_for_element_xpath($driver, $wait, "//*[text()='Current Activity']/..//following-sibling::div")
	aActivityName = refine_element_text_content(activity.find_element(:css => ".activity-name"))
	verify_value("expected activity title", activityName, aActivityName)
end
