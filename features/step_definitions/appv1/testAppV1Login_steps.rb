

Then(/^"Appv1" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
	$appv1PageActions.login($driver, $wait, userName, userPassword)
end

Then(/^"Appv1" I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end

Then(/^"Appv1" I login with the student account and password "([^"]*)"$/) do |userPassword|
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
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

Then(/^"Appv1" I can see the current milestone "([^"]*)" with status "([^"]*)"$/) do |milestoneName, milestoneStatus|
	milestone = waitForElementXpath($driver, $wait, "//*[text()='Things to do']/following-sibling::div")
	aMileStoneName = refineElementTextContent(milestone.find_element(:css => ".title"))
	aMilestoneStatus = refineElementTextContent(milestone.find_element(:css => "h3"))
	compareWithLog("expected milestone title", milestoneName, aMileStoneName)
	compareWithLog("expected milestone title", milestoneStatus, aMilestoneStatus)
end
