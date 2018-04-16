Feature: AppV1 login
	As a student
	I want to login to the app
	so that I can experience the program contents
	
	Scenario: Test AppV1 Login Scenario
		Given I go to "https://appdev.practera.com"
		When I wait 10 seconds
		Then "Appv1" I login with the right username with a wrong password
		Then I should be able to see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		Then I click on "a button" which is located at ".popup > .popup-buttons > button"
		Then I wait 2 seconds
		Then "Appv1" I login with the right username with a right password
		Then I should not see "Invalid Login Details pop up" which is located at "//*[@class='popup-title'][text()='Invalid Login Details']" with xpath assert
		Then "Appv1" I can see desired program "App V1 Selenium Program"
		Then "Appv1" I choose a program "App V1 Selenium Program"
		Then "Appv1" I can see the app home screen
		Then "Appv1" I log out
		Then I wait 5 seconds