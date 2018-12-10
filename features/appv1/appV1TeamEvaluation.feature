Feature: AppV1 Team Evaluation
	As a student
	I want to login to the app and do something with team evaluation
	so that I can evaluate my team members
	
	Scenario: Test AppV1 Team Evaluation
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1 Team" I login with team member "student1" and password "studentPassword" and domain "practera.com"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity 2" activity page which has "3" items
		Then "Appv1" I can see the "topic" locating at "1" with title "Topic 1" and category "topic"
		Then "Appv1" I can see the "assessment" locating at "3" with title "Evaluation questions 2" and category "assessment"
		Then "Appv1" I go to the assessment "Evaluation questions 2"
		Then I wait until the loading finished
		Then I can see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1 Team" I should be able to select "student2" from selector options
		Then "Appv1" I do the text question locating at "2" with answer "he is a friendly and hard working person"
		Then "Appv1" I do the oneof question locating at "3" of group "1" with answer "Good"
		Then "Appv1" I do the oneof question locating at "4" of group "1" with answer "Just Ok"
		When I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I can see "a submit confirmation" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I can see "a submission notification" which is located at ".popup"
		Then I wait 3 seconds
		Then I click on "the continue button" which is located at ".popup > .popup-buttons > button"
		Then I wait 3 seconds
		Then I can see "a submission successful message" which is located at ".modal"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".modal button"
		Then I wait until the loading finished
		Then "Appv1" I log out