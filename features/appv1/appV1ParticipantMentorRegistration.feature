Feature: AppV1 participants and mentors registration
	As program students and mentors
	We want to regist to the app
	so that We can log in to the app and experience the program content
	
	Scenario: Test AppV1 participants and mentors registration
		Given I use the registration link for student 1
		When I wait 5 seconds
		Then I type my own password "studentPassword" for registration
		Then I wait 2 seconds
		Then I move to "agree check box" which is located at ".item-checkbox" and click
		Then I wait 2 seconds
		Then I click on "Register button" which is located at "button[type='submit']"
		Then I can see "a pop up" which is located at ".popup-buttons"
		Then I click on "an ok button" which is located at ".popup-buttons > button:nth-of-type(1)"
		When I wait 10 seconds
		Then "Appv1" I should see the app home screen
		Then "Appv1" I log out
		Then I wait 3 seconds

		Given I use the registration link for mentor 1
		When I wait 5 seconds
		Then I type my own password "mentor2AccountPassword" for registration
		Then I wait 2 seconds
		Then I move to "agree check box" which is located at ".item-checkbox" and click
		Then I wait 2 seconds
		Then I click on "Register button" which is located at "button[type='submit']"
		Then I can see "a pop up" which is located at ".popup-buttons"
		Then I click on "an ok button" which is located at ".popup-buttons > button:nth-of-type(1)"
		When I wait 10 seconds
		Then "Appv1" I should see the app home screen
		Then "Appv1" I log out
		Then I wait 3 seconds