

Then(/^I input ([1-9]+[0-9]*) student enrolment information which is located at "([^"]*)"$/) do |arg1, arg2|
	counter = arg1.to_i 
	students = {}
	temp = []
	hash = {}
	for i in 1..counter
		studentId = generateUniId()
		studentName = "selenium.%s" % [studentId]
		studentAccount = "%s@practera.com" % [studentName]
		temp.push("%s,%s,%s" % [studentAccount, studentId, studentName])
		hash[i.to_s] = {"studentId" => studentId, "studentName" => studentName, "studentAccount" => studentAccount}
		students[i.to_s] = Student.new(studentId, studentName, studentAccount)
	end
	csvtext = temp.join("\n")
	writeJsonfile(hash, Dir.pwd + "/data/students.json")
	$sharedData1.putData("students", students)
	waitForElement($driver, $wait, arg2).send_keys(csvtext)
end