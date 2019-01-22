

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = loadSharedData(regPassword, regPassword)
	passworde = waitForElement($driver, $wait, "ion-input[formcontrolname='password']")
	passworde.click()
	passworde.send_keys(userPassword)
	confirmPassworde = waitForElement($driver, $wait, "ion-input[formcontrolname='confirmPassword']")
	confirmPassworde.click()
	confirmPassworde.send_keys(userPassword)
end
