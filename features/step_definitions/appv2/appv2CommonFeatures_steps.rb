

Then(/^"Appv2" I wait for loading finished$/) do
    elements = wait_for_elements($driver, $shortWait, "ion-spinner")
    while elements != nil && elements.length > 0
        sleep 1
        elements = wait_for_elements($driver, $shortWait, "ion-spinner")
    end
    sleep 1
end

Then(/^"Appv2" I choose a program "([^"]*)"$/) do |programName|
    sleep 2
    wait_for_element_visible_xpath($driver, $wait, "//ion-card[normalize-space()='#{programName}']").click()
    sleep 3
end

Then(/^"Appv2" I go to the "([^"]*)" tab page$/) do |tabName|
	tabLocator = "//ion-tab-button[normalize-space()='#{tabName}']"
	wait_for_element_visible_xpath($driver, $wait, tabLocator).click()
    step("\"Appv2\" I wait for loading finished")
end

Then("\"Appv2\" I go to the {string} activity") do |activityTitle|
    contentPage = wait_for_element($driver, $wait, "app-project ion-content > ion-list")
    actLocator = "//app-project//app-activity-card//*[@class='activity-name'][normalize-space()='#{activityTitle}']"
    act = wait_for_element_xpath($driver, $wait, actLocator)
    scroll_by_keyboard_if_not_visible($driver, contentPage, act)
    act.click()
    step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refine_element_text_content(wait_for_element($driver, $wait, "app-activity ion-content h1"))
	aActDescription = refine_element_text_content(wait_for_element($driver, $wait, "app-activity ion-content app-description"))
	verify_value("expected activity name", actName, aActName)
	verify_value("expected activity description", actDescription, aActDescription)
end
