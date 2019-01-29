

Then(/^"Appv2" I wait for loading finished$/) do
    elements = waitForElements($driver, $shortWait, "ion-spinner")
    while elements != nil && elements.length > 0
        sleep 1
        elements = waitForElements($driver, $shortWait, "ion-spinner")
    end
    sleep 1
end

Then(/^"Appv2" I choose a program "([^"]*)"$/) do |programName|
    sleep 2
    waitForElementVisibleXpath($driver, $wait, "//ion-card[normalize-space()='#{programName}']").click()
    sleep 3
end

Then(/^"Appv2" I go to the "([^"]*)" tab page$/) do |tabName|
	tabLocator = "//ion-tab-button[normalize-space()='#{tabName}']"
	waitForElementVisibleXpath($driver, $wait, tabLocator).click()
    step("\"Appv2\" I wait for loading finished")
end

Then("\"Appv2\" I go to the {string} activity") do |activityTitle|
    contentPage = waitForElement($driver, $wait, "app-project ion-content > ion-list")
    actLocator = "//app-project//app-activity-card//*[@class='activity-name'][normalize-space()='#{activityTitle}']"
    act = waitForElementXpath($driver, $wait, actLocator)
    scrollIfNotVisibleByKeyBoard($driver, contentPage, act)
    act.click()
    step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refineElementTextContent(waitForElement($driver, $wait, "app-activity ion-content h1"))
	aActDescription = refineElementTextContent(waitForElement($driver, $wait, "app-activity ion-content app-description"))
	verifyValue("expected activity name", actName, aActName)
	verifyValue("expected activity description", actDescription, aActDescription)
end
