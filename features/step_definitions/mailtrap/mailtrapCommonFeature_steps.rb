

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
            email = ema
            break
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

Then(/^"Mailtrap" I login with "([^"]*)" and "([^"]*)"$/) do |user, password|
    userName = loadSharedData(user, user)
    userPassword = loadSharedData(password ,password)
    step("\"Mailtrap\" I login with username \"#{userName}\" and password \"#{userPassword}\"")
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

Then(/^"Mailtrap" I go into the email content$/) do
    currentWindow = $driver.window_handle
    $sharedData1.putData(Application.KEY_PREVIOUSWINDOW, currentWindow)
    $driver.switch_to.frame(0)
end

Then(/^"Mailtrap" I go back to previous frame$/) do
    # back to the main document
    $driver.switch_to.default_content
    previousWindow = loadSharedData(Application.KEY_PREVIOUSWINDOW)
    $driver.switch_to.window(previousWindow)
end

Then("\"Mailtrap\" I can see {string} in the email content") do |contentStr|
    if waitForElementsXpath($driver, $wait, "//*[text()='" + contentStr + "']") == nil
        fail("I cannot see the email content")
    end
end

Then("\"Mailtrap Api\" I search email with {string} {string} and {string} {string} with {string} tries") do |type1, type1Value, type2, type2Value, tries|
    apiUrl = "https://mailtrap.io/api/v1/inboxes/%s/messages" % [$configObj["mailtrapPracteraInboxId"]]
    pheaders, pdata = buildMailTrapApiPara(type1Value)
    noFound = true
    counter = tries.to_i
    if type1 == "receiver"
        receiver = type1Value
        title = type2Value
    else
        receiver = type2Value
        title = type1Value
    end
    while noFound
        begin
            result = fireRequestWithData("get", apiUrl, pheaders, pdata)
            mails = result.select do |message|
                message["to_email"] == receiver && message["subject"] == title
            end
            counter = counter - 1
            noFound = checkMails(mails, counter, tries)
        rescue Exception => e
            puts(e.message)
            noFound = false
        end
    end
end

Then("\"Mailtrap Api\" I can see {string} in the email content") do |contentStr|
    message = loadSharedData(Application.KEY_MAILMESSAGE)
    doc =  Nokogiri::HTML(message["html_body"])
    if doc.xpath("//*[text()='" + contentStr + "']").first == nil
        fail("I cannot see the email content")
    end
end

Then(/^"Mailtrap" I search email with title "([^"]*)" and the (mentor|student)(|[1-9]+[0-9]*) as receiver$/) do |title, arg2, arg3|
    studentAccount = getUserFromData(arg3, arg2).account
    step("\"Mailtrap\" I search email with title \"#{title}\" and receiver \"#{studentAccount}\"")
end

private def buildMailTrapApiPara(searchStr)
    pheaders = {
        "Api-Token" => $configObj["mailtrapApiToken"]
    }
    pdata = {
        "search" => searchStr
    }
    return pheaders, pdata
end

private def checkMails(mails, counter, tries)
    if mails.length < 1 && counter < 1
        puts("not found with %s tries" % [tries])
        noFound = false
    elsif mails.length < 1
        puts("not found, wait 10 seconds")
        sleep(10)
        noFound = true
    else
        puts("found the email with the receiver and subject")
        noFound = false
        $sharedData1.putData(Application.KEY_MAILMESSAGE, mails[0])
    end
    return noFound
end