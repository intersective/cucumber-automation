

Then(/^"Appv2" I type my own password "([^"]*)" for registration$/) do |regPassword|
	userPassword = load_shared_data(regPassword, regPassword)
	passworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='password'] > input")
	scroll_if_not_visible($driver, passworde)
	passworde.send_keys(userPassword)
	confirmPassworde = wait_for_element($driver, $wait, "ion-input[formcontrolname='confirmPassword'] > input")
	scroll_if_not_visible($driver, confirmPassworde)
	confirmPassworde.send_keys(userPassword)
end

Then("\"Appv2\" I register the followings with:") do |table|
	data = table.raw
    rows = data.length - 1 

	for i in 0..rows
		step("I go to \"#{data[i][0]}\"")
		step("I wait 2 seconds")
		step("\"Appv2\" I type my own password \"studentPassword\" for registration")
		step("I wait 2 seconds")
		step("I click on \"check box\" which is located at \"ion-checkbox[name='isAgreed']\" with scroll")
		step("I wait 2 seconds")
		step("I click on \"Register button\" which is located at \"//ion-checkbox[@name='isAgreed']/../../following-sibling::ion-button\" with xpath scroll")
		step("I can see \"a pop up\" which is located at \"app-pop-up\"")
		step("I click on \"an ok button\" which is located at \"app-pop-up ion-button\"")
		step("I wait 2 seconds")
		step("I click on \"logout button\" which is located at \"//ion-card[normalize-space()='Logout']/clickable-item/ion-item\" with xpath scroll")
		step("I wait 2 seconds")
	end
end