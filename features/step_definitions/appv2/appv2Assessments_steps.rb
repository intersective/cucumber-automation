

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

Then(/^"Appv2" I can see ([1-9]+[0-9]*) question group name "([^"]*)" and description "([^"]*)"$/) do |qgindex, qgname, qgdes|
    aqgname = refineElementTextContent(waitForElementXpath($driver, $wait, "(//app-assessment//form/h3)[#{qgindex}]"))
    aqgdes = refineElementTextContent(waitForElementXpath($driver, $wait, "(//app-assessment//form/h3/following-sibling::ion-text/app-description)[#{qgindex}]"))
    verifyValue("expected question group name", qgname, aqgname)
    verifyValue("expected question group description", qgdes, aqgdes)
end

Then(/^"Appv2" I can see ([1-9]+[0-9]*) question name "([^"]*)" and description "([^"]*)"$/) do |qindex, qname, qdes|
    aqheaders = waitForElementXpath($driver, $wait, "(//app-assessment//ion-card/ion-card-header)[#{qindex}]").attribute("innerText").split("\n")
    aqname = aqheaders[0].strip()
    aqdes = aqheaders[1].strip()
    verifyValue("expected question name", qname, aqname)
    verifyValue("expected question description", qdes, aqdes)
end

Then(/^"Appv2" I answer "([^"]*)" for ([1-9]+[0-9]*) question with question type "([^"]*)"$/) do |answer, qindex, qtype|
    case qtype
        when "text"
            answerContainer = waitForElementXpath($driver, $wait, "(//app-assessment//ion-card//ion-textarea)[#{qindex}]")
            scrollIfNotVisible($driver, answerContainer)
            focusElement(answerContainer)
            answerContainer.send_keys(answer)
        else
            nswerContainer = waitForElementXpath($driver, $wait, "(//app-assessment//ion-card//ion-textarea)[#{qindex}]")
            scrollIfNotVisible($driver, answerContainer)
            focusElement(answerContainer)
            answerContainer.send_keys(answer)
    end
end
