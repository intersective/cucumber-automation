

Given(/^I go to "([^"]*)"$/) do |arg1|
	$driver.get(arg1)
end

Given(/^I go to App V1$/) do
    appV1Link = $configObj["appv1Url"]
    step("I go to \"#{appV1Link}\"")
end

Given(/^I go to Practera Platform$/) do
    practeraLink = $configObj["practeraUrl"]
    step("I go to \"#{practeraLink}\"")
end

Given(/^I go to Mailtrap$/) do
    mailtrapLink = $configObj["mailtrap"]
    step("I go to \"#{mailtrapLink}\"")
end

Given(/^I go to PE$/) do
    peLink = $configObj["peUrl"]
    step("I go to \"#{peLink}\"")
end

When(/^The "([^"]*)" which is located at "([^"]*)" should be disappear$/) do |arg1, arg2|
	sleep 1
	while waitForElement($driver, $shortWait, arg2) != nil
		sleep 1
	end
end

Then(/^I click on "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElementVisible($driver, $wait, arg2).click()
end

Then(/^I click on "([^"]*)" which is located at "([^"]*)" with scroll$/) do |arg1, arg2|
    ele = waitForElement($driver, $wait, arg2)
    scrollIfNotVisible($driver, ele)
    ele.click()
end

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElementVisible($driver, $wait, arg2)
end

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)" with assert$/) do |arg1, arg2|
    if waitForElementVisible($driver, $wait, arg2) == nil
        fail("something wrong")
    end
end

Then(/^I should be able to see a group of "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElements($driver, $listWait, arg2)
end

Then(/^I can see a group of "([^"]*)" with total "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    elements = waitForElements($driver, $listWait, arg3)
	while elements.length != arg2.to_i
		sleep 1
		elements = waitForElements($driver, $listWait, arg3)
	end
end

Then(/^I should be able to see a group of "([^"]*)" which is located at "([^"]*)" with assert$/) do |arg1, arg2|
	if waitForElements($driver, $listWait, arg2) == nil
        fail("something wrong")
    end
end

Then(/^I wait (.*?) seconds$/) do |arg1|
	sleep arg1.to_i
end

Then(/^I select "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
	Selenium::WebDriver::Support::Select.new(waitForElementVisible($driver, $wait, arg3)).select_by(:text, arg1)
end

When(/^I click on "([^"]*)" which is located at "([^"]*)" with xpath$/) do |arg1, arg2|
    waitForElementVisibleXpath($driver, $wait, arg2).click()
end

When(/^I click on "([^"]*)" which is located at "([^"]*)" with xpath scroll$/) do |arg1, arg2|
    ele = waitForElementXpath($driver, $wait, arg2)
    scrollIfNotVisible($driver, ele)
    ele.click()
end

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)" with xpath$/) do |arg1, arg2|
    waitForElementVisibleXpath($driver, $wait, arg2)
end

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)" with xpath assert$/) do |arg1, arg2|
    if waitForElementVisibleXpath($driver, $wait, arg2) == nil
        fail("something wrong")
    end
end

Then(/^I should not see "([^"]*)" which is located at "([^"]*)" with xpath assert$/) do |arg1, arg2|
    if waitForElementXpath($driver, $wait, arg2) != nil
        fail("something wrong")
    end
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    waitForElementVisible($driver, $wait, arg3).send_keys(arg1)
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)" with scroll$/) do |arg1, arg2, arg3|
    ele = waitForElement($driver, $wait, arg3)
    scrollIfNotVisible($driver, ele)
    ele.send_keys(arg1)
end

Then(/^I input "([^"]*)" to "([^"]*)" which is located at "([^"]*)" with xpath scroll$/) do |arg1, arg2, arg3|
    ele = waitForElementXpath($driver, $wait, arg3)
    scrollIfNotVisible($driver, ele)
    ele.send_keys(arg1)
end

Then(/^I upload the file "([^"]*)" to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2, arg3|
    waitForElement($driver, $wait, arg3).send_keys(arg1)
end

Then(/^I scroll to the top$/) do
    $driver.execute_script("window.scrollTo(0, -document.body.scrollHeight);")
end

Then(/^I can see an alert contain "([^"]*)"$/) do |text|
    currentWindow = $driver.window_handle
    a = $driver.switch_to.alert
    compareWithLog("expected alert text", text, a.text)
    sleep 2
    a.accept
    $driver.switch_to.window(currentWindow)
end

Then(/^I move to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
    element = waitForElement($driver, $wait, arg2)
    $driver.action.move_to(element).perform
end

Then(/^I move to "([^"]*)" which is located at "([^"]*)" with xpath$/) do |arg1, arg2|
    element = waitForElementXpath($driver, $wait, arg2)
    $driver.action.move_to(element).perform
end