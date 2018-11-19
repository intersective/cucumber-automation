Feature: AppV1 peer moderated assessment
	As a student
	I want to login to the app and do something with moderated assessment
	so that I can experience the program contents
	and let my peer review my works
	
	Scenario: Test AppV1 peer moderated assessment
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the student account and password "studentPassword"
		Then "Appv1" I should see the app home screen
		When I wait until the loading finished
		Then "Appv1" I go to the "Activity Four" activity page which has "2" items
		Then "Appv1" I go to the assessment locating at "2"
		Then I can see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I do the text question locating at "1" with answer "This is the text from Selenium text automation"
		Then I wait 2 seconds
		Then "Appv1" I do the oneof question locating at "1" of group "2" with answer "Normal"
		Then I wait 2 seconds
		Then "Appv1" I do the multiple question locating at "1" of group "3" with answer "Choice 0.8,Choice 0.6"
		Then I wait 2 seconds
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