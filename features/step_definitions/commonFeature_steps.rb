Given(/^I go to "([^"]*)"$/) do |arg1|
	$driver.get(arg1)
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

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElementVisible($driver, $wait, arg2)
end

Then(/^I should be able to see "([^"]*)" which is located at "([^"]*)" with assert$/) do |arg1, arg2|
    if waitForElementVisible($driver, $wait, arg2) == nil
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
    waitForElement($driver, $wait, arg3).send_keys(arg1)
end