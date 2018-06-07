Feature: AppV1 topics
	As a student
	I want to login to the app and do something with topics
	so that I can experience the program contents
	
	Scenario: Test AppV1 topics
		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with the student account and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Comprehensive Activity" activity page which has "8" items
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I go to the topic locating at "1"
		Then I should be able to see "topic content page" which is located at ".pane[nav-view='active'] .activities"
		Then I can see "category topic" which is located at ".nav-bar-title" containing text "Topic"
		Then "Appv1" I can see the topic with title "Topic 1" and content "This is the content of topic 1"
		Then I should be able to see "mark topic" which is located at "//*[text()='Mark topic as read']" with xpath assert
		Then I click on "mark topic as read button" which is located at "//*[text()='Mark topic as read']/../../label" with xpath
		Then "Appv1" I go back from topic page
		Then "Appv1" I go to the "1" tab page
		Then I wait until the loading finished
		Then "Appv1" I go to the "Comprehensive Activity" activity page which has "8" items
		Then "Appv1" I go to the topic locating at "1"
		Then I should be able to see "topic content page" which is located at ".pane[nav-view='active'] .activities"
		Then I should be able to see "the topic marked as read" which is located at "[ng-click='markTopicDone()'][disabled='disabled']" with assert
		Then "Appv1" I go back from topic page
		Then "Appv1" I log out