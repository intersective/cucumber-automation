Feature: AppV1 reflection assessment
	As a student
	I want to login to the app and do something with reflection assessment
	so that I can experience the program contents
	
	Scenario: Test AppV1 reflection assessment
		Given I go to App V1
		Then I wait 10 seconds
		Then "Appv1" I login with the student account and password "12341234"
		Then I wait until the loading finished
		Then "Appv1" I go to the "Comprehensive Activity" activity page which has "9" items
		Then "Appv1" I go to the assessment locating at "3"
		Then I should be able to see "assessment page" which is located at ".pane[nav-view='active'] .activities"
		Then "Appv1" I do the text question locating at "1" with answer "This is the text from Selenium text automation"
		Then I wait 2 seconds
		Then "Appv1" I do the oneof question locating at "2" with answer "2"
		Then I wait 2 seconds
		Then "Appv1" I do the multiple question locating at "3" with answer "2,3"
		Then I wait 2 seconds
		Then "Appv1" I do the file question locating at "4" with answer "2017-Scrum-Guide-US.pdf"
		Then I wait 2 seconds
		Then "Appv1" I do the video question locating at "5" with answer "Video Upload issue 2.mp4"
		Then I wait 2 seconds
		Then "Appv1" I do the image question locating at "6" with answer "medium-size-dogs-a-medium.jpg"
		Then I wait 2 seconds
		Then "Appv1" I do the video url question locating at "7" with answer "WhatsApp Video 2017-11-30 at 11.27.14.mp4"
		Then I click on "submit button" which is located at "//button[text()='Submit']" with xpath scroll
		Then I should be able to see "a pop up" which is located at ".popup"
		Then I click on "the ok button" which is located at ".popup .popup-buttons > button:nth-of-type(2)"
		Then I wait 3 seconds
		Then I click on "the ok button" which is located at ".popup> .popup-buttons > button"
		Then I wait 2 seconds
		Then I click on "the pop up button" which is located at ".modal button"
		Then I wait until the loading finished
		Then "Appv1" I log out