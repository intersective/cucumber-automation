

Then(/^I move to "([^"]*)" which is located at "([^"]*)" and click$/) do |arg1, arg2|
	ele = waitForElement($driver, $wait, arg2)
	$driver.action.move_to(ele, 0, 0).click.perform
end

Then(/^I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = $sharedData1.loadDataFromKey(regPassword)
	waitForElement($driver, $wait, "input[name='uPassword']").send_keys(userPassword)
	waitForElement($driver, $wait, "input[name='uVerifyPassword']").send_keys(userPassword)
end
