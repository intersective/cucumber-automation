

Then(/^"PE" I login with username "([^"]*)" and password "([^"]*)"$/) do |username, userPassword|
    u = extract_parameter(username, username)
    p = extract_parameter(userPassword, userPassword)
    step("I can see \"login form\" which is located at \"form.general-form\"")
	step("I input \"#{u}\" to \"email input box\" which is located at \"form.general-form ion-input[name=email] input\"")
    step("I input \"#{p}\" to \"email input box\" which is located at \"form.general-form ion-input[name=password] input\"")
    step("I click on \"login button\" which is located at \"form.general-form > button\"")
end

Then(/^"PE" I login with the student(|[1-9]+[0-9]*) and password "([^"]*)"$/) do |arg1, userPassword|
    studentAccount = get_user_from_data(arg1, Application.KEY_ROLE_STUDENT).account
    step("\"PE\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"PE" I wait for loading finished$/) do
    step("The \"loading dialog\" which is located at \"ion-loading\" should be disappear")
    clickBlock = wait_for_element($driver, $normalWait, ".click-block")
	if clickBlock != nil
		while clickBlock.attribute("class").index("click-block-active") != nil
			sleep 1
			clickBlock = wait_for_element($driver, $shortWait, ".click-block")
		end
	end
end

Then(/^"PE" I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
    studentId = generate_uni_id()
	studentName = "selenium.%s" % [studentId]
    studentAccount = "%s@practera.com" % [studentName]
    csvtext = "\n%s,%s,%s,fullaccess" % [studentAccount, studentId, studentName]
    enrolmentFile = Dir.pwd + '/data/sandbox-pe-participant.csv'
    File.open(enrolmentFile, File::WRONLY | File::APPEND) do |f|
        f.write(csvtext)
    end
    students = {}
    students["1"] = $userService1.create(studentId, studentName, studentAccount, "")
    $sharedData1.put_data(Application.KEY_STUDENTS, students)
    step("I upload the file \"#{enrolmentFile}\" to \"Choose file\" which is located at \"#{arg1}\"")
end

Then(/^"PE" I log out$/) do
    step("I click on \"account page tab\" which is located at \"#tab-t0-4\"")
    step("\"PE\" I wait for loading finished")
    sleep 2
    step("I click on \"exit button\" which is located at \"ion-icon[name=exit]\"")
    step("\"PE\" I wait for loading finished")
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with title "([^"]*)"$/) do |actLocation, actTitle|
    act = wait_for_element_visible_withIn_a_group($driver, $listWait, "activities-list-page .activity-list", actLocation)
    aActTitle = act.find_element(:css => "p.activity-title")
    verify_value("expected activity title", actTitle, refine_element_text_content(aActTitle))
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with "([^"]*)" tick$/) do |actLocation, numOfTicks|
    act = wait_for_element_visible_withIn_a_group($driver, $listWait, "activities-list-page .activity-list", actLocation)
    ticks = act.find_elements(:css => ".ticks i")
    count = 0
    ticks.each do |t|
        if t.attribute("class").index("fa-check-circle-o") != nil
            count = count + 1
        end
    end
    verify_value("expected activity ticks", numOfTicks, count.to_s)
end

Then(/^"PE" I can see an activity locating at "([^"]*)" position with "([^"]*)" score$/) do |actLocation, actScore|
    act = wait_for_element_visible_withIn_a_group($driver, $listWait, "activities-list-page .activity-list", actLocation)
    score = "0"
    if find_element_with_parent(act, "p.assessment-score i") == nil
        score = refine_element_text_content(find_element_with_parent(act, "p.assessment-score .badge"))
    end
    verify_value("expected activity score", actScore, score)
end

Then(/^"PE" I go to "([^"]*)" activity$/) do |actLocation|
    act = wait_for_element_visible_withIn_a_group($driver, $listWait, "activities-list-page .activity-list", actLocation)
    act.find_element(:css => "p.assessment-score").click()
end

Then(/^"PE" I can see "([^"]*)" submissions for "([^"]*)" activity$/) do |numOfSubmissions, actName|
    submissions = wait_for_elements($driver, $wait, "ion-content.activity-detail > div > .submissions > .submissions-information")
    count = 0
    if submissions != nil
        count = submissions.length
    end
    verify_value("expected number of submissions for activity " + actName, numOfSubmissions, count.to_s)
end

Then(/^"PE" I go to the in progress submission$/) do
    submissions = wait_for_elements($driver, $listWait, "ion-content.activity-detail > div > .submissions > .submissions-information")
    submissions.each do |submission|
        if "In Progress" == refine_element_text_content(submission.find_element(:css => ".submission-title h2"))
            submission.find_element(:css => ".note").click()
            break
        end
    end
end

Then(/^"PE" I can add a new submission$/) do
    step("I click on \"add new submission button\" which is located at \"ion-header.activity-detail button.add-submission\"")
    sleep 2
    step("\"PE\" I wait for loading finished")
    sleep 2
end

Then(/^"PE" I can see an assessment with title "([^"]*)"$/) do |assessmentTitle|
    assessment = wait_for_element_visible($driver, $wait, "assessments-page ion-content ion-card-content.card-content")
    aAssessmentTitle = refine_element_text_content(assessment.find_element(:css => ".assessment-title"))
    verify_value("expected assessment title", assessmentTitle, aAssessmentTitle)
end

Then(/^"PE" I can see an assessment with title "([^"]*)" in the assessment detail page$/) do |assessmentTitle|
    aAssessmentTitle = refine_element_text_content(wait_for_element_visible($driver, $wait, ".groups-question .assessments-group-text:nth-of-type(1) :nth-child(1)"))
    verify_value("expected assessment title", assessmentTitle, aAssessmentTitle)
end

Then(/^"PE" I can see an assessment with description "([^"]*)"$/) do |assessmentDescription|
    assessment = wait_for_element_visible($driver, $wait, "assessments-page ion-content ion-card-content.card-content")
    aAssessmentDescription = refine_element_text_content(assessment.find_element(:css => ".assessment-description"))
    verify_value("expected assessment description", assessmentDescription, aAssessmentDescription)
end

Then("\"PE\" I can see an assessment with description {string} in the assessment detail page") do |assessmentDescription|
    aAssessmentDescription = refine_element_text_content(wait_for_element_visible($driver, $wait, ".groups-question .assessments-group-text:nth-of-type(1) :nth-child(2)"))
    verify_value("expected assessment description", assessmentDescription, aAssessmentDescription)
end

Then(/^"PE" I can see "([^"]*)" question groups$/) do |numOfGroups|
    questionGroup = wait_for_elements($driver, $listWait, "assessments-page ion-content questiongroup")
    count = 0
    if questionGroup != nil
        count = questionGroup.length
    end
    verify_value("expected number of question group", numOfGroups, count.to_s)
end

Then(/^"PE" I can see "([^"]*)" question group with title "([^"]*)"$/) do |qpLocation, questiongroupTitle|
    qp = wait_for_element_visible_withIn_a_group($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
    aQpTitle = refine_element_text_content(qp.find_element(:css => ".questionGroup .label"))
    verify_value("expected question group title", questiongroupTitle, aQpTitle)
end

Then("\"PE\" I can see {string} question group with description {string}") do |qpLocation, questiongroupDescription|
    qp = wait_for_element_visible_withIn_a_group($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
    aQpDescription = refine_element_text_content(qp.find_element(:css => ".questionGroup .description"))
    verify_value("expected question description", questiongroupDescription, aQpDescription)
end

Then(/^"PE" I can go to "([^"]*)" question group$/) do |qpLocation|
    qp = wait_for_element_visible_withIn_a_group($driver, $listWait, "assessments-page ion-content questiongroup", qpLocation)
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
    aTitle = refine_element_text_content(wait_for_element($driver, $wait, temp))
    verify_value("expected question title", title, aTitle)
    if type == Application.KEY_Q_ONEOF
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) oneof-question" % [i]
        oneof = wait_for_element($driver, $wait, temp1)
        choices  = oneof.find_elements(:css => ".choice")
        z = 1
        choices.each do |c|
            if answer == refine_element_text_content(c.find_element(:css => ":nth-child(1) ion-label"))
                temp3 = "ion-list ion-item:nth-of-type(%s) ion-radio button" % [z]
                ce = oneof.find_element(:css => temp3)
                scroll_if_not_visible($driver, ce)
                ce.click()
            end
            z = z + 1
        end
    elsif type == Application.KEY_Q_TEXT
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) text-question" % [i]
        textQuestion = wait_for_element($driver, $wait, temp1).find_element(:css => "ion-textarea.input textarea")
        scroll_if_not_visible($driver, textQuestion)
        textQuestion.send_keys(answer)
    elsif type == Application.KEY_Q_FILE
        currentWindow = $driver.window_handle
        temp1 = ".groups-question div.assessments-group-text:nth-of-type(%s) file-question" % [i]
        uploadBtn = wait_for_element($driver, $wait, temp1).find_element(:css => "button.upload-button")
        scroll_if_not_visible($driver, uploadBtn)
        uploadBtn.click()
        wait_for_element($driver, $wait, "#filepicker_dialog")
        sleep 3
        $driver.switch_to.frame("filepicker_dialog")
        wait_for_element($driver, $wait, "section.fp__drag-and-drop button")
        sleep 2
        wait_for_element($driver, $wait, "input[type='file']").send_keys(get_upload_file_full_path(answer))
        $driver.switch_to.window(currentWindow)
        step("\"PE\" I wait file uploading finished")
        sleep 2
    end
end

Then(/^"PE" I wait file uploading finished$/) do
    while wait_for_element($driver, $shortWait, "#filepicker_dialog") != nil
        sleep 1
        $testLogger1.debug("file uploading")
    end
end

Then(/^"PE" I can see score "([^"]*)" on the grade field$/) do |score|
    aScore = refine_element_text_content(wait_for_element($driver, $wait, ".dashboard-data > li:nth-of-type(3) .number > .badge"))
    verify_value("expected score", score, aScore)
end

Then(/^"PE" I go to an event "([^"]*)" page$/) do |eventName|
    events = wait_for_elements($driver, $listWait, "events-list-page ion-list event")
    position = 1
    events.each do |event|
        if eventName == refine_element_text_content(event.find_element(:css => "ion-card > ion-list > .title"))
            break
        end
        position = position + 1
    end
    if position > events.length
        fail("we can not find the event %s" % [eventName])
    end
    script = "var t = document.querySelector('%s:nth-of-type(%s) ion-card > ion-list').style['background-image'].split('cdn.filestackcontent.com/')[1]; return t.slice(0,-2);" % ["events-list-page ion-list event", position]
    eventIdentifier = $driver.execute_script(script)
    $sharedData1.put_data(Application.KEY_EVENTIDENTIFIER, eventIdentifier)
    events[position - 1].find_element(:css => "ion-card").click()
    sleep 5
end

Then(/^"PE" I go to the event page$/) do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"PE\" I go to an event \"#{eventName}\" page")
end

Then(/^"PE" I check an event "([^"]*)" is still here$/) do |eventName|
    events = wait_for_elements($driver, $listWait, "events-list-page ion-list event")
    position = 1
    events.each do |event|
        if eventName == refine_element_text_content(event.find_element(:css => "ion-card > ion-list > .title"))
            break
        end
        position = position + 1
    end
    if position > events.length
        fail("we can not find the event %s" % [eventName])
    end
    script = "var t = document.querySelector('%s:nth-of-type(%s) ion-card > ion-list').style['background-image'].split('cdn.filestackcontent.com/')[1]; return t.slice(0,-2);" % ["events-list-page ion-list event", position]
    eventIdentifier = $driver.execute_script(script)
    pEventIdentifier = load_shared_data(Application.KEY_EVENTIDENTIFIER)
    if eventIdentifier != pEventIdentifier
        fail("the event %s is not here" % [eventName])
    end
end

Then(/^"PE" I check the event is still here$/) do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"PE\" I check an event \"#{eventName}\" is still here")
end

Then(/^"PE" I can see the event check in button being not disabled$/) do
    checkinBtn = wait_for_element($driver, $wait ,".footer button.checkin-btn")
    if checkinBtn.attribute("disabled")
        fail("the event check in button being disabled")
    end
end

Then(/^"PE" I check that the spin chances on the page should equal to the number on the tab$/) do
    tabSpinChance = refine_element_text_content(wait_for_element($driver, $wait, "#tab-t0-3 ion-badge")).to_i
    spinChances = refine_element_text_content(wait_for_element($driver, $wait, "#spinChances")).to_i
    if tabSpinChance != spinChances
        fail("the spin chances on the page does not equal to the number on the tab")
    end
    $sharedData1.put_data(Application.KEY_SPINCHANCES, spinChances)
end

Then(/^"PE" I click on the spinner wheel$/) do
    previousEP = refine_element_text_content(wait_for_element($driver, $wait, "#spinEP")).to_i

    step("I click on \"the wheel\" which is located at \"canvas#spinwheel\"")
    step("I can see \"a pop up\" which is located at \"ion-alert[role=dialog]\"")
    step("I should see \"Congratulations\" which is located at \"//ion-alert[@role='dialog']//h2[@class='alert-title'][text()='Congratulations']\" with xpath")
    
    spinChances = load_shared_data(Application.KEY_SPINCHANCES)
    aSpinChances = refine_element_text_content(wait_for_element($driver, $wait, "#spinChances")).to_i
    tabSpinChance = refine_element_text_content(wait_for_element($driver, $wait, "#tab-t0-3 ion-badge")).to_i
    verify_value("expected spin chance decrement", "1", (spinChances - aSpinChances).to_s)
    verify_value("expected spin chance", aSpinChances.to_s, tabSpinChance.to_s)
    message = refine_element_text_content(wait_for_element($driver, $wait, "ion-alert[role=dialog] .alert-sub-title"))
    sleep(1)
    $driver.execute_script("document.querySelector('ion-alert[role=dialog] ion-backdrop').click();")
    sleep(2)
    incrementedEP = /\s+[1-9][0-9]*\s+/.match(message)[0].strip()
    spinEP = refine_element_text_content(wait_for_element($driver, $wait, "#spinEP")).to_i
    verify_value("expected incremented points", incrementedEP, (spinEP - previousEP).to_s)
    $sharedData1.put_data(Application.KEY_SPINEP, spinEP)
end

Then(/^"PE" I check that the points on the dashboard equal to points on the spinner page$/) do
    wait_for_element($driver, $wait, "#tab-t0-0").click()
    step("\"PE\" I wait for loading finished")
    step("I can see \"activity list page\" which is located at \"activities-list-page\"")
    spinEP = load_shared_data(Application.KEY_SPINEP)
    points = refine_element_text_content(wait_for_element($driver, $wait, ".dashboard-data > li:nth-of-type(2) .number")).to_i
    if spinEP != points
        fail("points on the dashboard does not equal to points on the spinner page")
    end
end