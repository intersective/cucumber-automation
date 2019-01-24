

Then(/^"Appv2 Reviews" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
	toReviews = waitForElements($driver, $listWait, "app-reviews ion-card")
	toReviews.each do |row|
		aName = refineElementTextContent(findElementWithParent(row, "h4"))
		sName = refineElementTextContent(findElementWithParent(row, "h2"))
		if assessmentName == aName && studentName == sName
			row.click()
			break
		end
	end
	step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2 Reviews" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
	studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
	step("\"Appv2 Reviews\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end

Then(/^"Appv2 Reviews" I go to (To do|Done) section$/) do |header|
	step("I click on \"section button\" which is located at \"//app-reviews//ion-button[normalize-space()='#{header}']\" with xpath")
	step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2 Reviews" I input review (answer|comment) "([^"]*)" to question ([1-9]+[0-9]*)$/) do |type, content, qindex|
	contentPage = waitForElement($driver, $wait, "app-assessment ion-content")
	eleContainer = nil
	if type == "answer"
		eleContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea[@placeholder='Please put your answer here']")
    else
		eleContainer = waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea[@placeholder='Please put your feedback here']")
	end
	scrollIfNotVisibleByKeyBoard($driver, contentPage, eleContainer)
	focusElement(eleContainer)
	eleContainer.send_keys(content)
end
