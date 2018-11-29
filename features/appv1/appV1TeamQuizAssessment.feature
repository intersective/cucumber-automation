Feature: AppV1 Team Quiz Assessment
	As a student
	I want to login to the app and do something with team Assessment
	so that I can work with my team mates
	
	Scenario: Test Team Quiz Assessment
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the student account and password "studentPassword"
		Then "Appv1" I should see the app home screen
		Then I wait until the loading finished
		Then "Appv1" I go to the "Activity Five" activity page which has "1" items
		Then "Appv1" I can see the "assessment" locating at "1" with title "Team quiz assessment" and category "assessment"
		Then "Appv1" I go to the assessment locating at "1"
		Then I wait until the loading finished
		Then I can see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I do the text question locating at "1" with answer "we are working well"
		Then "Appv1" I do the oneof question locating at "2" of group "1" with answer "Choice One"
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I can see "a submit confirmation" which is located at ".popup"
		When I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
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