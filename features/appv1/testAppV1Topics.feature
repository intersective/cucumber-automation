Feature: AppV1 topics
	As a student
	I want to login to the app and do something with topics
	so that I can experience the program contents
	
	Scenario: Test AppV1 topics
		Given I go to "https://appdev.practera.com"
		Then I wait 10 seconds
		Then "Appv1" I login with the right username with a right password
		Then I wait until the loading finished
		Then "Appv1" I go to the first milestone page
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I go to the topic locating at "1"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I can see the topic with title "Topic 1" and content "This is the content of topic 1"
		Then "Appv1" I go back from topic page
		Then "Appv1" I log out