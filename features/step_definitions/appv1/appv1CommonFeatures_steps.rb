

Then(/^"Appv1" I go to the "([^"]*)" tab page$/) do |tabName|
	tabLocator = "//*[@class='tab-title'][normalize-space()='%s']/.." % [tabName]
	waitForElementVisibleXpath($driver, $wait, tabLocator).click()
	waitForLoadFinished($driver, $wait)
end

Then("\"Appv1\" I go to the {string} activity") do |activityTitle|
	activities = waitForElements($driver, $listWait, ".view-container[nav-view='active'] .card")
	activities.each do |activity|
		if activityTitle == refineElementTextContent(activity.find_element(:css => ".title"))
			scrollIfNotVisible($driver, activity)
			activity.click()
			break
		end
	end
end

Then(/^"Appv1" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > h1"))
	aActDescription = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > p"))
	verifyValue("expected activity name", actName, aActName)
	verifyValue("expected activity description", actDescription, aActDescription)
end

Then(/^"Appv1" I can see the "([^"]*)" locating at "([^"]*)" with title "([^"]*)" and category "([^"]*)"$/) do |itemName, itemLocation, itemTitle, itemCategory|
	toDoThings = waitForElements($driver, $listWait, ".jsmbp-detail-items > div")
	topicHeader = toDoThings[itemLocation.to_i - 1].find_element(:css => ".item")
	aItemTitle = topicHeader.find_element(:css => "detail-title h2")
	category = refineElementTextContent(topicHeader.find_element(:css => "detail-title p")).split(" ")[0].downcase
	verifyValue("expected item title", itemTitle, refineElementTextContent(aItemTitle))
	verifyValue("expected item category", itemCategory, category)
end

Then(/^"Appv1" I can see the "([^"]*)" with status "([^"]*)"$/) do |itemName, itemStatus|
	aitemStatus = waitForElementXpath($driver, $wait, "//*[@class='title'][text()='" + itemName + "']/../p")
	verifyValue("expected item status", itemStatus, refineElementTextContent(aitemStatus))
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
	verifyValue("expected topic title", topicTitle, aTopicTitle)
	verifyValue("expected topic content", topicContent, aTopicContent)
end

Then(/^"Appv1" I go back from (topic|assessment|chat) page$/) do |itemName|
	waitForElementVisible($driver, $wait, ".nav-bar-block[nav-bar=active] .back-button[ng-click]:not(.hide)").click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I can see the assessment with name "([^"]*)" and description "([^"]*)"$/) do |assessmentTitle, assessmentDescription|
	aAssessmenTitle = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.name'] > h1"))
	aAssessmenDescription = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities div[ng-if='assessment.description']"))
	verifyValue("expected assessment title", assessmentTitle, aAssessmenTitle)
	verifyValue("expected assessment description", assessmentDescription, aAssessmenDescription)
end

Then(/^"Appv1" I can see the question locating at "([^"]*)" with name "([^"]*)" and description "([^"]*)"$/) do |questionIndex, questionName, questionDescription|
	one = waitForElements($driver, $listWait, "div[ng-repeat='question in group.questions']")[questionIndex.to_i - 1]
	aQuestionName = refineElementTextContent(one.find_element(:css => ".item h2"))
	aQuestionDescription = findElementWithParent(one, "div[ng-if='question.description']")
	verifyValue("expected question name", questionName, aQuestionName)
	if aQuestionDescription != nil
		verifyValue("expected question description", questionDescription, refineElementTextContent(aQuestionDescription))
	end
end

Then(/^"Appv1" I do the text question locating at "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, questionAnswer|
	answerContainer = $appv1PageActions.getQuestionAnswerContainer($driver, $listWait, questionIndex)
	scrollIfNotVisible($driver, answerContainer)
	answerContainer.find_element(:css => "textarea").send_keys(questionAnswer)
end

Then(/^"Appv1" I do the oneof question locating at "([^"]*)" of group "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, groupIndex, questionAnswer|
	selectPath = "//*[@ng-repeat='group in groupQuestion'][%s]/*[@ng-repeat='question in group.questions'][%s]//label//span[normalize-space()='%s']/../../.." % [groupIndex, questionIndex, questionAnswer]
	option = waitForElementXpath($driver, $wait, selectPath)
	scrollIfNotVisible($driver, option)
	option.click()
end

Then(/^"Appv1" I do the multiple question locating at "([^"]*)" of group "([^"]*)" with answer "([^"]*)"$/) do |questionIndex, groupIndex, questionAnswer|
	answers = questionAnswer.split(",")
	answers.each do |ans|
		selectPath = "//*[@ng-repeat='group in groupQuestion'][%s]/*[@ng-repeat='question in group.questions'][%s]//label//span[normalize-space()='%s']/../.." % [groupIndex, questionIndex, ans]
		option = waitForElementXpath($driver, $wait, selectPath)
		scrollIfNotVisible($driver, option)
		option.click()
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

Then("\"Appv1\" I go to the {string} activity page which has {string} items") do |activityTitle, numberOfItems|
	# step("\"Appv1\" I choose a program \"App V1 Selenium Program\"")
	step("\"Appv1\" I should see the app home screen")
	step("I wait 8 seconds")
	step("\"Appv1\" I go to the \"Activities\" tab page")
	step("I can see a group of \"milestones\" with total \"4\" which is located at \".milestone-header\"")
	step("I wait 2 seconds")
	step("\"Appv1\" I go to the \"#{activityTitle}\" activity")
	step("I wait 3 seconds")
	step("I can see a group of \"assessments and topics\" with total \"#{numberOfItems}\" which is located at \".jsmbp-detail-items > div\"")
	step("I wait 2 seconds")
end

Then(/^I wait until the loading finished$/) do
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I should be able to select "([^"]*)" from selector options which is located at "([^"]*)"$/) do |selectOption, selectorPath|
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
	$sharedData1.putData(Application.KEY_PROGRESS, progress)
end

Then("\"Appv1\" I should have the same overall project progress") do
	progress = refineElementTextContent(waitForElement($driver, $wait, ".progress-title"))
	progress1 = $sharedData1.loadDataFromKey(Application.KEY_PROGRESS)
	if progress != progress1
		fail("I should have the same overall project progress")
	end
end

Then("\"Appv1\" I wait unitl the splash disappear") do
	sleep 10
end

Then(/^"Appv1" I can go to the review page with a student "([^"]*)" submission and the assessment "([^"]*)"$/) do |studentName, assessmentName|
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

Then(/^"Appv1" I can go to the review page with the student(|[1-9]+[0-9]*) submission and the assessment "([^"]*)"$/) do |arg1, assessmentName|
	studentName = getUserFromData(arg1, Application.KEY_ROLE_STUDENT).name
	step("\"Appv1\" I can go to the review page with a student \"#{studentName}\" submission and the assessment \"#{assessmentName}\"")
end
