Feature: AppV1 Team Evaluation
	As a student
	I want to login to the app and do something with team evaluation
	so that I can evaluate my team members
	
	Scenario: Test AppV1 Team Evaluation
		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with username "selenium.20180619103038@practera.com" and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity 2" activity page which has "3" items
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I can see the "assessment" locating at "2" with title "Evaluation questions" and category "assessment"
		Then "Appv1" I go to the assessment locating at "2"
		Then I wait until the loading finished
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I should be able to select "selenium.20180619113736" to team member selector which is located at "//*[@ng-repeat='question in group.questions'][1]//label[1]"
		Then I input "selenium.20180619113736 is a friendly and hard working person" to "evluation text area" which is located at "//*[@ng-repeat='question in group.questions'][2]//textarea" with xpath scroll
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a pop up" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".popup> .popup-buttons > button"
		Then I wait 2 seconds
		Then I click on "the pop up button" which is located at ".modal button"
		Then I wait until the loading finished
		Then "Appv1" I log out