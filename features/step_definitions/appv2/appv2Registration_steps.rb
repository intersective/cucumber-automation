

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = loadSharedData(regPassword, regPassword)
	passworde = waitForElement($driver, $wait, "ion-input[formcontrolname='password']")
	focusElement(passworde)
	passworde.send_keys(userPassword)
	confirmPassworde = waitForElement($driver, $wait, "ion-input[formcontrolname='confirmPassword']")
	focusElement(confirmPassworde)
	confirmPassworde.send_keys(userPassword)
end
