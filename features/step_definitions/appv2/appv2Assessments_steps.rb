

Then(/^"Appv2" I go to the (topic|assessment) "([^"]*)"$/) do |itemCategory, itemName|
    itemLocator = "//ion-item//*[@class='icon-item']/h4[normalize-space()='#{itemName}']/../.."
    wait_for_element_xpath($driver, $wait, itemLocator).click()
end


Then(/^"Appv2" I go back from (topic|assessment) page$/) do |itemName|
    backBtnLocator = "app-%s ion-icon[name='arrow-back']" % [itemName]
	wait_for_element_visible($driver, $wait, backBtnLocator).click()
end

Then(/^"Appv2" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
    aitem = wait_for_element_xpath($driver, $wait, "//ion-item//*[@class='icon-item']/h4[normalize-space()='#{itemName}']/..//ion-text")
    aitemStatus = refine_element_text_content(aitem)
	verify_value("expected item status", itemStatus, aitemStatus)
end

Then(/^"Appv2" I can see the assessment with name "([^"]*)" and description "([^"]*)"$/) do |assessmentTitle, assessmentDescription|
	aAssessmenTitle = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-content/h1"))
	aAssessmenDescription = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//app-description"))
	verify_value("expected assessment title", assessmentTitle, aAssessmenTitle)
	verify_value("expected assessment description", assessmentDescription, aAssessmenDescription)
end

Then(/^"Appv2" I can see question group ([1-9]+[0-9]*) name "([^"]*)" and description "([^"]*)"$/) do |qgindex, qgname, qgdes|
    aqgname = refine_element_text_content(wait_for_element_xpath($driver, $wait, "(//app-assessment//form/h3)[#{qgindex}]"))
    aqgdes = refine_element_text_content(wait_for_element_xpath($driver, $wait, "(//app-assessment//form/h3/following-sibling::ion-text/app-description)[#{qgindex}]"))
    verify_value("expected question group name", qgname, aqgname)
    verify_value("expected question group description", qgdes, aqgdes)
end

Then(/^"Appv2" I can see question ([1-9]+[0-9]*) name "([^"]*)" and description "([^"]*)"$/) do |qindex, qname, qdes|
    aqheaders = wait_for_element_xpath($driver, $wait, "(//app-assessment//ion-card/ion-card-header)[#{qindex}]").attribute("innerText").split("\n")
    aqname = aqheaders[0].strip()
    aqdes = (aqheaders[1] == nil)? "" : aqheaders[1].strip()
    verify_value("expected question name", qname, aqname)
    verify_value("expected question description", qdes, aqdes)
end

Then(/^"Appv2" I click the question ([1-9]+[0-9]*) choices descriptions button$/) do |qindex|
    contentPage = wait_for_element($driver, $wait, "app-assessment ion-content")
    btn = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]/ion-card-header/ion-icon")
    scroll_by_keyboard_if_not_visible($driver, contentPage, btn)
    btn.click()
end

Then(/^"Appv2" I can see the question ([1-9]+[0-9]*) choices descriptions with:$/) do |qindex, table|
    contentPage = wait_for_element($driver, $wait, "app-pop-up ion-content")
    choicesDes = wait_for_elements($driver, $wait, "app-pop-up p")
    data = table.raw
    rows = data.length - 1

    for i in 0..rows
        verify_value("expected question choice descriptions", data[i][0], refine_element_text_content(choicesDes[i + 1]))
    end

    btn = wait_for_element($driver, $wait, "app-pop-up ion-button")
    scroll_by_keyboard_if_not_visible($driver, contentPage, btn)
    btn.click()
    sleep 3
end

Then(/^"Appv2" I answer "([^"]*)" for question ([1-9]+[0-9]*) with question type "([^"]*)"$/) do |answer, qindex, qtype|
    contentPage = wait_for_element($driver, $wait, "app-assessment ion-content")
    case qtype
        when Application.KEY_Q_TEXT
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea/textarea")
            scroll_by_keyboard_if_not_visible($driver, contentPage, answerContainer)
            answerContainer.send_keys(answer)
        when Application.KEY_Q_MULT
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//app-oneof//ion-item[normalize-space()='#{answer}'][not(@color='light')]/.")
            scroll_by_keyboard_if_not_visible($driver, contentPage, answerContainer)
            answerContainer.click()
        when Application.KEY_Q_CHECKBOX
            ans = answer.split(",")
            ans.each do |a|
                answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//app-multiple//ion-item[normalize-space()='#{a}'][not(@color='light')]/ion-checkbox")
                scroll_by_keyboard_if_not_visible($driver, contentPage, answerContainer)
                answerContainer.click()
            end
        when Application.KEY_Q_FILE
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-button")
            scroll_by_keyboard_if_not_visible($driver, contentPage, answerContainer)
            answerContainer.click()
            sleep 3
            wait_for_element($driver, $wait, "#fsp-fileUpload").send_keys(get_upload_file_full_path(answer))
            sleep 1
            wait_for_element($driver, $wait, ".fsp-picker span[title='Upload']").click()
            sleep 1
            while wait_for_element($driver, $shortWait, ".fsp-picker") != nil
                sleep 1
            end
            sleep 3
        else
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea/textarea")
            scroll_by_keyboard_if_not_visible($driver, contentPage, answerContainer)
            answerContainer.send_keys(answer)
    end
end

Then(/^"Appv2" I submit the (assessment|review)$/) do |type|
    contentPage = wait_for_element($driver, $wait, "app-assessment ion-content")
    ele = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-button[normalize-space()='Submit']")
    scroll_by_keyboard_if_not_visible($driver, contentPage, ele)
    ele.click()
end

Then(/^"Appv2" I can see the submisison success messages$/) do
    ele = wait_for_element_xpath($driver, $wait, "//ion-alert//*[normalize-space()='Submission Successful!']")
    if ele == nil
        verify_value("expected submission success", "Submitted Successful!", "nil")
    else
        sleep 3
        wait_for_element_xpath($driver, $wait, "//ion-alert//button[normalize-space()='OK']").click()
    end
end

Then(/^"Appv2" I can see the fast feedback questions$/) do
    ele = wait_for_element($driver, $wait, "app-fast-feedback")
    if ele == nil
        verify_value("expected fast feedback", "fast feedback", "nil")
    else
        sleep 5
    end
end

Then(/^"Appv2" I can see the fast feedback question ([1-9]+[0-9]*) with title "([^"]*)" and description "([^"]*)"$/) do |qindex, fftitle, ffdes|
    ffheaders = wait_for_element_xpath($driver, $wait, "//app-fast-feedback//question[#{qindex}]//ion-card-header").attribute("innerText").split("\n")
    afftitle = ffheaders[0].strip()
    affdes = ffheaders[1].strip()
    verify_value("expected fast feedback question name", fftitle, afftitle)
    verify_value("expected fast feedback question description", ffdes, affdes)
end

Then(/"Appv2" I answer "([^"]*)" for the fast feedback question "([^"]*)"$/) do |answer, qindex|
    choice = wait_for_element_xpath($driver, $wait, "//app-fast-feedback//question[#{qindex}]//ion-item[normalize-space()='#{answer}']")
    contentPage = wait_for_element($driver, $wait, "app-fast-feedback ion-content")
    scroll_by_keyboard_if_not_visible($driver, contentPage, choice)
    choice.click()
end

Then(/^"Appv2" I submit the fast feedback$/) do
    submitBtn = wait_for_element_xpath($driver, $wait, "//app-fast-feedback//ion-button[normalize-space()='Submit']")
    contentPage = wait_for_element($driver, $wait, "app-fast-feedback ion-content")
    scroll_by_keyboard_if_not_visible($driver, contentPage, submitBtn)
    submitBtn.click()
    wait_for_element_xpath($driver, $wait, "//ion-alert//button").click()
    sleep 5
end

Then(/^"Appv2" I can see the answer "([^"]*)" for question ([1-9]+[0-9]*) with question type "([^"]*)"$/) do |answer, qindex, qtype|
    aaswer = ""
    case qtype
        when Application.KEY_Q_TEXT
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]/ion-card-content/app-text/ion-text")
            aaswer = refine_element_text_content(answerContainer)
        when Application.KEY_Q_MULT
            answerContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]/ion-card-content/app-oneof//ion-item[contains(@class, 'item-radio-checked')]")
            aaswer = refine_element_text_content(answerContainer)
        when Application.KEY_Q_CHECKBOX
            temp = []
            answerContainer = wait_for_elements_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]/ion-card-content/app-multiple//ion-item[contains(@class, 'item-checkbox-checked')]")
            answerContainer.each do |value|
                temp.push(refine_element_text_content(value))
            end
            aaswer = temp.join(",")
    end
    verify_value("expected answers", answer, aaswer)
end