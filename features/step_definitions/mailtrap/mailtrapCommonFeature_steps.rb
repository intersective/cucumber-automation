

Then(/^"Mailtrap" I search email with receiver "([^"]*)" and filter "([^"]*)"$/) do |receiver, filter|
    noResult = true
    while noResult
        sleep 3
        wait_for_element($driver, $wait, "#main .quick_filter").clear()
        wait_for_element($driver, $wait, "#main .quick_filter").send_keys(receiver)
        step("\"Mailtrap\" I wait for loading finished")
        noResult = wait_for_element_xpath($driver, $normalWait, "//*[contains(@class, 'messages_list')]/li/p[text()='Nothing has been found for the filter']") != nil
    end
    email = wait_for_element_xpath($driver, $normalWait, "//*[contains(concat(' ', @class, ' '), 'messages_list')]/*[contains(concat(' ', @class, ' '), 'email')]/*[contains(text(),'" + filter + "')]")
    email.click()
    step("\"Mailtrap\" I wait for loading finished")
    sleep 2
end

Then(/^"Mailtrap" I search email with title "([^"]*)" and receiver "([^"]*)"$/) do |title, receiver|
    noResult = true
    while noResult
        sleep 3
        wait_for_element($driver, $wait, "#main .quick_filter").clear()
        wait_for_element($driver, $wait, "#main .quick_filter").send_keys(title)
        step("\"Mailtrap\" I wait for loading finished")
        noResult = wait_for_element_xpath($driver, $normalWait, "//*[contains(@class, 'messages_list')]/li/p[text()='Nothing has been found for the filter']") != nil
    end
    
    email = nil
    emails = wait_for_elements_xpath($driver, $normalWait, "//*[contains(concat(' ', @class, ' '), 'messages_list')]//*[@class='to']")
    emails.each do |ema|
        if refine_element_text_content(ema) == "To: <" + receiver + ">"
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
    while find_element($driver, "#nprogress") != nil
        sleep 1
    end
end

Then(/^"Mailtrap" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
    u = extract_parameter(username, username)
    p = extract_parameter(userPassword, userPassword)
    wait_for_element_visible($driver, $wait, ".signin_block > a:nth-of-type(1)").click()
    wait_for_element_visible($driver, $wait, "#new_user #user_email").send_keys(u)
    wait_for_element_visible($driver, $wait, "#new_user #user_password").send_keys(p)
    wait_for_element_visible($driver, $wait, "#new_user input[type=submit]").click()
end

Then(/^"Mailtrap" I go to "([^"]*)" inbox$/) do |inbox_name|
    wait_for_element_visible_xpath($driver, $wait, "//a/strong[normalize-space()='#{inbox_name}']/..").click()
    sleep 2
end

Then(/^"Mailtrap" I log out$/) do
    wait_for_element_visible($driver, $wait, ".show_hide_menu_link").click()
    sleep 2
    wait_for_element_visible($driver, $wait, ".show_hide_menu_link + ul > li:nth-of-type(4)").click()
end

Then(/^"Mailtrap" I go into the email content$/) do
    currentWindow = $driver.window_handle
    $sharedData1.put_data(Application.KEY_PREVIOUSWINDOW, currentWindow)
    $driver.switch_to.frame(0)
end

Then(/^"Mailtrap" I go back to previous frame$/) do
    # back to the main document
    $driver.switch_to.default_content
    previousWindow = load_shared_data(Application.KEY_PREVIOUSWINDOW)
    $driver.switch_to.window(previousWindow)
end

Then("\"Mailtrap\" I can see {string} in the email content") do |contentStr|
    if wait_for_elements_xpath($driver, $wait, "//*[text()='" + contentStr + "']") == nil
        verify_value("expected text exist", contentStr, "nil")
    end
end

Then(/^"Mailtrap Api" I search email with (receiver|title) "([^"]*)" and (receiver|title) "([^"]*)" with "([^"]*)" tries$/) do |type1, type1Value, type2, type2Value, tries|
    apiUrl = "https://mailtrap.io/api/v1/inboxes/%s/messages" % [$configObj["MAILTRAP_PRACTERA_INBOXID"]]
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
            result = fire_request_with_data("get", apiUrl, pheaders, pdata)
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

Then(/^"Mailtrap Api" I (should|can) see "([^"]*)" in the email content$/) do |arg1, contentStr|
    message = load_shared_data(Application.KEY_MAILMESSAGE)
    apiUrl = "https://mailtrap.io" + message["html_source_path"]
    pheaders, pdata = buildMailTrapApiPara(nil)
    result = fire_request("get", apiUrl, pheaders, nil)
    doc =  Nokogiri::HTML(result)
    result = doc.xpath("//*[normalize-space()='" + contentStr + "']").first
    if result == nil
        if arg1 == "should"
            fail("I cannot see the email content: " + contentStr)
        else
            verify_value("expected text exist", contentStr, "nil")
        end
    end
end

Then(/^"Mailtrap" I search email with title "([^"]*)" and the (mentor|student)(|[1-9]+[0-9]*) as receiver$/) do |title, arg2, arg3|
    studentAccount = get_user_from_data(arg3, arg2).account
    step("\"Mailtrap\" I search email with title \"#{title}\" and receiver \"#{studentAccount}\"")
end

private def buildMailTrapApiPara(searchStr)
    pheaders = {
        "Api-Token" => $configObj["MAILTRAP_APITOKEN"]
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
        $sharedData1.put_data(Application.KEY_MAILMESSAGE, mails[0])
    end
    return noFound
end