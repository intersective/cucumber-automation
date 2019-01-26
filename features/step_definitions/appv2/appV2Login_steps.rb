

Then(/^"Appv2" I login with the (mentor|student)(|[1-9]+[0-9]*) account and password "([^"]*)"$/) do |arg1, arg2, uPassword|
	studentAccount = getUserFromData(arg2, arg1).account
	userPassword = loadSharedData(uPassword)
	step("\"Appv2\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"Appv2" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
    u = extractParameter(username, username)
    p = extractParameter(userPassword, userPassword)
    emaile = waitForElementVisible($driver, $wait, "ion-input[name='email']")
    focusElement(emaile)
    emaile.send_keys(u)
    passworde = waitForElementVisible($driver, $wait, "ion-input[name='password']")
    focusElement(passworde)
    passworde.send_keys(p)
    waitForElementVisible($driver, $wait, "form ion-button[type=submit]").click()
end

Then(/^"Appv2" I login with "([^"]*)" and "([^"]*)"$/) do |uName, uPassword|
	userName = loadSharedData(uName)
	userPassword = loadSharedData(uPassword)
	step("\"Appv2\" I login with username \"#{userName}\" and password \"#{userPassword}\"")
end

Then(/^"Appv2" I log out$/) do
    waitForElement($driver, $wait, "ion-tab-button[tab='settings']").click()
    waitForElementVisibleXpath($driver, $wait, "//app-tabs//ion-card[normalize-space()='Logout']").click()
end
