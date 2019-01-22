

Then(/^"Appv2" I wait for loading finished$/) do
    elements = waitForElements($driver, $wait, "ion-spinner")
    while elements != nil && elements.length > 0
        sleep 1
        elements = waitForElements($driver, $wait, "ion-spinner")
    end
    sleep 1
end

Then(/^"Appv2" I choose a program "([^"]*)"$/) do |programName|
    waitForElementVisibleXpath($driver, $wait, "//ion-card[normalize-space()='#{programName}']").click()
end

Then(/^"Appv2" I log out$/) do
    waitForElement($driver, $wait, "ion-tab-button[tab='settings']").click()
    waitForElementVisibleXpath($driver, $wait, "//app-tabs//ion-card[normalize-space()='Logout']").click()
end
