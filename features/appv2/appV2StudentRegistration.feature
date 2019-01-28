Feature: AppV2 student registration
	As a program student
	I want to regist to the app
	so that I can log in to the app and experience the program content
	
	Scenario: Test AppV1 student registration
		Given I use the registration link for student 1
		When I wait 5 seconds
		Then "Appv2" I type my own password "studentPassword" for registration
		Then I wait 2 seconds
		Then I click on "check box" which is located at "ion-checkbox[name='isAgreed']"
		Then I wait 2 seconds
		Then I click on "Register button" which is located at "//ion-checkbox[@name='isAgreed']/../../following-sibling::ion-button" with xpath
		Then I can see "a pop up" which is located at "app-pop-up"
		Then I click on "an ok button" which is located at "app-pop-up ion-button"
		When I wait 10 seconds
		Then "Appv2" I choose a program "App V2 Automation Program"
		Then "Appv2" I wait for loading finished
		Then "Appv2" I can see progress 0
		Then "Appv2" I log out
		Then I wait 5 seconds