Feature: AppV1 topics
	As a student
	I want to login to the app and do something with topics
	so that I can experience the program contents
	
	Scenario: Test AppV1 topics
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the student account and password "studentPassword"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I go to the topic locating at "1"
		Then I should be able to see "topic content page" which is located at ".pane[nav-view='active'] .activities"
		Then I can see "category topic" which is located at ".nav-bar-title" containing text "Topic"
		Then "Appv1" I can see the topic with title "Topic 1" and content "This is the content of topic 1"
		Then I should see "mark topic" which is located at "//*[text()='Mark topic as read']" with xpath
		Then I click on "mark topic as read button" which is located at "//*[text()='Mark topic as read']/../../label" with xpath
		Then "Appv1" I go back from topic page
		Then "Appv1" I go to the "Home" tab page
		Then I wait until the loading finished
		Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
		Then "Appv1" I go to the topic locating at "1"
		Then I should be able to see "topic content page" which is located at ".pane[nav-view='active'] .activities"
		Then I should see "the topic marked as read" which is located at "[ng-click='markAsDone()'][disabled='disabled']"
		When "Appv1" I go back from topic page
		Then "Appv1" I log out