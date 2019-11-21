

Then(/^"Appv2" I login with the (mentor|student)(|[1-9]+[0-9]*) account and password "([^"]*)"$/) do |arg1, arg2, uPassword|
	studentAccount = get_user_from_data(arg2, arg1).account
	userPassword = extract_parameter(uPassword, uPassword)
	step("\"Appv2\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"Appv2" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
    utext = extract_parameter(username, username)
    ptext = extract_parameter(userPassword, userPassword)
    emaile = wait_for_element_visible($driver, $wait, "ion-input[name='email'] > input")
    emaile.send_keys(utext)
    passworde = wait_for_element_visible($driver, $wait, "ion-input[name='password'] > input")
    passworde.send_keys(ptext)
    wait_for_element_visible($driver, $wait, "form ion-button[type=submit]").click()
end

Then(/^"Appv2" I log out$/) do
    wait_for_element($driver, $wait, "ion-tab-button[tab='settings']").click()
    wait_for_element_visible_xpath($driver, $wait, "//app-tabs//ion-card[normalize-space()='Logout']").click()
end

Then(/^"Appv2" I click on not right now$/) do
    contentPage = wait_for_element($driver, $wait, "go-mobile ion-content")
    b = wait_for_element_xpath($driver, $wait, "//go-mobile//*[text()='not right now...']")
    scroll_by_keyboard_if_not_visible($driver, contentPage, b)
    b.click()
end
