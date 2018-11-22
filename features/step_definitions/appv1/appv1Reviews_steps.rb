

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
end

Then(/^"Appv1 Reviews" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
	studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
	step("\"Appv1 Reviews\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end
