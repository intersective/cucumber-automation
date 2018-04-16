Feature: AppV1 topics and assessments
	As a student
	I want to login to the app and do something with topics and assessments
	so that I can experience the program contents
	
	Scenario: Test AppV1 topics and assessments
		Given I go to "https://appdev.practera.com"
		When I wait 10 seconds
		Then "Appv1" I login with the right username with a right password
		Then I should not see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		Then "Appv1" I choose a program "App V1 Selenium Program"
		Then "Appv1" I should see the app home screen
		Then I wait 6 seconds
		Then "Appv1" I can see the current milestone "Comprehensive Milestone" with status "UNLOCKED"
		Then I wait 2 seconds
		Then "Appv1" I go to the "2" tab page
		Then "Appv1" I can see "2" milestones
		Then I wait 2 seconds
		Then "Appv1" I go to the "1" milestone
		Then I wait 3 seconds
		Then "Appv1" I can see "8" assessments and topics
		Then I wait 2 seconds
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I go to the "topic" locating at "1"
		Then "Appv1" I can see the topic with title "Topic 1" and content "This is the content of topic 1"
		Then "Appv1" I go back from topic page
		Then "Appv1" I can see the "assessment" locating at "2" with title "Comprehensive Quiz" and category "assessment"
