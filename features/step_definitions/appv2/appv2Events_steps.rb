

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
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
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

Then("\"Appv2 events\" I do the checkin assessment of the event with:") do |table|
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Check In']").click()
    
    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2
    for i in 1..rows
        step("\"Appv2\" I answer \"#{data[i][0]}\" for question #{data[i][1]} with question type \"#{data[i][2]}\"")
    end
    step("\"Appv2\" I submit the assessment")
    while wait_for_element_xpath($driver, $shortWait, "//app-assessment") != nil
        sleep 1
    end
end

Then("\"Appv2 events\" I do the checkin assessment of an event {string} with:") do |eventName, table|
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Check In']").click()

    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2
    for i in 1..rows
        step("\"Appv2\" I answer \"#{data[i][0]}\" for question #{data[i][1]} with question type \"#{data[i][2]}\"")
    end
    step("\"Appv2\" I submit the assessment")
    while wait_for_element_xpath($driver, $shortWait, "//app-assessment") != nil
        sleep 1
    end
end

Then("\"Appv2 events\" I go to the event") do
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
end

Then("\"Appv2 events\" I go to an event {string}") do |eventName|
    itemLocator = "//app-events//event-card//*[@class='content']/*[1][normalize-space()='#{eventName}']"
    ele = wait_for_element_xpath($driver, $wait, itemLocator).click()
    sleep 1
end

Then("\"Appv2 events\" I view the check-in of the event with:") do |table|
    eventName = load_shared_data(Application.KEY_CURRENTEVENT)["1"].name
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='View Check In']").click()

    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2
    for i in 1..rows
        step("\"Appv2\" I can see the answer \"#{data[i][0]}\" for question #{data[i][1]} with question type \"#{data[i][2]}\"")
    end
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Continue']").click()
    while wait_for_element_xpath($driver, $shortWait, "//app-assessment") != nil
        sleep 1
    end
end

Then("\"Appv2 events\" I view the check-in of an event {string} with:") do |eventName, table|
    step("\"Appv2 events\" I go to an event \"#{eventName}\"")
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='View Check In']").click()

    data = table.raw
    rows = data.length - 1
    cols = data[0].length - 2
    for i in 1..rows
        step("\"Appv2\" I can see the answer \"#{data[i][0]}\" for question #{data[i][1]} with question type \"#{data[i][2]}\"")
    end
    wait_for_element_xpath($driver, $wait, "//ion-button[normalize-space()='Continue']").click()
    while wait_for_element_xpath($driver, $shortWait, "//app-assessment") != nil
        sleep 1
    end
end