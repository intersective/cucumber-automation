

Then(/^"Appv1" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
	$appv1PageActions.login($driver, $wait, userName, userPassword)
end

Then(/^"Appv1" I login with username "([^"]*)" and a predefined password "([^"]*)"$/) do |userName, uPassword|
	userPassword = $sharedData1.loadDataFromKey(uPassword)
	step("\"Appv1\" I login with username \"#{userName}\" and password \"#{userPassword}\"")
end

Then(/^"Appv1" I login with "([^"]*)" and "([^"]*)"$/) do |uName, uPassword|
	userName = $sharedData1.loadDataFromKey(uName)
	userPassword = $sharedData1.loadDataFromKey(uPassword)
	step("\"Appv1\" I login with username \"#{userName}\" and password \"#{userPassword}\"")
end

Then(/^"Appv1" I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end

Then(/^"Appv1" I login with the student account and password "([^"]*)"$/) do |uPassword|
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
	userPassword = $sharedData1.loadDataFromKey(uPassword)
	step("\"Appv1\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"Appv1" I should see desired program "([^"]*)"$/) do |programName|
	programs = waitForElements($driver, $listWait, ".item-content")
	found = false
	programs.each do |opg|
		if programName == refineElementTextContent(opg)
			found = true
			break
		end
	end
	if !found
		fail("I can not see the expected program")
	end
end

Then(/^"Appv1" I choose a program "([^"]*)"$/) do |programName|
	programs = waitForElements($driver, $listWait, ".item-content")
	i = 0
	programs.each do |opg|
		i = i + 1
		if programName == refineElementTextContent(opg)
			waitForElementVisible($driver, $wait, ".jsmbp-switch-item:nth-of-type(" + i.to_s + ")").click()
			break
		end
	end
end

Then(/^"Appv1" I should see the app home screen$/) do
	waitForLoadFinished($driver, $wait)
	if "active" != waitForElement($driver, $wait, "ion-nav-view[name='home']").attribute("nav-view")
		fail("something wrong in the home screen")
	end
end

Then(/^"Appv1" I can see the current activity "([^"]*)"$/) do |activityName|
	activity = waitForElementXpath($driver, $wait, "//*[text()='Current Activity']/..//following-sibling::div")
	aActivityName = refineElementTextContent(activity.find_element(:css => ".activity-name"))
	verifyValue("expected activity title", activityName, aActivityName)
end
