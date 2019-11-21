

Then("\"Appv2 activity\" I can see the event") do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 activity\" I can see an event \"#{eventName}\"")
end

Then("\"Appv2 events\" I can see the event") do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I can see an event \"#{eventName}\"")
end

Then("\"Appv2 activity\" I can see an event {string}") do |eventName|
    contentPage = wait_for_element($driver, $wait, "app-activity ion-content")
    eleContainer = wait_for_element($driver, $wait, "#events-card")
    scroll_by_keyboard_if_not_visible($driver, contentPage, eleContainer)

    itemLocator = "//app-activity//event-card//*[@class='content']/*[1][normalize-space()='#{eventName}']"
    ele = wait_for_element_xpath($driver, $wait, itemLocator)
    if ele == nil
        verify_value("expected an event", eventName, "nil")
    else
        sleep 2
    end
end

Then("\"Appv2 events\" I can see an event {string}") do |eventName|
    itemLocator = "//app-events//event-card//*[@class='content']/*[1][normalize-space()='#{eventName}']"
    ele = wait_for_element_xpath($driver, $wait, itemLocator)
    if ele == nil
        verify_value("expected an event", eventName, "nil")
    else
        sleep 2
    end
end

Then("\"Appv2 events\" I book the event") do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I book an event \"#{eventName}\"")
end

Then("\"Appv2 events\" I book an event {string}") do |eventName|
    itemLocator = "//app-events//event-card//*[@class='content']/*[1][normalize-space()='#{eventName}']"
    ele = wait_for_element_xpath($driver, $wait, itemLocator).click()
    sleep 2
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Book']").click()
    wait_for_element_xpath($driver, $wait, "//ion-alert//div[normalize-space()='Booked Successfully!']")
    wait_for_element_xpath($driver, $wait, "//ion-alert//button").click()
    while wait_for_element_xpath($driver, $shortWait, "//ion-alert") != nil
		sleep 1
	end
end

Then("\"Appv2 events\" I go to {string}") do |tabName|
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='#{tabName}']").click()
end

Then("\"Appv2 events\" I go back") do
    wait_for_element_xpath($driver, $wait, "//app-events//ion-icon[@name='arrow-back']").click()
end

Then("\"Appv2 events\" I do the checkin assessment of the event") do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I do the checkin assessment of an event \"#{eventName}\"")
end

Then("\"Appv2 events\" I do the checkin assessment of an event {string}") do |eventName|
    itemLocator = "//app-events//event-card//*[@class='content']/*[1][normalize-space()='#{eventName}']"
    ele = wait_for_element_xpath($driver, $wait, itemLocator).click()
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Check In']").click()

    step("\"Appv2\" I answer \"New Choice 1\" for question 1 with question type \"multiple choice\"")
    step("\"Appv2\" I answer \"ohhh gogoggoo\" for question 2 with question type \"text\"")
    step("\"Appv2\" I answer \"New Choice 1,New Choice 0\" for question 3 with question type \"checkbox\"")
    step("\"Appv2\" I submit the assessment")
    while wait_for_element_xpath($driver, $wait, "//app-assessment") != nil
        sleep 1
    end
end