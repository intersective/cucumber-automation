

Then(/^I type the username with a wrong password$/) do
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
	$appv1PageActions.login($driver, $wait, studentAccount, studentAccount)
end

Then(/^I corrent the password$/) do
	studentAccount = $sharedData1.loadDataFromKey("studentAccount")
	$appv1PageActions.login($driver, $wait, studentAccount, $configObj["appv1AdminPassword"])
end

Then(/^I can see desired program "([^"]*)"$/) do |arg1|
	if  arg1 != refineElementTextContent(waitForElement($driver, $wait, ".item-content:nth-of-type(1)").attribute("innerText"))
		fail("I can not see the expected program")
	end
end

Then(/^I can see the app home screen$/) do
	waitForLoadFinished($driver, $wait)
	if "active" != waitForElement($driver, $wait, "ion-nav-view[name='home']").attribute("nav-view")
		fail("something wrong in the home screen")
	end
end
