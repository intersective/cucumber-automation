

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = load_shared_data(regPassword, regPassword)
	passworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='password'] > input")
	passworde.send_keys(userPassword)
	confirmPassworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='confirmPassword'] > input")
	confirmPassworde.send_keys(userPassword)
end
