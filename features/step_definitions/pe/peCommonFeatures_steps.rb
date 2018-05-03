

Then(/^"PE" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
    step("I should be able to see \"login form\" which is located at \"form.general-form\"")
	step("I input \"#{userName}\" to \"email input box\" which is located at \"form.general-form ion-input[name=email] input\"")
    step("I input \"#{userPassword}\" to \"email input box\" which is located at \"form.general-form ion-input[name=password] input\"")
    step("I click on \"login button\" which is located at \"form.general-form > button\"")
end

Then(/^"PE" I login with the student and password "([^"]*)"$/) do |userPassword|
    studentAccount = $sharedData1.loadDataFromKey("studentAccount")
    step("\"PE\" I login with username \"#{studentAccount}\" and password \"#{userPassword}\"")
end

Then(/^"PE" I wait for loading finished$/) do
    step("The \"loading dialog\" which is located at \"ion-loading\" should be disappear")
    clickBlock = waitForElement($driver, $normalWait, ".click-block")
	if clickBlock != nil
		while clickBlock.attribute("class").index("click-block-active") != nil
			sleep 1
			clickBlock = waitForElement($driver, $shortWait, ".click-block")
		end
	end
end

Then(/^"PE" I input the enrolment information which is located at "([^"]*)"$/) do |arg1|
    studentId = generateStudentId()
	studentName = "selenium.%s" % [studentId]
	studentAccount = "%s@practera.com" % [studentName]
	$sharedData1.putData("studentName", studentName)
    $sharedData1.putData("studentAccount", studentAccount)
    csvtext = "\n%s,%s,%s,fullaccess" % [studentAccount, studentId, studentName]
    enrolmentFile = Dir.pwd + '/data/sandbox-pe-participant.csv'
    File.open(enrolmentFile, File::WRONLY | File::APPEND) do |f|
        f.write(csvtext)
    end
    step("I upload the file \"#{enrolmentFile}\" to \"Choose file\" which is located at \"#{arg1}\"")
end

Then(/^"PE" I log out$/) do
    step("I click on \"account page tab\" which is located at \"#tab-t0-4\"")
    sleep 2
    step("I click on \"exit button\" which is located at \"ion-icon[name=exit]\"")
    step("\"PE\" I wait for loading finished")
end

Then(/^"PE" I search email with title "([^"]*)" and the student as receiver$/) do |title|
    studentAccount = $sharedData1.loadDataFromKey("studentAccount")
    step("\"Mailtrap\" I search email with title \"#{title}\" and receiver \"#{studentAccount}\"")
end