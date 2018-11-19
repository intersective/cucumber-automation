

Then(/^"Practera" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
    step("I can see \"a form\" which is located at \"form#login\"")
    step("I input \"#{userName}\" to \"email input field\" which is located at \"form#login input#UserEmail\"")
    step("I input \"#{userPassword}\" to \"password input field\" which is located at \"form#login input#UserPassword\"")
    step("I click on \"a button\" which is located at \"form#login button\"")
    step("I can see \"message\" which is located at \".toast-message\"")
    step("The \"message\" which is located at \".toast-message\" should be disappear")
    step("I wait 2 seconds")
end

Then(/^"Practera" I login with "([^"]*)" and "([^"]*)"$/) do |userNameKey, userPasswordKey|
    userName = loadSharedData(userNameKey)
    userPassword = loadSharedData(userPasswordKey)
    step("\"Practera\" I login with username \"#{userName}\" and password \"#{userPassword}\"")
end

Then(/^"Practera" I should see a student "([^"]*)" submission$/) do |studentName|
    found = false
    unassigneds = waitForElements($driver, $listWait, "#tblUnassigned > tbody > tr")
    unassigneds.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            found = true
            break
        end
    end
    if !found
        fail("I can not see the student submissions")
    end
end

Then(/^"Practera" I should see a student "([^"]*)" ready to publish submission$/) do |studentName|
    found = false
    readytopublishes = waitForElements($driver, $listWait, "#tblReady-to-publish > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            found = true
            break
        end
    end
    if !found
        fail("I can not see the student ready to publish submissions")
    end
end

Then(/^"Practera" I should see the student(|[1-9]+[0-9]*) ready to publish submission$/) do |arg1|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I should see a student \"#{studentName}\" ready to publish submission")
end

Then(/^"Practera" I should see the student(|[1-9]+[0-9]*) submission$/) do |arg1|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I should see a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to a student "([^"]*)" submission$/) do |mentor, studentName|
    mentorName = loadSharedData(mentor, mentor)
    step("\"Practera\" I can assign \"#{mentorName}\" to \"#{studentName}\" submission")
end

Then(/^"Practera" I can assign "([^"]*)" to "([^"]*)" submission$/) do |arg1, arg2|
    editableform = nil
    index = 1
    unassigneds = waitForElements($driver, $listWait, "#tblUnassigned > tbody > tr")
    unassigneds.each do |uas|
        if arg2 == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            findElementWithParent(uas, "td:nth-of-type(4) > a").click()
            editableform = waitElementWithParent($wait, uas, "td:nth-of-type(4) .editableform")
            break
        end
        index = index + 1
    end
    findElementWithParent(editableform, ".editable-input input").send_keys(arg1)
    waitForElement($driver, $wait, "ul.select2-results > li > div").click()
    findElementWithParent(editableform, ".editable-buttons button.editable-submit").click()
    while waitForElement($driver, $shortWait, "#tblUnassigned > tbody > tr:nth-of-type(" + index.to_s + ") td:nth-of-type(4) .editableform") != nil
        sleep 1
    end
end

Then(/^"Practera" I can assign (mentor|student)(|[1-9]+[0-9]*) to the student(|[1-9]+[0-9]*) submission$/) do |arg1, arg2, arg3|
    userName1 = getUserFromData(arg2, arg1).name
    userName2 = getUserFromData(arg3, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can assign \"#{userName1}\" to \"#{userName2}\" submission")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to the student(|[1-9]+[0-9]*) submission$/) do |mentor, arg2|
    studentName = getUserFromData(arg2, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can assign a mentor \"#{mentor}\" to a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can publish a student "([^"]*)" submission review$/) do |studentName|
    readytopublishes = waitForElements($driver, $listWait, "#tblReady-to-publish > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            $driver.execute_script("window.confirm = function(){return true;}")
            sleep 2
            findElementWithParent(uas, "td:nth-of-type(6) > a").click()
            break
        end
    end
end

Then(/^"Practera" I can see a student "([^"]*)" submission review with "([^"]*)" publisher$/) do |studentName, publisher|
    readytopublishes = waitForElements($driver, $listWait, "#tblPublished > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            sleep 2
            pubPerosn = findElementWithParent(uas, "[data-type='Published on']").attribute("title").split(",")[-1,].strip()
            if pubPerosn.index(publisher) == nil
                message = "expected publisher %s, but found %s" % [publisher, pubPerosn]
                $testLogger1.logCase(message)
                @collectedErrors.push(message)
            end
        end
    end
end

Then(/^"Practera" I can edit a student "([^"]*)" submission review$/) do |studentName|
    readytopublishes = waitForElements($driver, $listWait, "#tblReady-to-publish > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            $driver.execute_script("window.confirm = function(){return true;}")
            sleep 2
            findElementWithParent(uas, "td:nth-of-type(5) > span:nth-of-type(2) > a:nth-of-type(3)").click()
            break
        end
    end
end

Then(/^"Practera" I can publish the student(|[1-9]+[0-9]*) submission review$/) do |arg1|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can publish a student \"#{studentName}\" submission review")
end

Then(/^"Practera" I can see the student(|[1-9]+[0-9]*) submission review with "([^"]*)" publisher$/) do |arg1, publisher|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can see a student \"#{studentName}\" submission review with \"#{publisher}\" publisher")
end

Then(/^"Practera" I can edit the student(|[1-9]+[0-9]*) submission review$/) do |arg1|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can edit a student \"#{studentName}\" submission review")
end

Then(/^"Practera" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
    toReviews = waitForElements($driver, $listWait, "#toreview tbody tr")
    toReviews.each do |row|
        if studentName == refineElementTextContent(findElementWithParent(row, "td:nth-of-type(3)")) &&
            assessmentName == refineElementTextContent(findElementWithParent(row, "td:nth-of-type(1)"))
            ele = findElementWithParent(row, "td:nth-of-type(5) > a")
            scrollIfNotVisible($driver, ele)
            ele.click() 
            break
        end
    end
end

Then(/^"Practera" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
    studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
    step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end

Then(/^I wait until the enrolment process percentage be 100 percent$/) do
	while "100% Complete" != waitForElement($driver, $wait, "div.progress > #process-percentage").attribute("innerText")
		sleep 1
	end
end

Then(/^I input (mentor|student)(|[1-9]+[0-9]*) name to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
    studentName = getUserFromData(arg2, arg1).name
	waitForElement($driver, $wait, arg4).send_keys(studentName)
end

Then("I wait the search result with locator {string}") do |arg1|
    while waitForElement($driver, $shortWait, "#indextbl_processing").attribute("style").index("display: block;") != nil
		sleep 1
	end
	while waitForElements($driver, $listWait, arg1).length == 0
		sleep 1
	end
end

Then(/^I get the registration url at "([^"]*)" for ([1-9]+[0-9]*) (mentor|student)(|s)$/) do |arg1, arg2, arg3, arg4|
    counter = arg2.to_i
    for i in 1..counter
        step("I input #{arg3}#{i} name to \"the box\" which is located at \"#indextbl_filter input\"")
        step("I wait 2 seconds")
        step("I wait the search result with locator \"table#indextbl tbody tr\"")
        regHref = waitForElement($driver, $wait, arg1).attribute("href")
        user = getUserFromData(i.to_s, arg3)
        user.regUrl = regHref
        waitForElement($driver, $wait, "#indextbl_filter input").clear
        step("I wait 2 seconds")
    end
end

Then(/^"Practera" I can assign a mentor to student submissions with:$/) do |table|
    step("I can see a group of \"assessments\" with total \"6\" which is located at \".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr\"")

    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessmentName = data[i][0].strip()
        mentor = data[i][1].strip()
        students = data[i][2].strip().split(";")
        step("I click on \"#{assessmentName}\" which is located at \".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr:nth-of-type(2) td:nth-of-type(3) > a\"")
		step("I click on \"review tab\" which is located at \"#reviewContainer > div#assessments > ul#reviewTab > li:nth-of-type(2)\"")
	    step("I wait 2 seconds")
        students.each do |student|
            step("I should be able to see a group of \"unassigned submissions\" which is located at \"#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr\"")
            step("\"Practera\" I should see a student \"#{student}\" submission")
            step("\"Practera\" I can assign a mentor \"#{mentor}\" to a student \"#{student}\" submission")
            step("I can see \"message\" which is located at \".toast-message\"")
            step("The \"message\" which is located at \".toast-message\" should be disappear")
            step("I wait 2 seconds")
        end
        step("I scroll to the top")
		step("I wait 2 seconds")
		step("I click on \"a tag\" which is located at \".page-header span > a\"")
		step("I can see a group of \"assessments\" with total \"6\" which is located at \".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr\"")
    end    
end

Then(/^"Practera" I can do the review with:$/) do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessmentName = data[i][0].strip()
        studentName = data[i][1].strip()
        
        step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
		
		step("I click on \"the start button\" which is located at \"//*[@id='start-page']/../*[contains(@class, 'form-actions')]/button\" with xpath")
		step("I wait 2 seconds")

		step("I can see \"wizard steps\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active\"")
        for i in 1..2 do
            locator = ".content-container > .row:nth-of-type(%s)" % [i]
            if findElement($driver, locator) != nil
                locator = ".content-container > .row:nth-of-type(%s) > p" % [i]
                if findElement($driver, locator) == nil
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-text textarea\" with scroll" % [i]
                    step(locator)
                end
            end
        end
        if findElement($driver, "//span[normalize-space()='Reviewer Comments']", selectorType="xpath") != nil
            verifyValue("expected reviewer comments", "nil", "something")
        end
        step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")
		step("I wait 2 seconds")
		
		step("I can see \"step 2\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active\"")
        step("I wait 2 seconds")
        for i in 1..10 do
            locator = ".content-container > .row:nth-of-type(%s)" % [i]
            if findElement($driver, locator) != nil
                locator = ".content-container > .row:nth-of-type(%s) > p" % [i]
                if findElement($driver, locator) == nil
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-text textarea\" with scroll" % [i]
                    step(locator)
                end
            end
        end
        if findElement($driver, "//span[normalize-space()='Reviewer Comments']", selectorType="xpath") != nil
            verifyValue("expected reviewer comments", "nil", "something")
        end
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")
		step("I wait 2 seconds")

		step("I can see \"step 3\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active\"")
		step("I wait 2 seconds")
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")

		step("I can see \"step 4\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active\"")
		step("I wait 2 seconds")
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")

		step("I can see \"step 5\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(5).active\"")
		step("I click on \"outstanding\" which is located at \"//span[normalize-space()='Outstanding (4)']\" with xpath scroll")
		step("I input \"your works are excellent, thank you for submissions\" to \"Reviewer Comments\" which is located at \"//span[normalize-space()='Reviewer Comments']/../textarea\" with xpath scroll")

		step("I wait 2 seconds")
		step("I click on \"submit button\" which is located at \"div#assessment-buttons button#submit\" with scroll")
		step("I can to see \"message\" which is located at \".toast-message\"")
		step("The \"message\" which is located at \".toast-message\" should be disappear")
		step("I should be able to see a group of \"to review submission\" which is located at \"#toreview tbody tr\"")
    end
end

Then(/^"Practera" I can publish the submission reviews with:$/) do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessments = waitForElements($driver, $listWait, ".content-container > div#assessments > .tab-content > #moderated div > table > tbody > tr")
        assessments.each do |assessment|
            assessmentName = refineElementTextContent(assessment.find_element(:css => "td:nth-of-type(1)"))
            if assessmentName == data[i][0]
                assessment.find_element(:css => "td:nth-of-type(5) > a").click()
                step("I wait 2 seconds")
                step("I should be able to see a group of \"reviewed submissions\" which is located at \"#tblReady-to-publish > tbody > tr\"")
                break
            end
        end
        students = data[i][1].split(";")
        students.each do |student|
            step("\"Practera\" I should see a student \"#{student}\" ready to publish submission")
            step("\"Practera\" I can publish a student \"#{student}\" submission review")
            step("I can see \"message\" which is located at \".toast-message\"")
            step("The \"message\" which is located at \".toast-message\" should be disappear")
        end

        step("I scroll to the top")
		step("I wait 2 seconds")
		step("I click on \"a tag\" which is located at \".page-header span > a\"")
		step("I wait 2 seconds")
    end
end

Then(/^"Practera" I can choose a timeline "([^"]*)" calendar$/) do |timeline|
    xapth = "//td[text()='%s']/../td[5]/div/a[2]" % [timeline]
    waitForElementVisibleXpath($driver, $wait, xapth).click()
end

Then(/^"Practera" I can create an event today$/) do
    localNow = Time.now
    today = "%s-%s-%s" % [localNow.year.to_s, prependZero(localNow.month), prependZero(localNow.day)]
    locator = "div#calendar tbody td[data-date='%s']" % [today]
    waitForElements($driver, $listWait, locator)[1].click()
    sleep 2
    activityType = Selenium::WebDriver::Support::Select.new(waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog select#className"))
    activityType.select_by(:index, 1)
    isOriginalSelect = Selenium::WebDriver::Support::Select.new(waitForElement($driver, $wait, "select#is_original"))
    isOriginalSelect.select_by(:index, 0)
    sleep 2
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fkey #s2id_foreign_key").click()
    waitForElement($driver, $wait, "#select2-drop > .select2-search > input").send_keys("newbie")
    waitForElementVisible($driver, $wait, ".select2-results > li > div > span").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fhas_assessment input[type=checkbox]").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fassessment #s2id_assessment").click()
    waitForElement($driver, $wait, "#select2-drop > .select2-search > input").send_keys("generic barry checkin assessment")
    waitForElementVisible($driver, $wait, ".select2-results > li > div > span").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#EventVisibilityParticipant").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#EventVisibilityMentor").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .datetime-calendar").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .datetime-calendar").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .bootstrap-datetimepicker-widget .datepicker > .datepicker-days .today").click()
    sleep 2
    Selenium::WebDriver::Support::Select.new(waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog select#EventAddNotify")).select_by(:index, 0)
    eventId = generateUniId()
    evevtName = "Selenium Event - %s" % [eventId]
    evevtDescription = "%s description" % [evevtName]
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#title").send_keys(evevtName)
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#location").send_keys("Sydney city")
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog textarea#description").send_keys(evevtDescription)
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#capacity").send_keys("100")
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog .modal-footer > button:nth-of-type(1)").click()
    $sharedData1.putData(Application.KEY_CURRENTEVENT, evevtName)
    sleep 5
    locator = "//*[@class='fc-title'][text()='%s']" % [evevtName]
    waitForElementVisibleXpath($driver, $wait, locator).click()
    sleep 2
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog .modal-footer > button[data-bb-handler='close']").click()
end

Then(/^"Practera" I upload the file "([^"]*)" to file picker$/) do |filePath|
    currentWindow = $driver.window_handle
    waitForElement($driver, $wait, "#filepicker_dialog")
    sleep 3
    $driver.switch_to.frame("filepicker_dialog")
    waitForElement($driver, $wait, "section.fp__drag-and-drop button")
    sleep 2
    waitForElement($driver, $wait, "input[type='file']").send_keys(getUploadFileFullPath(filePath))
    waitForElementVisibleXpath($driver, $wait, "//button[text()='Upload']").click()
    $driver.switch_to.window(currentWindow)
    step("\"Practera\" I wait file uploading finished")
    sleep 2
end

Then(/^"Practera" I wait file uploading finished$/) do
    while waitForElement($driver, $shortWait, "#filepicker_dialog") != nil
        sleep 1
        $testLogger1.debug("file uploading")
    end
end

Then(/^"Practera" I wait for spinner loading finished$/) do
    while waitForElement($driver, $shortWait, ".spinner") != nil
        sleep(0.1)
    end
    sleep(0.5)
end

Then(/^"Practera" I wait the event toggler spinner disappear$/) do
    while findElement($driver, "#event_toggle_spinner").attribute("class").index("hidden") == nil
        sleep(0.1)
    end
end

Then("\"Practera\" I log out") do
    waitForElementVisible($driver, $wait, "#usermenu > a.dropdown-toggle").click()
    waitForElementVisibleXpath($driver, $wait, "//*[@id='usermenu']//li[normalize-space()='Logout']/a").click()
end

Then("\"Practera\" I go to profile") do
    waitForElementVisible($driver, $wait, "#usermenu > a.dropdown-toggle").click()
    waitForElementVisibleXpath($driver, $wait, "//*[@id='usermenu']//li[normalize-space()='Profile']/a").click()
end

Then("\"Practera\" I check the assessment uploaded file with:") do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        filePosition = data[i][0].strip()
        fileName = data[i][1].strip()
        step("I should see \"a file link\" which is located at \"//*[@id='assessment']//ul/li[#{filePosition}]/a[text()='#{fileName}']\" with xpath")
    end
end