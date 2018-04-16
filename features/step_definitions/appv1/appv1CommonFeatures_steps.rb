

Then(/^"Appv1" I login with username "([^"]*)" and password "([^"]*)"$/) do |userName, userPassword|
	$appv1PageActions.login($driver, $wait, userName, userPassword)
end

Then(/^"Appv1" I log out$/) do
	$appv1PageActions.logout($driver, $wait)
end

Then(/^"Appv1" I go to the "([^"]*)" tab page$/) do |tabIndex|
	waitForElementVisible($driver, $wait, ".tab-nav > a:nth-of-type(" + tabIndex + ")").click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I can see "([^"]*)" milestones$/) do |numberOfMilestones|
	milestones = waitForElements($driver, $wait, ".view-container[nav-view='active'] .card")
	while milestones.length != numberOfMilestones.to_i
		sleep 1
		milestones = waitForElements($driver, $wait, ".view-container[nav-view='active'] .card")
	end
end

Then(/^"Appv1" I go to the "([^"]*)" milestone$/) do |milestoneLocation|
	milestone = waitForElementVisibleWithInAGroup($driver, $wait, ".view-container[nav-view='active'] .card", milestoneLocation)
	milestone.click()
end

Then(/^"Appv1" I can see "([^"]*)" assessments and topics$/) do |numberOfObjects|
	toDoThings = waitForElements($driver, $wait, ".jsmbp-detail-items > div")
	while toDoThings.length != numberOfObjects.to_i
		sleep 1
		toDoThings = waitForElements($driver, $wait, ".jsmbp-detail-items > div")
	end
end

Then(/^"Appv1" I can see the activity name "([^"]*)" and description "([^"]*)"$/) do |actName, actDescription|
	aActName = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > h1"))
	aActDescription = refineElementTextContent(waitForElement($driver, $wait, "jsmbp-detail-container > div > .item > p"))
	if actName != aActName
		$testLogger1.logCase("expected activity name [ " + actName + " ] but found [ " + aActName + " ]")
	end
	if actDescription != aActDescription
		$testLogger1.logCase("expected activity description [ " + actDescription + " ] but found [ " + aActDescription + " ]")
	end
end

Then(/^"Appv1" I can see the "([^"]*)" locating at "([^"]*)" with title "([^"]*)" and category "([^"]*)"$/) do |itemName, itemLocation, itemTitle, itemCategory|
	toDoThings = waitForElements($driver, $wait, ".jsmbp-detail-items > div")
	topicHeader = toDoThings[itemLocation.to_i - 1].find_element(:css => ".item")
	aItemTitle = topicHeader.find_element(:css => "detail-title h2")
	if itemTitle != refineElementTextContent(aItemTitle)
		$testLogger1.logCase("expected item title [ " + itemTitle + " ] but found [ " + aItemTitle + " ]")
	end
	category = topicHeader.find_element(:css => "detail-title p")
	if itemCategory != refineElementTextContent(category).downcase
		$testLogger1.logCase("expected item title [ " + itemCategory + " ] but found [ " + category + " ]")
	end
end

Then(/^"Appv1" I go to the "([^"]*)" locating at "([^"]*)"$/) do |itemName, itemLocation|
	toDoThing = waitForElementVisibleWithInAGroup($driver, $wait, ".jsmbp-detail-items > div", itemLocation)
	toDoThing.click()
	waitForLoadFinished($driver, $wait)
end

Then(/^"Appv1" I can see the topic with title "([^"]*)" and content "([^"]*)"$/) do |topicTitle, topicContent|
	waitForElements($driver, $wait, ".pane[nav-view='active'] .activities")
	aTopicTitle = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities h3"))
	if topicTitle != aTopicTitle
		$testLogger1.logCase("expected topic title [ " + topicTitle + " ] but found [ " + aTopicTitle + " ]")
	end
	aTopicContent = refineElementTextContent(waitForElement($driver, $wait, ".pane[nav-view='active'] .activities .item-body"))
	if topicContent != aTopicContent
		$testLogger1.logCase("expected topic content [ " + topicContent + " ] but found [ " + aTopicContent + " ]")
	end
end

Then(/^"Appv1" I go back from topic page$/) do
	waitForElementVisible($driver, $wait, ".nav-bar-block[nav-bar=active] .back-button").click()
end
