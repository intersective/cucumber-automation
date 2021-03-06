

Then(/^I get the registration url at "([^"]*)"$/) do |arg1|
    regHref = wait_for_element($driver, $wait, arg1).attribute("href")
    $sharedData1.put_data(Application.KEY_REGURL, regHref)
end

Then(/^I use the registration link$/) do
	regLink = load_shared_data(Application.KEY_REGURL)
    $driver.get(regLink)
end

Then(/^I use the registration link for (mentor|student) ([1-9]+[0-9]*)$/) do |arg1, arg2|
    user = get_user_from_data(arg2, arg1)
    $driver.get(user.regUrl)
end

Given(/^I go to App V1$/) do
    appV1Link = $configObj["APPV1URL"]
    step("I go to \"#{appV1Link}\"")
end

Given(/^I go to App V2$/) do
    appV2Link = $configObj["APPV2URL"]
    step("I go to \"#{appV2Link}\"")
end

Given(/^I go to Practera Platform$/) do
    practeraLink = $configObj["PRACTERAURL"]
    step("I go to \"#{practeraLink}\"")
end

Given(/^I go to Mailtrap$/) do
    mailtrapLink = $configObj["MAILTRAP"]
    step("I go to \"#{mailtrapLink}\"")
end

Given(/^I go to PE$/) do
    peLink = $configObj["PEURL"]
    step("I go to \"#{peLink}\"")
end
