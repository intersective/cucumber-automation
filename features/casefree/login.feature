Feature: Case Freemium Login
	As a educator
	I want to login 
	so that I can manage my projects and enrolments

	Scenario: Test Case Freemium Login
		Given I go to "http://localhost:4200/home"
		When I click on "the login button" which is located at "//*[text()='Login']/.." with xpath
		Then I should be able to see "the login form" which is located at "app-login"
		Then I input "12312313@practera.com" to "email input box" which is located at "app-login input[ng-reflect-name='email']"
		Then I input "12341234" to "password input box" which is located at "app-login input[ng-reflect-name='password']"
		Then I click on "login submit button" which is located at "app-login button"
		Then I should be able to see "the project list" which is located at "//*[text()='Projects']" with xpath