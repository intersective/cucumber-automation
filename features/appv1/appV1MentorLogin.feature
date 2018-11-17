Feature: AppV1 mentor login
	As a mentor
	I want to login to the app
	so that I can experience the program contents
	
	Scenario: Test AppV1 mentor login
		Given I go to App V1
		When "Appv1" I wait unitl the splash disappear
		Then "Appv1" I login with the mentor account and password "studentPassword"
		Then I should be able to see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		Then I click on "a button" which is located at ".popup > .popup-buttons > button"
		Then I wait 2 seconds
		Then "Appv1" I login with the mentor account and password "mentor2AccountPassword"
		Then I should not see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		When I wait until the loading finished
		Then "Appv1" I should see desired program "App V1 Selenium Program"
		Then "Appv1" I should see the app home screen
		Then "Appv1" I can see the current activity "Comprehensive Activity"
		Then "Appv1" I log out
		Then I wait 5 seconds