

Then(/^"Appv1" I type the username with a wrong password$/) do
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
	$appv1PageActions.login($driver, $wait, studentAccount, studentAccount)
end

Then(/^"Appv1" I corrent the password$/) do
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
	$appv1PageActions.login($driver, $wait, studentAccount, $configObj["appv1AdminPassword"])
end

Then(/^"Appv1" I can see desired program "([^"]*)"$/) do |programName|
	programs = waitForElements($driver, $wait, ".item-content")
	found = false
	programs.each do |opg|
		if programName == refineElementTextContent(opg.attribute("innerText"))
			found = true
			break
		end
	end
	if !found
		fail("I can not see the expected program")
	end
end

Then(/^"Appv1" I choose a program "([^"]*)"$/) do |programName|
	programs = waitForElements($driver, $wait, ".item-content")
	i = 0
	programs.each do |opg|
		i = i + 1
		if programName == refineElementTextContent(opg.attribute("innerText"))
			waitForElement($driver, $wait, ".jsmbp-switch-item:nth-of-type(" + i.to_s + ")").click()
			break
		end
	end
end

Then(/^"Appv1" I can see the app home screen$/) do
	waitForLoadFinished($driver, $wait)
	if "active" != waitForElement($driver, $wait, "ion-nav-view[name='home']").attribute("nav-view")
		fail("something wrong in the home screen")
	end
end
