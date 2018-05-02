

Then(/^"Appv1" I go to the "([^"]*)" tab page$/) do |tabIndex|
	waitForElementVisible($driver, $wait, ".tab-nav > a:nth-of-type(" + tabIndex + ")").click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I go to the "([^"]*)" milestone$/) do |milestoneLocation|
	milestone = waitForElementVisibleWithInAGroup($driver, $wait, ".view-container[nav-view='active'] .card", milestoneLocation)
	milestone.click()
end

Then(/^"Appv1" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > h1"))
	aActDescription = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > p"))
	compareWithLog("expected activity name", actName, aActName)
	compareWithLog("expected activity description", actDescription, aActDescription)
end

Then(/^"Appv1" I can see the "([^"]*)" locating at "([^"]*)" with title "([^"]*)" and category "([^"]*)"$/) do |itemName, itemLocation, itemTitle, itemCategory|
	toDoThings = waitForElements($driver, $wait, ".jsmbp-detail-items > div")
	topicHeader = toDoThings[itemLocation.to_i - 1].find_element(:css => ".item")
	aItemTitle = topicHeader.find_element(:css => "detail-title h2")
	category = topicHeader.find_element(:css => "detail-title p")
	compareWithLog("expected item title", itemTitle, refineElementTextContent(aItemTitle))
	compareWithLog("expected item category", itemCategory, refineElementTextContent(category).downcase)
end

Then(/^"Appv1" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
	aitemStatus = waitForElementXpath($driver, $wait, "//*[@class='title'][text()='" + itemName + "']/../div/*[@ng-if='seq.asmtStatus']")
	compareWithLog("expected item status", itemStatus, refineElementTextContent(aitemStatus))
end

Then(/^"Appv1" I go to the (topic|assessment) locating at "([^"]*)"$/) do |itemName, itemLocation|
	waitForLoadFinished($driver, $wait)
	toDoThing = waitForElements($driver, $wait, ".jsmbp-detail-items > div")[itemLocation.to_i - 1]
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
	one = waitForElements($driver, $wait, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
	aQuestionName = refineElementTextContent(one.find_element(:css => ".item h2"))
	aQuestionDescription = findElementWithParent(one, "div[ng-if='question.description']")
	compareWithLog("expected question name", questionName, aQuestionName)
	if aQuestionDescription != nil
		compareWithLog("expected question description", questionDescription, refineElementTextContent(aQuestionDescription))
	end
end

Then(/^"Appv1" I do the text question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $wait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	answerContainer.find_element(:css => "textarea").send_keys(questionAnswer)
end

Then(/^"Appv1" I do the (oneof|team member selector) question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionType, questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $wait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	selectOption = answerContainer.find_element(:css => ".list > label:nth-of-type(" + questionAnswer + ")")
	scrollIfNotVisible($driver, selectOption)
	selectOption.click()
end

Then(/^"Appv1" I do the multiple question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $wait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	answers = questionAnswer.split(",")
	answers.each do |ans|
		selectOption = answerContainer.find_element(:css => ".list > label:nth-of-type(" + ans + ")")
		scrollIfNotVisible($driver, selectOption)
		selectOption.click()
	end
end

Then(/^"Appv1" I do the (file|image|video) question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionType, questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $wait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scrollIfNotVisible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	waitForElement($driver, $wait, "#fsp-fileUpload").send_keys(questionAnswer)
	sleep 1
	while waitForElement($driver, $shortWait, ".fsp-picker--active") != nil
		sleep 1
	end
	sleep 4
end

Then(/^"Appv1" I do the video url question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $wait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	uploadBtn = answerContainer.find_element(:css => "div:nth-of-type(1) button:nth-of-type(1)")
	scrollIfNotVisible($driver, uploadBtn)
	uploadBtn.click()
	sleep 5
	waitForElement($driver, $wait, "#fsp-fileUpload").send_keys(questionAnswer)
	sleep 1
	while waitForElement($driver, $shortWait, ".fsp-picker--active") != nil
		sleep 1
	end
	sleep 4
end

Then(/^"Appv1" I go to the first milestone page$/) do
	step("\"Appv1\" I choose a program \"App V1 Selenium Program\"")
	step("\"Appv1\" I should see the app home screen")
	step("I wait 8 seconds")
	step("\"Appv1\" I go to the \"2\" tab page")
	step("I can see a group of \"milestones\" with total \"2\" which is located at \".view-container[nav-view='active'] .card\"")
	step("I wait 2 seconds")
	step("\"Appv1\" I go to the \"1\" milestone")
	step("I wait 3 seconds")
	step("I can see a group of \"assessments and topics\" with total \"8\" which is located at \".jsmbp-detail-items > div\"")
	step("I wait 2 seconds")
end

Then(/^"Appv1" I go to the second milestone page$/) do
	step("\"Appv1\" I choose a program \"App V1 Selenium Program\"")
	step("\"Appv1\" I should see the app home screen")
	step("I wait 8 seconds")
	step("\"Appv1\" I go to the \"2\" tab page")
	step("I can see a group of \"milestones\" with total \"2\" which is located at \".view-container[nav-view='active'] .card\"")
	step("I wait 2 seconds")
	step("\"Appv1\" I go to the \"2\" milestone")
	step("I wait 3 seconds")
	step("I can see a group of \"assessments and topics\" with total \"3\" which is located at \".jsmbp-detail-items > div\"")
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