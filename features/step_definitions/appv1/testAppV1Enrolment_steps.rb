

Then(/^I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
	studentId = generateStudentId()
	studentName = "selenium.%s" % [studentId]
	studentAccount = "%s@practera.com" % [studentName]
	$sharedData1.putData("studentName", studentName)
	$sharedData1.putData("studentAccount", studentAccount)
	csvtext = "%s,%s,%s" % [studentAccount, studentId, studentName]
	waitForElement($driver, $wait, arg1).send_keys(csvtext)
end