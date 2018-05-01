Then(/^"Mailtrap" I search email with receiver "([^"]*)" and filter "([^"]*)"$/) do |receiver, filter|
    noResult = true
    while noResult
        sleep 3
        waitForElement($driver, $wait, "#main .quick_filter").clear()
        waitForElement($driver, $wait, "#main .quick_filter").send_keys(receiver)
        step("\"Mailtrap\" I wait for loading finished")
        noResult = waitForElementXpath($driver, $normalWait, "//*[contains(@class, 'messages_list')]/li/p[text()='Nothing has been found for the filter']") != nil
    end
    email = waitForElementXpath($driver, $normalWait, "//*[contains(concat(' ', @class, ' '), 'messages_list')]/*[contains(concat(' ', @class, ' '), 'email')]/*[contains(text(),'" + filter + "')]")
    email.click()
    step("\"Mailtrap\" I wait for loading finished")
    sleep 2
end

Then(/^"Mailtrap" I search email with title "([^"]*)" and receiver "([^"]*)"$/) do |title, receiver|
    noResult = true
    while noResult
        sleep 3
        waitForElement($driver, $wait, "#main .quick_filter").clear()
        waitForElement($driver, $wait, "#main .quick_filter").send_keys(title)
        step("\"Mailtrap\" I wait for loading finished")
        noResult = waitForElementXpath($driver, $normalWait, "//*[contains(@class, 'messages_list')]/li/p[text()='Nothing has been found for the filter']") != nil
    end
    
    email = nil
    emails = waitForElementsXpath($driver, $normalWait, "//*[contains(concat(' ', @class, ' '), 'messages_list')]//*[@class='to']")
    emails.each do |ema|
        if refineElementTextContent(ema) == "To: <" + receiver + ">"
            email  = ema
        end
    end
    email.click()
    step("\"Mailtrap\" I wait for loading finished")
    sleep 2
end

Then(/^"Mailtrap" I wait for loading finished$/) do
    sleep 1
    while findElement($driver, "#nprogress") != nil
        sleep 1
    end
end

Then(/^"Mailtrap" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, password|
    waitForElementVisible($driver, $wait, ".signin_block > a:nth-of-type(1)").click()
    waitForElementVisible($driver, $wait, "#new_user #user_email").send_keys(userName)
    waitForElementVisible($driver, $wait, "#new_user #user_password").send_keys(password)
    waitForElementVisible($driver, $wait, "#new_user input[type=submit]").click()
end

Then(/^"Mailtrap" I go to practera inbox$/) do
    waitForElementVisibleXpath($driver, $wait, "//*[@class='initial']/strong/a/span[text()='practera']/..").click()
    sleep 2
end

Then(/^"Mailtrap" I log out$/) do
    waitForElementVisible($driver, $wait, ".account-name").click()
    sleep 2
    waitForElementVisible($driver, $wait, ".account-dropdown > li:nth-of-type(4)").click()
end