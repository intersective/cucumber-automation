

Then(/^"PE" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
    step("I should be able to see \"login form\" which is located at \"form.general-form\"")
	step("I input \"#{userName}\" to \"email input box\" which is located at \"form.general-form ion-input[name=email] input\"")
    step("I input \"#{userPassword}\" to \"email input box\" which is located at \"form.general-form ion-input[name=password] input\"")
    step("I click on \"login button\" which is located at \"form.general-form > button\"")
end

Then(/^"PE" I login with the student and password "([^"]*)"$/) do |userPassword|
    studentAccount = $sharedData1.loadDataFromKey("studentAccount")
    step("\"PE\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"PE" I wait for loading finished$/) do
    step("The \"loading dialog\" which is located at \"ion-loading\" should be disappear")
    clickBlock = waitForElement($driver, $normalWait, ".click-block")
	if clickBlock != nil
		while clickBlock.attribute("class").index("click-block-active") != nil
			sleep 1
			clickBlock = waitForElement($driver, $shortWait, ".click-block")
		end
	end
end

Then(/^"PE" I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
    studentId = generateStudentId()
	studentName = "selenium.%s" % [studentId]
    studentAccount = "%s@practera.com" % [studentName]
    $sharedData1.putData("studentName", studentName)
    $sharedData1.putData("studentAccount", studentAccount)
    csvtext = "\n%s,%s,%s,fullaccess" % [studentAccount, studentId, studentName]
    enrolmentFile = Dir.pwd + '/data/sandbox-pe-participant.csv'
    File.open(enrolmentFile, File::WRONLY | File::APPEND) do |f|
        f.write(csvtext)
    end
    if $configObj["mode"] == "hub"
        $driver.file_detector = lambda do |args|
            str = args.first.to_s
            str if File.exist?(str)
        end
    end
    step("I upload the file \"#{enrolmentFile}\" to \"Choose file\" which is located at \"#{arg1}\"")
end

Then(/^"PE" I log out$/) do
    step("I click on \"account page tab\" which is located at \"#tab-t0-4\"")
    step("\"PE\" I wait for loading finished")
    sleep 2
    step("I click on \"exit button\" which is located at \"ion-icon[name=exit]\"")
    step("\"PE\" I wait for loading finished")
end

Then(/^"PE" I search email with title "([^"]*)" and the student as receiver$/) do |title|
    studentAccount = $sharedData1.loadDataFromKey("studentAccount")
    step("\"Mailtrap\" I search email with title \"#{title}\" and receiver \"#{studentAccount}\"")
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with title "([^"]*)"$/) do |actLocation, actTitle|
    act = waitForElementVisibleWithInAGroup($driver, $listWait, "activities-list-page .activity-list", actLocation)
    aActTitle = act.find_element(:css => "p.activity-title")
    compareWithLog("expected activity title", actTitle, refineElementTextContent(aActTitle))
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with "([^"]*)" tick$/) do |actLocation, numOfTicks|
    act = waitForElementVisibleWithInAGroup($driver, $listWait, "activities-list-page .activity-list", actLocation)
    ticks = act.find_elements(:css => ".ticks i")
    count = 0
    ticks.each do |t|
        if t.attribute("class").index("fa-check-circle-o") != nil
            count = count + 1
        end
    end
    compareWithLog("expected activity ticks", numOfTicks, count.to_s)
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with "([^"]*)" score$/) do |actLocation, actScore|
    act = waitForElementVisibleWithInAGroup($driver, $listWait, "activities-list-page .activity-list", actLocation)
    score = "0"
    if findElementWithParent(act, "p.assessment-score i") == nil
        score = refineElementTextContent(findElementWithParent(act, "p.assessment-score .badge"))
    end
    compareWithLog("expected activity score", actScore, score)
end

Then(/^"PE" I go to "([^"]*)" activity$/) do |actLocation|
    act = waitForElementVisibleWithInAGroup($driver, $listWait, "activities-list-page .activity-list", actLocation)
    act.find_element(:css => "p.assessment-score").click()
end

Then(/^"PE" I can see "([^"]*)" submissions for "([^"]*)" activity$/) do |numOfSubmissions, actName|
    submissions = waitForElements($driver, $wait, "ion-content.activity-detail > div > .submissions > .submissions-information")
    count = 0
    if submissions != nil
        count = submissions.length
    end
    compareWithLog("expected number of submissions for activity " + actName, numOfSubmissions, count.to_s)
end

Then(/^"PE" I go to the in progress submission$/) do
    submissions = waitForElements($driver, $listWait, "ion-content.activity-detail > div > .submissions > .submissions-information")
    submissions.each do |submission|
        if "In Progress" == refineElementTextContent(submission.find_element(:css => ".submission-title h2"))
            submission.find_element(:css => ".note").click()
            break
        end
    end
end

Then(/^"PE" I can add a new submission$/) do
    step("I click on \"add new submission button\" which is located at \"ion-content.activity-detail button.add-submission\"")
    sleep 2
    step("\"PE\" I wait for loading finished")
    sleep 2
end

Then(/^"PE" I can see an assessment with title "([^"]*)"$/) do |assessmentTitle|
    assessment = waitForElementVisible($driver, $wait, "assessments-page ion-content ion-card-content.card-content")
    aAssessmentTitle = refineElementTextContent(assessment.find_element(:css => ".assessment-title"))
    compareWithLog("expected assessment title", assessmentTitle, aAssessmentTitle)
end

Then(/^"PE" I can see an assessment with title "([^"]*)" in the assessment detail page$/) do |assessmentTitle|
    aAssessmentTitle = refineElementTextContent(waitForElementVisible($driver, $wait, ".groups-question .assessments-group-text:nth-of-type(1) :nth-child(1)"))
    compareWithLog("expected assessment title", assessmentTitle, aAssessmentTitle)
end

Then(/^"PE" I can see an assessment with description "([^"]*)"$/) do |assessmentDescription|
    assessment = waitForElementVisible($driver, $wait, "assessments-page ion-content ion-card-content.card-content")
    aAssessmentDescription = refineElementTextContent(assessment.find_element(:css => ".assessment-description"))
    compareWithLog("expected assessment description", assessmentDescription, aAssessmentDescription)
end

Then("\"PE\" I can see an assessment with description {string} in the assessment detail page") do |assessmentDescription|
    aAssessmentDescription = refineElementTextContent(waitForElementVisible($driver, $wait, ".groups-question .assessments-group-text:nth-of-type(1) :nth-child(2)"))
    compareWithLog("expected assessment description", assessmentDescription, aAssessmentDescription)
end

Then(/^"PE" I can see "([^"]*)" question groups$/) do |numOfGroups|
    questionGroup = waitForElements($driver, $listWait, "assessments-page ion-content questiongroup")
    count = 0
    if questionGroup != nil
        count = questionGroup.length
    end
    compareWithLog("expected number of question group", numOfGroups, count.to_s)
end

Then(/^"PE" I can see "([^"]*)" question group with title "([^"]*)"$/) do |qpLocation, questiongroupTitle|
    qp = waitForElementVisibleWithInAGroup($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
    aQpTitle = refineElementTextContent(qp.find_element(:css => ".questionGroup .label"))
    compareWithLog("expected question group title", questiongroupTitle, aQpTitle)
end

Then("\"PE\" I can see {string} question group with description {string}") do |qpLocation, questiongroupDescription|
    qp = waitForElementVisibleWithInAGroup($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
    aQpDescription = refineElementTextContent(qp.find_element(:css => ".questionGroup .description"))
    compareWithLog("expected question description", questiongroupDescription, aQpDescription)
end

Then(/^"PE" I can go to "([^"]*)" question group$/) do |qpLocation|
    qp = waitForElementVisibleWithInAGroup($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
    qp.find_element(:css => ".questionGroup").click()
end

Then(/^"PE" I do the questions with:$/) do |table|
    data = table.raw
    rows = data.length - 1

    for i in 1..rows
        title = data[i][1]
        type = data[i][0]
        answer = data[i][2]
        step("\"PE\" I do the \"#{type}\" question which is located at \"#{i}\" with title \"#{title}\" and answer \"#{answer}\"")
    end
end

Then(/^"PE" I do the "([^"]*)" question which is located at "([^"]*)" with title "([^"]*)" and answer "([^"]*)"$/) do |type, i, title, answer|
    temp = ".groups-question div.assessments-group-text:nth-of-type(%s) :nth-child(1) :nth-child(1)" % [i]
    aTitle = refineElementTextContent(waitForElement($driver, $wait, temp))
    compareWithLog("expected question title", title, aTitle)
    if type == "oneof"
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) oneof-question" % [i]
        oneof = waitForElement($driver, $wait, temp1)
        choices  = oneof.find_elements(:css => ".choice")
        z = 1
        choices.each do |c|
            if answer == refineElementTextContent(c.find_element(:css => ":nth-child(1) ion-label"))
                temp3 = "ion-list ion-item:nth-of-type(%s) ion-radio button" % [z]
                ce = oneof.find_element(:css => temp3)
                scrollIfNotVisible($driver, ce)
                ce.click()
            end
            z = z + 1
        end
    elsif type == "text"
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) text-question" % [i]
        textQuestion = waitForElement($driver, $wait, temp1).find_element(:css => "ion-textarea.input textarea")
        scrollIfNotVisible($driver, textQuestion)
        textQuestion.send_keys(answer)
    elsif type == "file"
        currentWindow = $driver.window_handle
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) file-question" % [i]
        uploadBtn = waitForElement($driver, $wait, temp1).find_element(:css => "button.upload-button")
        scrollIfNotVisible($driver, uploadBtn)
        uploadBtn.click()
        waitForElement($driver, $wait, "#filepicker_dialog")
        sleep 3
        $driver.switch_to.frame("filepicker_dialog")
        waitForElement($driver, $wait, "section.fp__drag-and-drop button")
        sleep 2
        waitForElement($driver, $wait, "input[type='file']").send_keys(getUploadFileFullPath(answer))
        $driver.switch_to.window(currentWindow)
        step("\"PE\" I wait file uploading finished")
        sleep 2
    end
end

Then(/^"PE" I wait file uploading finished$/) do
    while waitForElement($driver, $shortWait, "#filepicker_dialog") != nil
        sleep 1
        $testLogger1.debug("file uploading")
    end
end

Then(/^"PE" I can see score "([^"]*)" on the grade field$/) do |score|
    aScore = refineElementTextContent(waitForElement($driver, $wait, ".dashboard-data > li:nth-of-type(3) .number > .badge"))
    compareWithLog("expected score", score, aScore)
end

Then(/^"PE" I go to an event "([^"]*)" page$/) do |eventName|
    events = waitForElements($driver, $listWait, "events-list-page ion-list event")
    position = 1
    events.each do |event|
        if eventName == refineElementTextContent(event.find_element(:css => "ion-card > ion-list > .title"))
            break
        end
        position = position + 1
    end
    if position > events.length
        fail("we can not find the event %s" % [eventName])
    end
    script = "var t = document.querySelector('%s:nth-of-type(%s) ion-card > ion-list').style['background-image'].split('cdn.filestackcontent.com/')[1]; return t.slice(0,-2);" % ["events-list-page ion-list event", position]
    eventIdentifier = $driver.execute_script(script)
    $sharedData1.putData("eventIdentifier", eventIdentifier)
    events[position - 1].find_element(:css => "ion-card").click()
    sleep 5
end

Then(/^"PE" I go to the event page$/) do
    event = $sharedData1.loadDataFromKey("currentEvent")
    step("\"PE\" I go to an event \"#{event}\" page")
end

Then(/^"PE" I check an event "([^"]*)" is still here$/) do |eventName|
    events = waitForElements($driver, $listWait, "events-list-page ion-list event")
    position = 1
    events.each do |event|
        if eventName == refineElementTextContent(event.find_element(:css => "ion-card > ion-list > .title"))
            break
        end
        position = position + 1
    end
    if position > events.length
        fail("we can not find the event %s" % [eventName])
    end
    script = "var t = document.querySelector('%s:nth-of-type(%s) ion-card > ion-list').style['background-image'].split('cdn.filestackcontent.com/')[1]; return t.slice(0,-2);" % ["events-list-page ion-list event", position]
    eventIdentifier = $driver.execute_script(script)
    pEventIdentifier = $sharedData1.loadDataFromKey("eventIdentifier")
    if eventIdentifier != pEventIdentifier
        fail("the event %s is not here" % [eventName])
    end
end

Then(/^"PE" I check the event is still here$/) do
    event = $sharedData1.loadDataFromKey("currentEvent")
    step("\"PE\" I check an event \"#{event}\" is still here")
end

Then(/^"PE" I can see the event check in button being not disabled$/) do
    checkinBtn = waitForElement($driver, $wait ,".footer button.checkin-btn")
    if checkinBtn.attribute("disabled")
        fail("the event check in button being disabled")
    end
end

Then(/^"PE" I check that the spin chances on the page should equal to the number on the tab$/) do
    tabSpinChance = refineElementTextContent(waitForElement($driver, $wait, "#tab-t0-3 ion-badge")).to_i
    spinChances = refineElementTextContent(waitForElement($driver, $wait, "#spinChances")).to_i
    if tabSpinChance != spinChances
        fail("the spin chances on the page does not equal to the number on the tab")
    end
    $sharedData1.putData("spinChances", spinChances)
end

Then(/^"PE" I click on the spinner wheel$/) do
    previousEP = refineElementTextContent(waitForElement($driver, $wait, "#spinEP")).to_i

    step("I click on \"the wheel\" which is located at \"canvas#spinwheel\"")
    step("I should be able to see \"a pop up\" which is located at \"ion-alert[role=dialog]\"")
    step("I should be able to see \"Congratulations\" which is located at \"//ion-alert[@role='dialog']//h2[@class='alert-title'][text()='Congratulations']\" with xpath assert")
    
    spinChances = $sharedData1.loadDataFromKey("spinChances")
    aSpinChances = refineElementTextContent(waitForElement($driver, $wait, "#spinChances")).to_i
    tabSpinChance = refineElementTextContent(waitForElement($driver, $wait, "#tab-t0-3 ion-badge")).to_i
    compareWithLog("expected spin chance decrement", "1", (spinChances - aSpinChances).to_s)
    compareWithLog("expected spin chance", aSpinChances.to_s, tabSpinChance.to_s)
    message = refineElementTextContent(waitForElement($driver, $wait, "ion-alert[role=dialog] .alert-sub-title"))
    sleep(1)
    $driver.execute_script("document.querySelector('ion-alert[role=dialog] ion-backdrop').click();")
    sleep(2)
    incrementedEP = /\s+[1-9][0-9]*\s+/.match(message)[0].strip()
    spinEP = refineElementTextContent(waitForElement($driver, $wait, "#spinEP")).to_i
    compareWithLog("expected incremented points", incrementedEP, (spinEP - previousEP).to_s)
    $sharedData1.putData("spinEP", spinEP)
end

Then(/^"PE" I check that the points on the dashboard equal to points on the spinner page$/) do
    waitForElement($driver, $wait, "#tab-t0-0").click()
    step("\"PE\" I wait for loading finished")
    step("I should be able to see \"activity list page\" which is located at \"activities-list-page\"")
    spinEP = $sharedData1.loadDataFromKey("spinEP")
    points = refineElementTextContent(waitForElement($driver, $wait, ".dashboard-data > li:nth-of-type(2) .number")).to_i
    if spinEP != points
        fail("points on the dashboard does not equal to points on the spinner page")
    end
end