

Then(/^I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
	studentId = generateStudentId()
	studentName = "selenium.%s" % [studentId]
	studentAccount = "%s@practera.com" % [studentName]
	$sharedData1.putData("studentName", studentName)
	$sharedData1.putData("studentAccount", studentAccount)
	csvtext = "%s,%s,%s,%s" % [studentAccount, studentId, studentName, Random.rand(1000000000...20000000000).to_s]
	waitForElement($driver, $wait, arg1).send_keys(csvtext)
end