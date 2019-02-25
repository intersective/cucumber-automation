

Then(/^"Appv2 Reviews" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
	toReviews = wait_for_elements($driver, $listWait, "app-reviews ion-card")
	toReviews.each do |row|
		aName = refine_element_text_content(find_element_with_parent(row, "h4"))
		sName = refine_element_text_content(find_element_with_parent(row, "h2"))
		if assessmentName == aName && studentName == sName
			row.click()
			break
		end
	end
	step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2 Reviews" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
	studentName = get_user_from_data(arg1, Application.KEY_ROLE_STUDENT).name
	step("\"Appv2 Reviews\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end

Then(/^"Appv2 Reviews" I go to (To do|Done) section$/) do |header|
	step("I click on \"section button\" which is located at \"//app-reviews//ion-button[normalize-space()='#{header}']\" with xpath")
	step("\"Appv2\" I wait for loading finished")
end

Then(/^"Appv2 Reviews" I input review (answer|comment) "([^"]*)" to question ([1-9]+[0-9]*)$/) do |type, content, qindex|
	contentPage = wait_for_element($driver, $wait, "app-assessment ion-content")
	eleContainer = nil
	if type == "answer"
		eleContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea[@placeholder='Please put your answer here']")
    else
		eleContainer = wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//ion-textarea[@placeholder='Please put your feedback here']")
	end
	scroll_by_keyboard_if_not_visible($driver, contentPage, eleContainer)
	focus_element(eleContainer)
	eleContainer.send_keys(content)
end

Then(/^"Appv2 Reviews" I can see the "([^"]*)" question ([1-9]+[0-9]*) feedback with:$/) do |qtype, qindex, table|
	feedback = table.raw
	answers = feedback[0][0]
	comments = feedback[1][0]

	case qtype
		when Application.KEY_Q_TEXT
			aanswers = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
			acomments = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[2]"))
		when Application.KEY_Q_MULT
			aanswers = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']//ion-item"))
			acomments = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
		when Application.KEY_Q_CHECKBOX
			tempList = []
			acomments = refine_element_text_content(wait_for_element_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']/p[1]"))
			temp = wait_for_elements_xpath($driver, $wait, "//app-assessment//ion-card[#{qindex}]//*[@class='q-reviews']//ion-item")
			temp.each do |t|
				tempList.push(refine_element_text_content(t))
			end
			aanswers = tempList.join(",")
		else
			puts("")
	end

	verify_value("expected question reviewer answers", answers, aanswers)
	verify_value("expected question reviewer cooments", comments, acomments)
end

Then(/^"Appv2 Reviews" I mark the feedback as read$/) do
	contentPage = wait_for_element($driver, $wait, "app-assessment ion-content")
	btn = wait_for_element_xpath($driver, $wait, "//*[normalize-space()='Mark feedback as read']/ion-toggle")
	scroll_by_keyboard_if_not_visible($driver, contentPage, btn)
	btn.click()
end

Then(/^"Appv2 Reviews" I see the rating pop up$/) do
	wait_for_element_visible_xpath($driver, $wait, "//app-review-rating")
end

Then(/^"Appv2 Reviews" I move the rating slider by ([1-9]+[0-9]*) times$/) do |mtimes|
	slider = wait_for_element_visible($driver, $wait, "app-review-rating ion-range")
	focus_element(slider)
	step("I move the slider \"feedback rating\" to the \"right\" which is located at \"app-review-rating ion-range\" by \"#{mtimes}\" times")
	sleep 3
end

Then(/^"Appv2 Reviews" I choose "([^"]*)" to quich response$/) do |qresponse|
	contentPage = wait_for_element($driver, $wait, "app-review-rating ion-content")
	btn = wait_for_element_xpath($driver, $wait, "//app-review-rating//*[@class='quick-tagging']/a[normalize-space()='#{qresponse}']")
	scroll_by_keyboard_if_not_visible($driver, contentPage, btn)
	btn.click()
	sleep 2
end

Then(/^"Appv2 Reviews" I add "([^"]*)" to personal comments$/) do |comments|
	contentPage = wait_for_element($driver, $wait, "app-review-rating ion-content")
	inputBox = wait_for_element_xpath($driver, $wait, "//app-review-rating//ion-input[@placeholder='Add a personal thank you']")
	scroll_by_keyboard_if_not_visible($driver, contentPage, inputBox)
	focus_element(inputBox)
	inputBox.send_keys(comments)
end

Then(/^"Appv2 Reviews" I submit the review rating$/) do
	contentPage = wait_for_element($driver, $wait, "app-review-rating ion-content")
	btn = wait_for_element_xpath($driver, $wait, "//app-review-rating//ion-button[normalize-space()='Submit']")
	scroll_by_keyboard_if_not_visible($driver, contentPage, btn)
	btn.click()
end