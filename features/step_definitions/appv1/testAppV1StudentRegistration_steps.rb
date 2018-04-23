

Given(/^I use the registration link$/) do
	regLink = $sharedData1.loadDataFromKey("regUrl")
	$driver.get(regLink)
end

Then(/^I scroll to "([^"]*)" which is located at "([^"]*)" and click$/) do |arg1, arg2|
	ele = waitForElement($driver, $wait, arg2)
	$driver.action.move_to(ele, 0, 0).click.perform
end

Then(/^I type my own password "([^"]*)" for registration$/) do |userPassword|
	waitForElement($driver, $wait, "input[name='uPassword']").send_keys(userPassword)
	waitForElement($driver, $wait, "input[name='uVerifyPassword']").send_keys(userPassword)
end
