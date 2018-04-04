Feature: Case Freemium Signup
	As an educator (coordinator)
	I want to sign up to Practera CASE
	so that I can run a project for my students

	Scenario: Test Case Freemium Signup
		Given I go to "http://localhost:4200/home"
		When I click on "the signup button" which is located at "//*[text()='Signup']/.." with xpath
		Then I should be able to see "the signup form" which is located at "app-signup > form"
		Then I wait 2 seconds
		Then I input "user_1" to "name input box" which is located at "app-signup > form input[ng-reflect-name='name']"
		Then I input "user_1@practera.com" to "email input box" which is located at "app-signup > form input[ng-reflect-name='email']"
		Then I input "user_1 org" to "organisation input box" which is located at "app-signup > form input[ng-reflect-name='organisation']"
		Then I input "12341234" to "password input box" which is located at "app-signup > form input[ng-reflect-name='password']"
		Then I click on "the signup submit button" which is located at "app-signup > form button" 
		Then I go to select case study page