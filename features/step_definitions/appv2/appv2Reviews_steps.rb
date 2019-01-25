

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

Then(/^"Appv2 Reviews" I can see the "([^"]*)" question ([1-9]+[0-9]*) feedback with:$/) do |qtype, qindex, table|
	feedback = table.raw
	answers = feedback[0][0]
	comments = feedback[1][0]

	case qtype
		when Application.KEY_Q_TEXT
			aanswers = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
			acomments = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[2]"))
		when Application.KEY_Q_MULT
			aanswers = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']//ion-item"))
			acomments = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
		when Application.KEY_Q_CHECKBOX
			tempList = []
			acomments = refineElementTextContent(waitForElementXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
			temp = waitForElementsXpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']//ion-item")
			temp.each do |t|
				tempList.push(refineElementTextContent(t))
			end
			aanswers = tempList.join(",")
		else
			puts("")
	end

	verifyValue("expected question reviewer answers", answers, aanswers)
	verifyValue("expected question reviewer cooments", comments, acomments)
end

Then(/^"Appv2 Reviews" I mark the feedback as read$/) do
	contentPage = waitForElement($driver, $wait, "app-assessment ion-content")
	btn = waitForElementXpath($driver, $wait, "//*[normalize-space()='Mark feedback as read']/ion-toggle")
	scrollIfNotVisibleByKeyBoard($driver, contentPage, btn)
	btn.click()
end

Then(/^"Appv2 Reviews" I see the rating pop up$/) do
	waitForElementXpath($driver, $wait, "//app-review-rating")
end

Then(/^"Appv2 Reviews" I move the rating slider by ([1-9]+[0-9]*) times$/) do |mtimes|
	slider = waitForElement($driver, $wait, "app-review-rating ion-range")
	focusElement(slider)
	step("I move the slider \"feedback rating\" to the \"right\" which is located at \"app-review-rating ion-range\" by \"#{mtimes}\" times")
	sleep 3
end

Then(/^"Appv2 Reviews" I choose "([^"]*)" to quich response$/) do |qresponse|
	contentPage = waitForElement($driver, $wait, "app-review-rating ion-content")
	btn = waitForElementXpath($driver, $wait, "//app-review-rating//*[@class='quick-tagging']/a[normalize-space()='#{qresponse}']")
	scrollIfNotVisibleByKeyBoard($driver, contentPage, btn)
	btn.click()
	sleep 2
end

Then(/^"Appv2 Reviews" I add "([^"]*)" to personal comments$/) do |comments|
	contentPage = waitForElement($driver, $wait, "app-review-rating ion-content")
	inputBox = waitForElementXpath($driver, $wait, "//app-review-rating//ion-input[@placeholder='Add a personal thank you']")
	scrollIfNotVisibleByKeyBoard($driver, contentPage, inputBox)
	focusElement(inputBox)
	inputBox.send_keys(comments)
end

Then(/^"Appv2 Reviews" I submit the review rating$/) do
	contentPage = waitForElement($driver, $wait, "app-review-rating ion-content")
	btn = waitForElementXpath($driver, $wait, "//app-review-rating//ion-button[normalize-space()='Submit']")
	scrollIfNotVisibleByKeyBoard($driver, contentPage, btn)
	btn.click()
end