

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = load_shared_data(regPassword, regPassword)
	passworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='password']")
	focus_element(passworde)
	passworde.send_keys(userPassword)
	confirmPassworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='confirmPassword']")
	focus_element(confirmPassworde)
	confirmPassworde.send_keys(userPassword)
end
