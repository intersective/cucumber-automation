

Then(/^"Appv1 Reviews" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
	toReviews = waitForElements($driver, $listWait, "div[ng-repeat^='review']")
	toReviews.each do |row|
		aName = findElementWithParent(row, ".review-text").attribute("innerText").split("\n")[0].strip
		sName = refineElementTextContent(findElementWithParent(row, ".review-card-details > div"))
		if assessmentName == aName && studentName == sName
			row.click()
			break
		end
	end
	step("I wait until the loading finished")
end

Then(/^"Appv1 Reviews" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
	studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
	step("\"Appv1 Reviews\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end

Then(/^"Appv1 Reviews" I go to (Todo|Done) section$/) do |header|
	step("I click on \"section button\" which is located at \"//button[normalize-space()='#{header}']\" with xpath")
	step("I wait until the loading finished")
end

Then(/^"Appv1 Reviews" I can see reviewer answer "([^"]*)" of question "([^"]*)"$/) do |answer, question|
	step("I can see \"reviewer answer\" which is located at \"//*[normalize-space()='#{question}']/..//*[text()='Reviewer']/..//*[text()='Answer']/../*[text()='#{answer}']\" with xpath scroll")
end

Then(/^"Appv1 Reviews" I can see reviewer comment "([^"]*)" of question "([^"]*)"$/) do |answer, question|
	step("I can see \"reviewer comment\" which is located at \"//*[normalize-space()='#{question}']/..//*[text()='Reviewer']/..//*[text()='Comment']/../*[text()='#{answer}']\" with xpath scroll")
end

Then(/^"Appv1 Reviews" I input review (answer|comment) "([^"]*)" of question "([^"]*)"$/) do |type, content, question|
	if type == "answer"
		step("I input \"#{content}\" to \"review answer\" which is located at \"//*[normalize-space()='#{question}']/../..//textarea[@placeholder='Reviewer Answer']\" with xpath scroll")
	else
		step("I input \"#{content}\" to \"review answer\" which is located at \"//*[normalize-space()='#{question}']/../..//textarea[@placeholder='Reviewer Comment']\" with xpath scroll")
	end
end

Then(/^"Appv1 Reviews" I choose review answer "([^"]*)" of question "([^"]*)"$/) do |choice, question|
	step("I click on \"a choice\" which is located at \"//*[normalize-space()='#{question}']/../..//*[starts-with(@ng-if, '!thisReview.is_done')]//span[normalize-space()='#{choice}']/../..\" with xpath scroll")
end
