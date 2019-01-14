

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = loadSharedData(regPassword, regPassword)
	waitForElement($driver, $wait, "ion-input[formcontrolname='password']").send_keys(userPassword)
	waitForElement($driver, $wait, "ion-input[formcontrolname='confirmPassword']").send_keys(userPassword)
end
