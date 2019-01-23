

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
