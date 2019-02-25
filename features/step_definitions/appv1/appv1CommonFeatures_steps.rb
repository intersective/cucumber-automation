

Then(/^"Appv1" I go to the "([^"]*)" tab page$/) do |tabName|
	tabLocator = "//*[@class='tab-title'][normalize-space()='%s']/.." % [tabName]
	wait_for_element_visible_xpath($driver, $wait, tabLocator).click()
	wait_for_load_finished($driver, $wait)
end

Then("\"Appv1\" I go to the {string} activity") do |activityTitle|
	activities = wait_for_elements($driver, $listWait, ".view-container[nav-view='active'] .card")
	activities.each do |activity|
		if activityTitle == refine_element_text_content(activity.find_element(:css => ".title"))
			scroll_if_not_visible($driver, activity)
			activity.click()
			break
		end
	end
end

Then(/^"Appv1" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refine_element_text_content(wait_for_element($driver, $wait, "jsmbp-detail-container > div > .item > h1"))
	aActDescription = refine_element_text_content(wait_for_element($driver, $wait, "jsmbp-detail-container > div > .item > p"))
	verify_value("expected activity name", actName, aActName)
	verify_value("expected activity description", actDescription, aActDescription)
end

Then(/^"Appv1" I can see the "([^"]*)" locating at "([^"]*)" with title "([^"]*)" and category "([^"]*)"$/) do |itemName, itemLocation, itemTitle, itemCategory|
	toDoThings = wait_for_elements($driver, $listWait, ".jsmbp-detail-items > div")
	topicHeader = toDoThings[itemLocation.to_i - 1].find_element(:css => ".item")
	aItemTitle = topicHeader.find_element(:css => "detail-title h2")
	category = refine_element_text_content(topicHeader.find_element(:css => "detail-title p")).split(" ")[0].downcase
	verify_value("expected item title", itemTitle, refine_element_text_content(aItemTitle))
	verify_value("expected item category", itemCategory, category)
end

Then(/^"Appv1" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
	aitemStatus = wait_for_element_xpath($driver, $wait, "//*[@class='title'][text()='" + itemName + "']/../p")
	verify_value("expected item status", itemStatus, refine_element_text_content(aitemStatus))
end

Then(/^"Appv1" I go to the (topic|assessment) locating at "([^"]*)"$/) do |itemName, itemLocation|
	wait_for_load_finished($driver, $wait)
	toDoThing = wait_for_elements($driver, $listWait, ".jsmbp-detail-items > div")[itemLocation.to_i - 1]
	scroll_if_not_visible($driver, toDoThing)
	toDoThing.click()
	wait_for_load_finished($driver, $wait)
end

Then(/^"Appv1" I go to the (topic|assessment) "([^"]*)"$/) do |itemName, itemTitle|
	wait_for_load_finished($driver, $wait)
	toDoThing = wait_for_element_xpath($driver, $wait, "//*[contains(@class,'jsmbp-detail-items')]//*[normalize-space()='#{itemTitle}']/.././../../..")
	scroll_if_not_visible($driver, toDoThing)
	toDoThing.click()
	wait_for_load_finished($driver, $wait)
end

Then(/^"Appv1" I can see the topic with title "([^"]*)" and content "([^"]*)"$/) do |topicTitle, topicContent|
	aTopicTitle = refine_element_text_content(wait_for_element($driver, $wait, ".pane[nav-view='active'] .activities h3"))
	aTopicContent = refine_element_text_content(wait_for_element($driver, $wait, ".pane[nav-view='active'] .activities .item-body"))
	verify_value("expected topic title", topicTitle, aTopicTitle)
	verify_value("expected topic content", topicContent, aTopicContent)
end

Then(/^"Appv1" I go back from (topic|assessment|chat) page$/) do |itemName|
	wait_for_element_visible($driver, $wait, ".nav-bar-block[nav-bar=active] .back-button[ng-click]:not(.hide)").click()
	wait_for_load_finished($driver, $wait)
end

Then(/^"Appv1" I can see the assessment with name "([^"]*)" and description "([^"]*)"$/) do |assessmentTitle, assessmentDescription|
	aAssessmenTitle = refine_element_text_content(wait_for_element($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.name'] > h1"))
	aAssessmenDescription = refine_element_text_content(wait_for_element($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.description']"))
	verify_value("expected assessment title", assessmentTitle, aAssessmenTitle)
	verify_value("expected assessment description", assessmentDescription, aAssessmenDescription)
end

Then(/^"Appv1" I can see the question locating at "([^"]*)" with name "([^"]*)" and description "([^"]*)"$/) do |questionIndex, questionName, questionDescription|
	one = wait_for_elements($driver, $listWait, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
	aQuestionName = refine_element_text_content(one.find_element(:css => ".item h2"))
	aQuestionDescription = find_element_with_parent(one, "div[ng-if='question.description']")
	verify_value("expected question name", questionName, aQuestionName)
	if aQuestionDescription != nil
		verify_value("expected question description", questionDescription, refine_element_text_content(aQuestionDescription))
	end
end

Then(/^"Appv1" I do the text question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.get_question_answer_container($driver, $listWait, questionIndex)
	scroll_if_not_visible($driver, answerContainer)
	answerContainer.find_element(:css => "textarea").send_keys(questionAnswer)
end

Then(/^"Appv1" I do the oneof question locating at "([^"]*)" of group "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, groupIndex, questionAnswer|
	selectPath = "//*[@ng-repeat='group in groupQuestion'][%s]/*[@ng-repeat='question in group.questions'][%s]//label//span[normalize-space()='%s']/../../.." % [groupIndex, questionIndex, questionAnswer]
	option = wait_for_element_xpath($driver, $wait, selectPath)
	scroll_if_not_visible($driver, option)
	option.click()
end

Then(/^"Appv1" I do the multiple question locating at "([^"]*)" of group "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, groupIndex, questionAnswer|
	answers = questionAnswer.split(",")
	answers.each do |ans|
		selectPath = "//*[@ng-repeat='group in groupQuestion'][%s]/*[@ng-repeat='question in group.questions'][%s]//label//span[normalize-space()='%s']/../.." % [groupIndex, questionIndex, ans]
		option = wait_for_element_xpath($driver, $wait, selectPath)
		scroll_if_not_visible($driver, option)
		option.click()
	end
end

Then(/^"Appv1" I do the (file|image|video) question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionType, questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.get_question_answer_container($driver, $listWait, questionIndex)
	scroll_if_not_visible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scroll_if_not_visible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	wait_for_element($driver, $wait, "#fsp-fileUpload").send_keys(get_upload_file_full_path(questionAnswer))
	sleep 1
	while wait_for_element($driver, $shortWait, ".fsp-picker") != nil
		sleep 1
	end
	sleep 4
end

Then(/^"Appv1" I do the video url question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.get_question_answer_container($driver, $listWait, questionIndex)
	scroll_if_not_visible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scroll_if_not_visible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	wait_for_element($driver, $wait, "#fsp-fileUpload").send_keys(get_upload_file_full_path(questionAnswer))
	sleep 1
	while wait_for_element($driver, $shortWait, ".fsp-picker") != nil
		sleep 1
	end
	sleep 4
end

Then("\"Appv1\" I go to the {string} activity page which has {string} items") do |activityTitle, numberOfItems|
	# step("\"Appv1\" I choose a program \"App V1 Selenium Program\"")
	step("\"Appv1\" I should see the app home screen")
	step("I wait 8 seconds")
	step("\"Appv1\" I go to the \"Activities\" tab page")
	step("I will see a group of \"milestones\" with total \"5\" which is located at \".milestone-header\"")
	step("I wait 2 seconds")
	step("\"Appv1\" I go to the \"#{activityTitle}\" activity")
	step("I wait 3 seconds")
	step("I will see a group of \"assessments and topics\" with total \"#{numberOfItems}\" which is located at \".jsmbp-detail-items > div\"")
	step("I wait 2 seconds")
end

Then(/^I wait until the loading finished$/) do
	wait_for_load_finished($driver, $wait)
end

Then("\"Appv1\" I can see the overall project progress") do
	progress = refine_element_text_content(wait_for_element($driver, $wait, ".progress-title"))
	$sharedData1.put_data(Application.KEY_PROGRESS, progress)
end

Then("\"Appv1\" I should have the same overall project progress") do
	progress = refine_element_text_content(wait_for_element($driver, $wait, ".progress-title"))
	progress1 = load_shared_data(Application.KEY_PROGRESS)
	if progress != progress1
		fail("I should have the same overall project progress")
	end
end

Then("\"Appv1\" I wait unitl the splash disappear") do
	sleep 10
end
