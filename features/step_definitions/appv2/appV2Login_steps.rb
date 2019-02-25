

Then(/^"Appv2" I login with the (mentor|student)(|[1-9]+[0-9]*) account and password "([^"]*)"$/) do |arg1, arg2, uPassword|
	studentAccount = get_user_from_data(arg2, arg1).account
	userPassword = load_shared_data(uPassword)
	step("\"Appv2\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"Appv2" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
    u = extract_parameter(username, username)
    p = extract_parameter(userPassword, userPassword)
    emaile = wait_for_element_visible($driver, $wait, "ion-input[name='email']")
    focus_element(emaile)
    emaile.send_keys(u)
    passworde = wait_for_element_visible($driver, $wait, "ion-input[name='password']")
    focus_element(passworde)
    passworde.send_keys(p)
    wait_for_element_visible($driver, $wait, "form ion-button[type=submit]").click()
end

Then(/^"Appv2" I log out$/) do
    wait_for_element($driver, $wait, "ion-tab-button[tab='settings']").click()
    wait_for_element_visible_xpath($driver, $wait, "//app-tabs//ion-card[normalize-space()='Logout']").click()
end
