

Then(/^I get the registration url at "([^"]*)"$/) do |arg1|
    regHref = waitForElement($driver, $wait, arg1).attribute("href")
    $sharedData1.putData(Application.KEY_REGURL, regHref)
end

Then(/^I use the registration link$/) do
	regLink = loadSharedData(Application.KEY_REGURL)
    $driver.get(regLink)
end

Then(/^I use the registration link for (mentor|student) ([1-9]+[0-9]*)$/) do |arg1, arg2|
    user = getUserFromData(arg2, arg1)
    $driver.get(user.regUrl)
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
