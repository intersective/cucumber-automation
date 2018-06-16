

Then(/^"Appv1" I go to the "([^"]*)" tab page$/) do |tabIndex|
	waitForElementVisible($driver, $wait, ".tab-nav > a:nth-of-type(" + tabIndex + ")").click()
	waitForLoadFinished($driver, $wait)
end

Then("\"Appv1\" I go to the {string} activity") do |activityTitle|
	activities = waitForElements($driver, $listWait, ".view-container[nav-view='active'] .card")
	activities.each do |activity|
		if activityTitle == refineElementTextContent(activity.find_element(:css => ".title"))
			activity.click()
			break
		end
	end
end

Then(/^"Appv1" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > h1"))
	aActDescription = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > p"))
	compareWithLog("expected activity name", actName, aActName)
	compareWithLog("expected activity description", actDescription, aActDescription)
end

Then(/^"Appv1" I can see the "([^"]*)" locating at "([^"]*)" with title "([^"]*)" and category "([^"]*)"$/) do |itemName, itemLocation, itemTitle, itemCategory|
	toDoThings = waitForElements($driver, $listWait, ".jsmbp-detail-items > div")
	topicHeader = toDoThings[itemLocation.to_i - 1].find_element(:css => ".item")
	aItemTitle = topicHeader.find_element(:css => "detail-title h2")
	category = refineElementTextContent(topicHeader.find_element(:css => "detail-title p")).split(" ")[0].downcase
	compareWithLog("expected item title", itemTitle, refineElementTextContent(aItemTitle))
	compareWithLog("expected item category", itemCategory, category)
end

Then(/^"Appv1" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
	aitemStatus = waitForElementXpath($driver, $wait, "//*[@class='title'][text()='" + itemName + "']/../p")
	compareWithLog("expected item status", itemStatus, refineElementTextContent(aitemStatus))
end

Then(/^"Appv1" I go to the (topic|assessment) locating at "([^"]*)"$/) do |itemName, itemLocation|
	waitForLoadFinished($driver, $wait)
	toDoThing = waitForElements($driver, $listWait, ".jsmbp-detail-items > div")[itemLocation.to_i - 1]
	scrollIfNotVisible($driver, toDoThing)
	toDoThing.click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I can see the topic with title "([^"]*)" and content "([^"]*)"$/) do |topicTitle, topicContent|
	aTopicTitle = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities h3"))
	aTopicContent = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities .item-body"))
	compareWithLog("expected topic title", topicTitle, aTopicTitle)
	compareWithLog("expected topic content", topicContent, aTopicContent)
end

Then(/^"Appv1" I go back from topic page$/) do
	waitForElementVisible($driver, $wait, ".nav-bar-block[nav-bar=active] .back-button").click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I go back from assessment page$/) do
	waitForElementVisible($driver, $wait, ".nav-bar-block[nav-bar=active] div:nth-of-type(1) .back-button").click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I can see the assessment with name "([^"]*)" and description "([^"]*)"$/) do |assessmentTitle, assessmentDescription|
	aAssessmenTitle = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.name'] > h1"))
	aAssessmenDescription = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.description']"))
	compareWithLog("expected assessment title", assessmentTitle, aAssessmenTitle)
	compareWithLog("expected assessment description", assessmentDescription, aAssessmenDescription)
end

Then(/^"Appv1" I can see the question locating at "([^"]*)" with name "([^"]*)" and description "([^"]*)"$/) do |questionIndex, questionName, questionDescription|
	one = waitForElements($driver, $listWait, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
	aQuestionName = refineElementTextContent(one.find_element(:css => ".item h2"))
	aQuestionDescription = findElementWithParent(one, "div[ng-if='question.description']")
	compareWithLog("expected question name", questionName, aQuestionName)
	if aQuestionDescription != nil
		compareWithLog("expected question description", questionDescription, refineElementTextContent(aQuestionDescription))
	end
end

Then(/^"Appv1" I do the text question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	answerContainer.find_element(:css => "textarea").send_keys(questionAnswer)
end

Then(/^"Appv1" I do the (oneof|team member selector) question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionType, questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	selectOption = answerContainer.find_element(:css => ".list > label:nth-of-type(" + questionAnswer + ")")
	scrollIfNotVisible($driver, selectOption)
	selectOption.click()
end

Then(/^"Appv1" I do the multiple question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	answers = questionAnswer.split(",")
	answers.each do |ans|
		selectOption = answerContainer.find_element(:css => ".list > label:nth-of-type(" + ans + ")")
		scrollIfNotVisible($driver, selectOption)
		selectOption.click()
	end
end

Then(/^"Appv1" I do the (file|image|video) question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionType, questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scrollIfNotVisible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	waitForElement($driver, $wait, "#fsp-fileUpload").send_keys(getUploadFileFullPath(questionAnswer))
	sleep 1
	while waitForElement($driver, $shortWait, ".fsp-picker") != nil
		sleep 1
	end
	sleep 4
end

Then(/^"Appv1" I do the video url question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scrollIfNotVisible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	waitForElement($driver, $wait, "#fsp-fileUpload").send_keys(getUploadFileFullPath(questionAnswer))
	sleep 1
	while waitForElement($driver, $shortWait, ".fsp-picker") != nil
		sleep 1
	end
	sleep 4
end

Then("\"Appv1\" I go to the {string} activity page which has {string} items") do |milestoneTitle, numberOfItems|
	# step("\"Appv1\" I choose a program \"App V1 Selenium Program\"")
	step("\"Appv1\" I should see the app home screen")
	step("I wait 8 seconds")
	step("\"Appv1\" I go to the \"2\" tab page")
	step("I can see a group of \"milestones\" with total \"2\" which is located at \".milestone-header\"")
	step("I wait 2 seconds")
	step("\"Appv1\" I go to the \"#{milestoneTitle}\" activity")
	step("I wait 3 seconds")
	step("I can see a group of \"assessments and topics\" with total \"#{numberOfItems}\" which is located at \".jsmbp-detail-items > div\"")
	step("I wait 2 seconds")
end

Then(/^I wait until the loading finished$/) do
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I should be able to select "([^"]*)" to team member selector which is located at "([^"]*)"$/) do |selectOption, selectorPath|
	selectorOption = waitForElementXpath($driver, $wait, selectorPath)
	if refineElementTextContent(findElementWithParent(selectorOption, ".item-content")).split(" ", 2)[1] != selectOption
		fail("I can not see the team member")
	end
	scrollIfNotVisible($driver, selectorOption)
	selectorOption.click()
end

Then(/^"Appv1" I should be able to see "([^"]*)" which is located at "([^"]*)"$/) do |questionAnswer, selectorPath|
	aQuestionAnswer = waitForElementXpath($driver, $wait, selectorPath)
	if refineElementTextContent(aQuestionAnswer) != questionAnswer
		fail("I can not see the answers")
	end
end

Then("\"Appv1\" I can see the overall project progress") do
	progress = refineElementTextContent(waitForElement($driver, $wait, ".progress-title"))
	$sharedData1.putData("progress", progress)
end

Then("\"Appv1\" I should have the same overall project progress") do
	progress = refineElementTextContent(waitForElement($driver, $wait, ".progress-title"))
	progress1 = $sharedData1.loadDataFromKey("progress")
	if progress != progress1
		fail("I should have the same overall project progress")
	end
end