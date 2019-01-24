

Then(/^"Appv2" I go to the (topic|assessment) "([^"]*)"$/) do |itemCategory, itemName|
    itemLocator = "//ion-item//*[@class='icon-item']/h4[normalize-space()='#{itemName}']"
    waitForElementVisibleXpath($driver, $wait, itemLocator).click()
end


Then(/^"Appv2" I go back from (topic|assessment) page$/) do |itemName|
    backBtnLocator = "app-%s ion-icon[name='arrow-back']" % [itemName]
	waitForElementVisible($driver, $wait, backBtnLocator).click()
end

Then(/^"Appv2" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
    aitem = waitForElementXpath($driver, $wait, "//ion-item//*[@class='icon-item']/h4[normalize-space()='#{itemName}']/..//ion-text")
    aitemStatus = refineElementTextContent(aitem)
	verifyValue("expected item status", itemStatus, aitemStatus)
end

Then(/^"Appv2" I can see the assessment with name "([^"]*)" and description "([^"]*)"$/) do |assessmentTitle, assessmentDescription|
	aAssessmenTitle = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-content/h1"))
	aAssessmenDescription = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//app-description"))
	verifyValue("expected assessment title", assessmentTitle, aAssessmenTitle)
	verifyValue("expected assessment description", assessmentDescription, aAssessmenDescription)
end

Then(/^"Appv2" I can see question group ([1-9]+[0-9]*) name "([^"]*)" and description "([^"]*)"$/) do |qgindex, qgname, qgdes|
    aqgname = refineElementTextContent(waitForElementXpath($driver, $wait, "(//app-assessment//form/h3)[#{qgindex}]"))
    aqgdes = refineElementTextContent(waitForElementXpath($driver, $wait, "(//app-assessment//form/h3/following-sibling::ion-text/app-description)[#{qgindex}]"))
    verifyValue("expected question group name", qgname, aqgname)
    verifyValue("expected question group description", qgdes, aqgdes)
end

Then(/^"Appv2" I can see question ([1-9]+[0-9]*) name "([^"]*)" and description "([^"]*)"$/) do |qindex, qname, qdes|
    aqheaders = waitForElementXpath($driver, $wait, "(//app-assessment//ion-card/ion-card-header)[#{qindex}]").attribute("innerText").split("\n")
    aqname = aqheaders[0].strip()
    aqdes = (aqheaders[1] == nil)? "" : aqheaders[1].strip()
    verifyValue("expected question name", qname, aqname)
    verifyValue("expected question description", qdes, aqdes)
end

Then(/^"Appv2" I answer "([^"]*)" for question ([1-9]+[0-9]*) with question type "([^"]*)"$/) do |answer, qindex, qtype|
    contentPage = waitForElement($driver, $wait, "app-assessment ion-content")
    case qtype
        when "text"
            answerContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea")
            scrollIfNotVisibleByKeyBoard($driver, contentPage, answerContainer)
            focusElement(answerContainer)
            answerContainer.send_keys(answer)
        when "multiple choice"
            answerContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//app-oneof//ion-item[normalize-space()='#{answer}']/.")
            scrollIfNotVisibleByKeyBoard($driver, contentPage, answerContainer)
            answerContainer.click()
        when "checkbox"
            ans = answer.split(",")
            ans.each do |a|
                answerContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//app-multiple//ion-item[normalize-space()='#{a}']/ion-checkbox")
                scrollIfNotVisibleByKeyBoard($driver, contentPage, answerContainer)
                answerContainer.click()
            end
        when "file"
            answerContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-button")
            scrollIfNotVisibleByKeyBoard($driver, contentPage, answerContainer)
            answerContainer.click()
            sleep 3
            waitForElement($driver, $wait, "#fsp-fileUpload").send_keys(getUploadFileFullPath(answer))
            sleep 1
            waitForElement($driver, $wait, ".fsp-picker span[title='Upload']").click()
            sleep 1
            while waitForElement($driver, $shortWait, ".fsp-picker") != nil
                sleep 1
            end
            sleep 3
        else
            answerContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea")
            scrollIfNotVisibleByKeyBoard($driver, contentPage, answerContainer)
            focusElement(answerContainer)
            answerContainer.send_keys(answer)
    end
end

Then(/^"Appv2" I submit the assessment$/) do
    contentPage = waitForElement($driver, $wait, "app-assessment ion-content")
    ele = waitForElementXpath($driver, $wait, "//app-assessment//ion-button[normalize-space()='Submit']")
    scrollIfNotVisibleByKeyBoard($driver, contentPage, ele)
    ele.click()
end

Then(/^"Appv2" I can see the submisison success messages$/) do
    ele = waitForElementXpath($driver, $wait, "//ion-alert//*[normalize-space()='Submission Successful!']")
    if ele == nil
        verifyValue("expected submission success", "Submitted Successful!", "nil")
    else
        waitForElementXpath($driver, $wait, "//ion-alert//button[normalize-space()='OK']").click()
    end
end

Then(/^"Appv2" I can see the fast feedback questions$/) do
    ele = waitForElement($driver, $wait, "app-fast-feedback")
    if ele == nil
        verifyValue("expected fast feedback", "fast feedback", "nil")
    else
        sleep 5
    end
end

Then(/^"Appv2" I can see the fast feedback question ([1-9]+[0-9]*) with title "([^"]*)" and description "([^"]*)"$/) do |qindex, fftitle, ffdes|
    ffheaders = waitForElementXpath($driver, $wait, "//app-fast-feedback//question[#{qindex}]//ion-card-header").attribute("innerText").split("\n")
    afftitle = ffheaders[0].strip()
    affdes = ffheaders[1].strip()
    verifyValue("expected fast feedback question name", fftitle, afftitle)
    verifyValue("expected fast feedback question description", ffdes, affdes)
end

Then(/"Appv2" I answer "([^"]*)" for the fast feedback question "([^"]*)"$/) do |answer, qindex|
    choice = waitForElementXpath($driver, $wait, "//app-fast-feedback//question[#{qindex}]//ion-item[normalize-space()='#{answer}']")
    contentPage = waitForElement($driver, $wait, "app-fast-feedback ion-content")
    scrollIfNotVisibleByKeyBoard($driver, contentPage, choice)
    choice.click()
end

Then(/^"Appv2" I submit the fast feedback$/) do
    submitBtn = waitForElementXpath($driver, $wait, "//app-fast-feedback//ion-button[normalize-space()='Submit']")
    contentPage = waitForElement($driver, $wait, "app-fast-feedback ion-content")
    scrollIfNotVisibleByKeyBoard($driver, contentPage, submitBtn)
    submitBtn.click()
    waitForElementXpath($driver, $wait, "//ion-alert//button").click()
    sleep 5
end