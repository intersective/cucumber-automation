

Then(/^"Practera" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
    step("I click on \"a button\" which is located at \"#main-nav > ul.nav > li:nth-of-type(2) > a\"")
    step("I should be able to see \"a form\" which is located at \"form#login\"")
    step("I input \"#{userName}\" to \"email input field\" which is located at \"form#login input#UserEmail\"")
    step("I input \"#{userPassword}\" to \"password input field\" which is located at \"form#login input#UserPassword\"")
    step("I click on \"a button\" which is located at \"form#login button\"")
    step("I should be able to see \"message\" which is located at \".toast-message\"")
    step("The \"message\" which is located at \".toast-message\" should be disappear")
    step("I wait 2 seconds")
end

Then(/^"Practera" I should see a student "([^"]*)" submission$/) do |studentName|
    found = false
    unassigneds = waitForElements($driver, $wait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr")
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
    readytopublishes = waitForElements($driver, $listWait, "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr")
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

Then(/^"Practera" I should see the student ready to publish submission$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I should see a student \"#{studentName}\" ready to publish submission")
end

Then(/^"Practera" I should see the student submission$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I should see a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to a student "([^"]*)" submission$/) do |mentorName, studentName|
    popover = nil
    index = 1
    unassigneds = waitForElements($driver, $listWait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr")
    unassigneds.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            findElementWithParent(uas, "td:nth-of-type(3) > span a").click()
            popover = waitElementWithParent($wait, uas, "td:nth-of-type(3) > span > div.popover")
            break
        end
        index = index + 1
    end
    findElementWithParent(popover, ".popover-content input").send_keys(mentorName)
    waitForElement($driver, $wait, "ul.select2-results > li > div").click()
    findElementWithParent(popover, ".popover-content button.editable-submit").click()
    while waitForElement($driver, $shortWait, "#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr:nth-of-type(" + index.to_s + ") td:nth-of-type(3) > span > div.popover") != nil
        sleep 1
    end
end

Then(/^"Practera" I can publish a student "([^"]*)" submission review$/) do |studentName|
    readytopublishes = waitForElements($driver, $listWait, "#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr")
    readytopublishes.each do |uas|
        if studentName == refineElementTextContent(findElementWithParent(uas, "td:nth-of-type(1) > span"))
            $driver.execute_script("window.confirm = function(){return true;}")
            sleep 2
            findElementWithParent(uas, "td:nth-of-type(5) > span:nth-of-type(2) > a").click()
            break
        end
    end
end

Then(/^"Practera" I can publish the student submission review$/) do
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can publish a student \"#{studentName}\" submission review")
end

Then(/^"Practera" I can assign a mentor "([^"]*)" to the student submission$/) do |mentorName|
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can assign a mentor \"selenium_mentor2\" to a student \"#{studentName}\" submission")
end

Then(/^"Practera" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
    toReviews = waitForElements($driver, $listWait, "div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row")
    toReviews.each do |row|
        if studentName == refineElementTextContent(findElementWithParent(row, "div:nth-of-type(3)")) &&
            assessmentName == refineElementTextContent(findElementWithParent(row, "div:nth-of-type(1)"))
            ele = findElementWithParent(row, "div:nth-of-type(4) > a")
            scrollIfNotVisible($driver, ele)
            ele.click() 
            break
        end
    end
end

Then(/^"Practera" I can go to the review page with the student submission and the assessment "([^"]*)"$/) do |assessmentName|
    studentName = $sharedData1.loadDataFromKey("studentName")
    step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end

Then(/^I wait until the enrolment process percentage be 100 percent$/) do
	while "100% Complete" != waitForElement($driver, $wait, "div.progress > #process-percentage").attribute("innerText")
		sleep 1
	end
end

Then(/^I input student name to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElement($driver, $wait, arg2).send_keys($sharedData1.loadDataFromKey("studentName"))
end

Then(/^I wait the search result$/) do
	while waitForElements($driver, $listWait, "table#indextbl tbody tr").length != 1
		sleep 1
	end
end

Then(/^I get the registration url at "([^"]*)"$/) do |arg1|
    regHref = waitForElement($driver, $wait, arg1).attribute("href")
    $sharedData1.putData("regUrl", regHref)
end

Then(/^I use the registration link$/) do
	regLink = $sharedData1.loadDataFromKey("regUrl")
	$driver.get(regLink)
end

Then(/^"Practera" I can assign a mentor to student submissions with:$/) do |table|
    step("I can see a group of \"assessments\" with total \"6\" which is located at \".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr\"")

    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessmentName = data[i][0].strip()
        mentorName = data[i][1].strip()
        students = data[i][2].strip().split(";")
        step("I click on \"#{assessmentName}\" which is located at \".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr:nth-of-type(2) td:nth-of-type(3) > a\"")
		step("I click on \"review tab\" which is located at \"#reviewContainer > div#assessments > ul#reviewTab > li:nth-of-type(2)\"")
	    step("I wait 2 seconds")
        students.each do |student|
            step("I should be able to see a group of \"unassigned submissions\" which is located at \"#reviewContainer > div#assessments > div > div#unassigned > div > table > tbody > tr\"")
            step("\"Practera\" I should see a student \"#{student}\" submission")
            step("\"Practera\" I can assign a mentor \"#{mentorName}\" to a student \"#{student}\" submission")
            step("I should be able to see \"message\" which is located at \".toast-message\"")
            step("The \"message\" which is located at \".toast-message\" should be disappear")
            step("I wait 2 seconds")
        end
        step("I scroll to the top")
		step("I wait 2 seconds")
		step("I click on \"a tag\" which is located at \".page-header span > a\"")
		step("I can see a group of \"assessments\" with total \"6\" which is located at \".content-container > div#assessments > .tab-content > #moderated > div> table > tbody > tr\"")
    end    
end

Then(/^"Practera" I can do the review with:$/) do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessmentName = data[i][0].strip()
        studentName = data[i][1].strip()
        
        step("\"Practera\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
		
		step("I click on \"the start button\" which is located at \"div#start-page > div.form-actions > button\"")
		step("I wait 2 seconds")

		step("I should be able to see \"wizard steps\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(1).active\"")
        for i in 1..2 do
            locator = ".content-container > .row:nth-of-type(%s)" % [i]
            if findElement($driver, locator) != nil
                locator = ".content-container > .row:nth-of-type(%s) > p" % [i]
                if findElement($driver, locator) == nil
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-text textarea\" with scroll" % [i]
                    step(locator)
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-comment textarea\" with scroll" % [i]
                    step(locator)
                end
            end
        end
        step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")
		step("I wait 2 seconds")
		
		step("I should be able to see \"step 2\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(2).active\"")
        step("I wait 2 seconds")
        for i in 1..10 do
            locator = ".content-container > .row:nth-of-type(%s)" % [i]
            if findElement($driver, locator) != nil
                locator = ".content-container > .row:nth-of-type(%s) > p" % [i]
                if findElement($driver, locator) == nil
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-text textarea\" with scroll" % [i]
                    step(locator)
                    locator = "I input \"your works are excellent, thank you for submissions\" to \"Free text review\" which is located at \".content-container > .row:nth-of-type(%s) #choice-comment textarea\" with scroll" % [i]
                    step(locator)
                end
            end
        end
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")
		step("I wait 2 seconds")

		step("I should be able to see \"step 3\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(3).active\"")
		step("I wait 2 seconds")
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")

		step("I should be able to see \"step 4\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(4).active\"")
		step("I wait 2 seconds")
		step("I click on \"next button\" which is located at \"div.content-container > div#assessment-buttons > div > div:nth-of-type(2) > button.btn-primary\" with scroll")

		step("I should be able to see \"step 5\" which is located at \"div#assessment > div.page-header > div > ul.wizard-steps > li:nth-of-type(5).active\"")
		step("I click on \"outstanding\" which is located at \"//span[normalize-space()='Outstanding (4)']\" with xpath scroll")
		step("I input \"your works are excellent, thank you for submissions\" to \"Reviewer Comments\" which is located at \"//span[normalize-space()='Reviewer Comments']/../textarea\" with xpath scroll")

		step("I wait 2 seconds")
		step("I click on \"submit button\" which is located at \"div#assessment-buttons button#submit\" with scroll")
		step("I should be able to see \"message\" which is located at \".toast-message\"")
		step("The \"message\" which is located at \".toast-message\" should be disappear")
		step("I should be able to see a group of \"to review submission\" which is located at \"div.page-content > div.content-container > div#assessments > div.tab-content > div#toreview > div.row\"")
    end
end

Then(/^"Practera" I can publish the submission reviews with:$/) do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        assessments = waitForElements($driver, $listWait, ".content-container > div#assessments > .tab-content > #moderated > div > table > tbody > tr")
        assessments.each do |assessment|
            assessmentName = refineElementTextContent(assessment.find_element(:css => "td:nth-of-type(1)"))
            if assessmentName == data[i][0]
                assessment.find_element(:css => "td:nth-of-type(5) > a").click()
                step("I wait 2 seconds")
                step("I should be able to see a group of \"reviewed submissions\" which is located at \"#reviewContainer > div#assessments > div > div#readytopublish > div > table > tbody > tr\"")
                break
            end
        end
        students = data[i][1].split(";")
        students.each do |student|
            step("\"Practera\" I should see a student \"#{student}\" ready to publish submission")
            step("\"Practera\" I can publish a student \"#{student}\" submission review")
            step("I should be able to see \"message\" which is located at \".toast-message\"")
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
    waitForElementVisible($driver, $wait, ".select2-results> li > div > span").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fhas_assessment input[type=checkbox]").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fassessment #s2id_assessment").click()
    waitForElement($driver, $wait, "#select2-drop > .select2-search > input").send_keys("generic barry checkin assessment")
    waitForElementVisible($driver, $wait, ".select2-results> li > div > span").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#EventVisibilityParticipant").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#EventVisibilityMentor").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .datetime-calendar").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .datetime-calendar").click()
    waitForElementVisible($driver, $wait, "div.modal[role=dialog] > .modal-dialog #fend .bootstrap-datetimepicker-widget .datepicker > .datepicker-days .today").click()
    sleep 2
    Selenium::WebDriver::Support::Select.new(waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog select#EventAddNotify")).select_by(:index, 0)
    eventId = generateStudentId()
    evevtName = "Selenium Event - %s" % [eventId]
    evevtDescription = "%s description" % [evevtName]
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#title").send_keys(evevtName)
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#location").send_keys("Sydney city")
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog textarea#description").send_keys(evevtDescription)
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog input#capacity").send_keys("100")
    waitForElement($driver, $wait, "div.modal[role=dialog] > .modal-dialog .modal-footer > button:nth-of-type(1)").click()
    $sharedData1.putData("currentEvent", evevtName)
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
    waitForElement($driver, $wait, "input[type='file']").send_keys(filePath)
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