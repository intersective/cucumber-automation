

Given(/^I go to "([^"]*)"$/) do |arg1|
	$driver.get(arg1)
end

When(/^The "([^"]*)" which is located at "([^"]*)" should be disappear$/) do |arg1, arg2|
	sleep 1
	while wait_for_element($driver, $shortWait, arg2) != nil
		sleep 1
	end
end

Then("I click on {string} which is located at {string}") do |arg1, arg2|
	wait_for_element_visible($driver, $wait, arg2).click()
end

Then("I click on {string} which is located at {string} with scroll") do |arg1, arg2|
    ele = wait_for_element($driver, $wait, arg2)
    scroll_if_not_visible($driver, ele)
    ele.click()
end

Then(/^I will see a group of "([^"]*)" with total "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    elements = wait_for_elements($driver, $listWait, arg3)
	while elements.length != arg2.to_i
		sleep 1
		elements = wait_for_elements($driver, $listWait, arg3)
	end
end

Then(/^I (should|will) see a group of "([^"]*)" which is located at "([^"]*)"(| with xpath)$/) do |arg1, arg2, arg3, arg4|
    if arg4 == " with xpath"
        elements = wait_for_elements_xpath($driver, $listWait, arg3)
    else
        elements = wait_for_elements($driver, $listWait, arg3)
    end
    if elements == nil
        if arg1 == "should"
            fail("something wrong")
        end
    end
end

Then(/^I wait (.*?) seconds$/) do |arg1|
    sleep arg1.to_i
end

Then(/^I select "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
	Selenium::WebDriver::Support::Select.new(wait_for_element_visible($driver, $wait, arg3)).select_by(:text, arg1)
end

When("I click on {string} which is located at {string} with xpath") do |arg1, arg2|
    wait_for_element_visible_xpath($driver, $wait, arg2).click()
end

When("I click on {string} which is located at {string} with xpath scroll") do |arg1, arg2|
    ele = wait_for_element_xpath($driver, $wait, arg2)
    scroll_if_not_visible($driver, ele)
    ele.click()
end

Then(/^I should not see "([^"]*)" which is located at "([^"]*)"(| with xpath)$/) do |arg1, arg2, arg3|
    if arg3 == " with xpath"
        elements = wait_for_element_xpath($driver, $wait, arg2)
    else
        elements = wait_for_element($driver, $wait, arg2)
    end
    if elements != nil
        fail("something wrong")
    end
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    wait_for_element_visible($driver, $wait, arg3).clear
    wait_for_element_visible($driver, $wait, arg3).send_keys(arg1)
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)" with scroll$/) do |arg1, arg2, arg3|
    ele = wait_for_element($driver, $wait, arg3)
    scroll_if_not_visible($driver, ele)
    ele.clear
    ele.send_keys(arg1)
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)" with xpath scroll$/) do |arg1, arg2, arg3|
    value = extract_parameter(arg1, arg1)
    ele = wait_for_element_xpath($driver, $wait, arg3)
    scroll_if_not_visible($driver, ele)
    ele.clear
    ele.send_keys(value)
end

Then(/^I upload the file "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    wait_for_element($driver, $wait, arg3).send_keys(arg1)
end

Then(/^I scroll to the top$/) do
    $driver.execute_script("window.scrollTo(0, -document.body.scrollHeight);")
end

Then(/^I can see an alert contain "([^"]*)"$/) do |text|
    currentWindow = $driver.window_handle
    a = $driver.switch_to.alert
    verify_value("expected alert text", text, a.text)
    sleep 2
    a.accept
    $driver.switch_to.window(currentWindow)
end

Then(/^I move to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
    element = wait_for_element($driver, $wait, arg2)
    $driver.action.move_to(element).click.perform
end

Then(/^I move to "([^"]*)" which is located at "([^"]*)" with xpath$/) do |arg1, arg2|
    element = wait_for_element_xpath($driver, $wait, arg2)
    $driver.action.move_to(element).click.perform
end

Then(/^I (should|can) see "([^"]+)" which is located at "([^"]+)" (|with xpath )containing text "([^"]+)"$/) do |arg1, arg2, arg3, arg4, arg5|
    if arg4 == "with xpath "
        ele = wait_for_element_xpath($driver, $wait, arg3)
    else
        ele = wait_for_element($driver, $wait, arg3)
    end
    text = refine_element_text_content(ele)
    if arg1 == "should"
        if text != arg5
            fail("expected text %s, but found %s" % [arg5, text])
        end
    else
        verify_value("expected text", arg5, text)
    end
end

Then("I should see {string} which is located at {string} has color {string}") do |arg1, arg2, arg3|
    color = $driver.execute_script("return window.getComputedStyle(document.querySelector('%s')).getPropertyValue('color')" % [arg2])
    rgb = color[4..-2].split(",")
    color1 = arg3[0,2].hex.to_s
    color2 = arg3[2,2].hex.to_s
    color3 = arg3[4,2].hex.to_s
    if rgb[0].strip() != color1 || rgb[1].strip() != color2 || rgb[2].strip() != color3
        fail("expected color %s, but found %s" % [arg3, color])
    end
end

Then("I should see {string} which is located at {string} with xpath has class {string}") do |arg1, arg2, arg3|
    ele = wait_for_element_xpath($driver, $wait, arg2)
    if ele.attribute("class").index(arg3) == nil
        fail("%s should have %s for the class" % [arg2, arg3])
    end
end

Then("I move the slider {string} to the {string} which is located at {string} by {string} times") do |arg1, arg2, arg3, arg4|
    ele = wait_for_element_visible($driver, $wait, arg3)
    counter = arg4.to_i
    for i in 1..counter
        if arg2 == "right"
            ele.send_keys(:right)
        else
            ele.send_keys(:left)
        end
    end
end

Then(/^I (should|can) see "([^"]*)" which is located at "([^"]*)"(| with)(| xpath)(| scroll)$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
    if arg5 == " xpath"
        if arg6 == " scroll"
            ele = wait_for_element_xpath($driver, $wait, arg3)
        else
            ele = wait_for_element_visible_xpath($driver, $wait, arg3)
        end
    else
        if arg6 == " scroll"
            ele = wait_for_element($driver, $wait, arg3)
        else
            ele = wait_for_element_visible($driver, $wait, arg3)
        end
    end
    if ele == nil
        if arg1 == "can"
            verify_value("expected element exist", arg3, "nil")
        else
            fail("expected %s, but found %s" % [arg3, "nil"])
        end
    else
        if arg6 == " scroll"
            scroll_if_not_visible($driver, ele)
        end
    end
end
