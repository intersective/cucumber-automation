

Then(/^I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
	studentId = generateStudentId()
	studentName = "selenium.%s" % [studentId]
	studentAccount = "%s@practera.com" % [studentName]
	$sharedData1.putData("studentName", studentName)
	$sharedData1.putData("studentAccount", studentAccount)
	csvtext = "%s,%s,%s,fullaccess" % [studentAccount, studentId, studentName]
	waitForElement($driver, $wait, arg1).send_keys(csvtext)
end

Then(/^I wait until the enrolment process percentage be 100 percent$/) do
	while "100% Complete" != waitForElement($driver, $wait, "div.progress > #process-percentage").attribute("innerText")
		sleep 1
	end
end

Then(/^I input student name to "([^"]*)" which is located at "([^"]*)"$/) do |arg1, arg2|
	waitForElement($driver, $wait, arg2).send_keys($sharedData1.loadDataFromKey("studentName"))
end

Then(/^I wait the search result$/) do
	while waitForElements($driver, $wait, "table#indextbl tbody tr").length != 1
		sleep 1
	end
	regHref = waitForElement($driver, $wait, "table#indextbl tbody tr:nth-of-type(1) td:nth-of-type(5) a").attribute("href")
	$sharedData1.putData("regUrl", regHref)
end
