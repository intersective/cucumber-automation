

Then(/^I get the registration url at "([^"]*)"$/) do |arg1|
    regHref = waitForElement($driver, $wait, arg1).attribute("href")
    $sharedData1.putData(Application.KEY_REGURL, regHref)
end

Then(/^I use the registration link$/) do
	regLink = $sharedData1.loadDataFromKey(Application.KEY_REGURL)
    $driver.get(regLink)
end

Then(/^I use the registration link for student ([1-9]+[0-9]*)$/) do |arg1|
    student = getStudentFromData(arg1)
    $driver.get(student.regUrl)
end
